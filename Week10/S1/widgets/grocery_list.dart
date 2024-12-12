// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../data/dummy_items.dart';
import '../models/grocery_item.dart';
import 'new_item.dart';
import 'package:uuid/uuid.dart';

final Uuid uuid = Uuid();

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  Future<void> _addItem() async {
    final passedData = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    print('passed data : ');
    if (passedData != null) {
      print(passedData.name);
      setState(() {
        dummyGroceryItems.add(passedData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: dummyGroceryItems.length,
        itemBuilder: (ctx, index) =>
            GroceryTile(dummyGroceryItems[index], onEdit: (updatedItem) {
          setState(() {
            final index = dummyGroceryItems
                .indexWhere((item) => item.id == updatedItem.id);
            dummyGroceryItems[index] = updatedItem;
          });
        }),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile(this.groceryItem, {super.key, required this.onEdit});

  final GroceryItem groceryItem;
  final Function(GroceryItem) onEdit;

  @override
  Widget build(BuildContext context) {
    void editItem() async {
      final updatedItem = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewItem(
                    groceryItem: groceryItem,
                  )));

      print(updatedItem.name);
      // Find and update the item in dummyGroceryItems
      onEdit(updatedItem);
    }

    return ListTile(
      title: Text(groceryItem.name),
      leading: Container(
        width: 24,
        height: 24,
        color: groceryItem.category.color,
      ),
      trailing: Text(
        groceryItem.quantity.toString(),
      ),
      onTap: editItem,
    );
  }
}
