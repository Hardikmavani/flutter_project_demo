import 'package:flutter/material.dart';
import 'package:flutter_project_demo/core/store.dart';
import 'package:flutter_project_demo/models/cart_model.dart';
import 'package:flutter_project_demo/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart!;

    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
              builder: (context, store, status) => Text(
                    '\$${cart.totalPrice}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: MyTheme.darkBluishColor),
                  ),
              mutations: const {RemoveMutation}),
          const SizedBox(width: 50),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyTheme.darkBluishColor)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Buying not supported yet')));
              },
              child: const Text(
                'Buy',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
