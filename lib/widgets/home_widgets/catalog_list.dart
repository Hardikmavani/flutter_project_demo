import 'package:flutter/material.dart';
import 'package:flutter_project_demo/models/catalog.dart';
import 'package:flutter_project_demo/pages/home_detail_page.dart';
import 'package:flutter_project_demo/widgets/home_widgets/catalog_item.dart';

class CatalogList extends StatelessWidget { 
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return HomeDetailsPage(catalog: catalog);
                  },
                )),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}
