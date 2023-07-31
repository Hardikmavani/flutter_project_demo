import 'package:flutter_project_demo/core/store.dart';
import 'package:flutter_project_demo/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // catalog field
  CatalogModel? _catalog;
  // collection of IDs -store IDs each item
  final List<int> _itemIds = [];
  // Get catalog
  CatalogModel get catalog => _catalog!;
  set catalog(CatalogModel newCatalog) {
    // ignore: unnecessary_null_comparison
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get item in the cart

  List<Item?> get items => _itemIds.map((id) => _catalog!.getId(id)).toList();

  // get total price

  num get totalPrice =>
      items.fold(0, (total, current) => total + current!.price!);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart!._itemIds.add(item.id!);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart!._itemIds.remove(item.id!);
  }
}
