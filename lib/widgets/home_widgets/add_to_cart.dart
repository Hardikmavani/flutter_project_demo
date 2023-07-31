import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_demo/core/store.dart';
import 'package:flutter_project_demo/models/cart_model.dart';
import 'package:flutter_project_demo/models/catalog.dart';
import 'package:flutter_project_demo/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);

    final CartModel cart = (VxState.store as MyStore).cart!;

    bool isInCart = cart.items.contains(catalog);
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const StadiumBorder()),
            backgroundColor:
                MaterialStateProperty.all(MyTheme.darkBluishColor)),
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
          }
        },
        child: isInCart
            ? const Icon(Icons.done)
            : const Icon(CupertinoIcons.cart_badge_plus));
  }
}
