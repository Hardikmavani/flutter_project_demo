import 'package:flutter/material.dart';
import 'package:flutter_project_demo/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item? item;
  const ItemWidget({super.key, required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        leading: Image.network(item!.imageUrl.toString()),
        title: Text(item!.name.toString()),
        subtitle: Text(item!.desc.toString()),
        trailing: Text(
          '\$${item!.price}',
          textScaleFactor: 1.4,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
