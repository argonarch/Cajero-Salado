import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:cajero_salado/models/product.dart';

saveProduct(String name, double price, double profit) async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [ProductSchema],
    directory: dir.path,
  );
  Product product = Product(name, price, profit);
  await isar.writeTxn(() async {
    await isar.products.put(product);
  });
}
