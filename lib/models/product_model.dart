class Product {
  String? image;
  String? title;
  String? price;
  String? category;

  Product({this.image, this.title, this.price, this.category});

  Product.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    price = json['price'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['price'] = price;
    data['category'] = category;
    return data;
  }
}
