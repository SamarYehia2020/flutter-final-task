import 'dart:convert';

class Address {
  Address({
    this.id,
    this.title,
    this.city,
    this.street,
    this.image,
  });

  int? id;
  String? title;
  String? city;
  String? street;
  String? image;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        title: json["title"],
        city: json["city"],
        street: json["street"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "city": city,
        "street": street,
        "image": image,
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.image,
  });

  int? id;
  String? name;
  String? image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

class Product {
  Product({
    this.id,
    this.title,
    this.quantity,
    this.shipping,
    this.photo,
    this.price,
    this.specila,
  });

  int? id;
  String? title;
  String? quantity;
  String? shipping;
  String? photo;
  int? price;
  int? specila;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        quantity: json["quantity"],
        shipping: json["shipping"],
        photo: json["photo"],
        price: json["price"],
        specila: json["specila"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "quantity": quantity,
        "shipping": shipping,
        "photo": photo,
        "price": price,
        "specila": specila,
      };
}
