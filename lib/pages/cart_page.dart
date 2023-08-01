import 'package:flutter/material.dart';
import 'package:flutter_project_demo/pages/cart_list.dart';
import 'package:flutter_project_demo/pages/cart_total.dart';
import 'package:flutter_project_demo/widgets/themes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'Cart',
          style: TextStyle(color: MyTheme.darkBluishColor),
        ),
      ),
      body: const Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(30.0),
            child: CartList(),
          )),
          Divider(),
          CartTotal()
        ],
      ),
    );
  }
}
