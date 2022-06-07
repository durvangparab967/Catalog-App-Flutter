import 'package:flutter_app1/core/store.dart';
import 'package:flutter_app1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // Catalog field
  late CatalogModel catalog;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // CatalogModel get catalog => _catalog;

  // set catalog(CatalogModel newCatalog) {
  //   _catalog = newCatalog;
  // }

  // Get items in cart
  List<Item> get items => _itemIds.map((id) => catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
