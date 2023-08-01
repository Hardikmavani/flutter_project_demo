import 'package:flutter/material.dart';
import 'package:flutter_project_demo/core/store.dart';
import 'package:flutter_project_demo/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart!;
    return cart.items.isEmpty
        ? const Center(
            child: Text(
            'Nothing to Show',
            style: TextStyle(fontSize: 30),
          ))
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(cart.items[index]!.name!),
              leading: const Icon(Icons.done),
              trailing: IconButton(
                  onPressed: () => RemoveMutation(cart.items[index]!),
                  icon: const Icon(Icons.remove_outlined)),
            ),
          );
  }
}
