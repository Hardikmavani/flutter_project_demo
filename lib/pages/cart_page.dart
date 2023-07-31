import 'package:flutter/material.dart';
import 'package:flutter_project_demo/core/store.dart';
import 'package:flutter_project_demo/models/cart_model.dart';
import 'package:flutter_project_demo/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
