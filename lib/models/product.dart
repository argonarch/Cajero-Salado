import 'package:isar/isar.dart';
part 'product.g.dart';

@collection
class Product {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  String name;
  double price;
  double profit;

  Product(this.name, this.price, this.profit);

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = json['price'],
        profit = json['profit'];
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'profit': profit,
      };

  Future<List<Product>> jsonToProduct(List<dynamic> jsonWithItems) async {
    List<Product> data =
        jsonWithItems.map((json) => Product.fromJson(json)).toList();
    return data;
  }

  double priceWithProfit() {
    return price * profit;
  }
}
