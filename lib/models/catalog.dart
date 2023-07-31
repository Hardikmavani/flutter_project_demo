import 'dart:convert';

class CatalogModel {
  static List<Item>? items;

  // Get Item by ID
  Item? getId(int id) =>
      // ignore: null_closures
      items!.firstWhere((element) => element.id == id, orElse: null);

  // Get item by position

  Item? getByPosition(int pos) => items![pos];
}

class Item {
  final int? id;
  final String? name;
  final String? desc;
  final String? color;
  final String? imageUrl;
  final int? price;

  Item({
    this.id,
    this.name,
    this.desc,
    this.color,
    this.imageUrl,
    this.price,
  });

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    String? color,
    String? imageUrl,
    int? price,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      color: color ?? this.color,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'color': color,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id']?.toInt(),
      name: map['name'],
      desc: map['desc'],
      color: map['color'],
      imageUrl: map['imageUrl'],
      price: map['price']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, color: $color, imageUrl: $imageUrl, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.color == color &&
        other.imageUrl == imageUrl &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        color.hashCode ^
        imageUrl.hashCode ^
        price.hashCode;
  }
}
