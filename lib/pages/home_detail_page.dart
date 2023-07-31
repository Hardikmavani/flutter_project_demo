import 'package:flutter/material.dart';

import 'package:flutter_project_demo/models/catalog.dart';
import 'package:flutter_project_demo/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_project_demo/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item? catalog;
  const HomeDetailsPage({
    Key? key,
    @required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog!.price!}".text.bold.xl3.color(Colors.red).make(),
              const SizedBox(
                width: 70,
              ),
              AddToCart(catalog: catalog!),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: MyTheme.creamColor,
        body: Column(
          children: [
            Center(
                child: Hero(
                        tag: Key(catalog!.id.toString()),
                        child: Image.network(catalog!.imageUrl.toString()))
                    .h32(context)),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                width: context.screenWidth,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    children: [
                      catalog!.name!.text.xl4
                          .color(MyTheme.darkBluishColor)
                          .bold
                          .make(),
                      catalog!.desc!.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                      40.heightBox,
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'The iPhone 12 Pro display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle. When measured as a standard rectangular shape, the screen is 6.06 inches diagonally (actual viewable area is less).',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
