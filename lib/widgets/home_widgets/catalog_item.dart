import 'package:flutter/material.dart';
import 'package:flutter_project_demo/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_project_demo/models/catalog.dart';
import 'package:flutter_project_demo/widgets/home_widgets/catalog_image.dart';
import 'package:flutter_project_demo/widgets/themes.dart';

class CatalogItem extends StatelessWidget {
  final Item? catalog;

  const CatalogItem({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog!.id.toString()),
          child: CatalogImage(
            image: catalog!.imageUrl,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${catalog!.name}',
              style: TextStyle(
                  color: MyTheme.darkBluishColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text('${catalog!.desc}'),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  Text(
                    '\$${catalog!.price}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  AddToCart(catalog: catalog!)
                ],
              ),
            )
          ],
        ))
      ],
    )).white.rounded.square(150).make().px1();
  }
}
