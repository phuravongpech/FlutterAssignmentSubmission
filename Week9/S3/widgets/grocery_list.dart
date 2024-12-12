import 'package:flutter/material.dart';
import 'package:vong_flutter/Week9/S3/widgets/new_item.dart';
import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      content = const GroceryTile();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => const NewItem()))
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dummyGroceryItems.length,
        itemBuilder: (content, index) {
          final item = dummyGroceryItems[index];
          return ListTile(
            leading: Icon(
              Icons.square,
              color: item.category.color,
              size: 24,
            ),
            title: Text(item.name),
            subtitle: Text(item.category.name),
            trailing: Text(item.quantity.toString()),
          );
        });
  }
}
