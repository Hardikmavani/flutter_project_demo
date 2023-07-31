import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_demo/core/store.dart';
import 'package:flutter_project_demo/models/cart_model.dart';
import 'package:flutter_project_demo/utils/routes.dart';
import 'package:flutter_project_demo/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_project_demo/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_project_demo/models/catalog.dart';
import 'package:flutter_project_demo/widgets/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    //print(catalogJson);
    var decodeData = jsonDecode(catalogJson);
    //print(decodeData);
    var productData = decodeData["products"];
    // print(productData);
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, store, status) {
          return FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cartRoute);
            },
            backgroundColor: MyTheme.darkBluishColor,
            child: const Icon(CupertinoIcons.cart),
          ).badge(
              color: Colors.grey,
              size: 22,
              count: cart!.items.length,
              textStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold));
        },
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m20,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
              const CatalogList().expand()
            else
              const CircularProgressIndicator().centered().py16().expand()
          ]),
        ),
      ),
    );
  }
}
