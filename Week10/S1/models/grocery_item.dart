import 'grocery_category.dart';
import 'package:uuid/uuid.dart';

class GroceryItem {
  static const Uuid uuid = Uuid();

  GroceryItem({
    String? id,
    required this.name,
    required this.quantity,
    required this.category,
  }) : id = id ?? uuid.v4();

  final String id;
  final String name;
  final int quantity;
  final GroceryCategory category;
}
