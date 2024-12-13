// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../data/dummy_items.dart';
import '../models/grocery_item.dart';
import 'new_item.dart';

enum Mode { selection, normal }

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  late Mode mode;

  // Map<String, bool> selectedItem = {};
  List<String> selectedItems = [];

  @override
  void initState() {
    super.initState();
    mode = Mode.normal;
  }

  void _addItem() async {
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

  void _editItem(GroceryItem groceryItem) async {
    final updatedItem = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewItem(
                  groceryItem: groceryItem,
                )));

    print(updatedItem.name);
    final index =
        dummyGroceryItems.indexWhere((item) => item.id == updatedItem.id);
    setState(() {
      dummyGroceryItems[index] = updatedItem;
    });
  }

  void changeMode() {
    setState(() {
      mode = mode == Mode.normal ? Mode.selection : Mode.normal;
      if (mode == Mode.normal) {
        selectedItems.clear();
      }
    });
  }

  void toogleSelectedItem(String itemId) {
    setState(() {
      if (selectedItems.contains(itemId)) {
        selectedItems.remove(itemId);
      } else {
        selectedItems.add(itemId);
      }
    });
    print(selectedItems);
  }

  void deletedSelectedItem() {
    setState(() {
      dummyGroceryItems.removeWhere((item) => selectedItems.contains(item.id));
      selectedItems.clear();
      mode = Mode.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      content = ReorderableListView.builder(
        itemCount: dummyGroceryItems.length,
        itemBuilder: (ctx, index) => GroceryTile(
          dummyGroceryItems[index],
          key: UniqueKey(),
          onEdit: _editItem,
          mode: mode,
          onLongPress: changeMode,
          onToggleSelectedItem: toogleSelectedItem,
          isSelected: selectedItems.contains(dummyGroceryItems[index].id),
        ),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final GroceryItem item = dummyGroceryItems.removeAt(oldIndex);
            dummyGroceryItems.insert(newIndex, item);
          });
        },
      );
    }

    return Scaffold(
      appBar: mode == Mode.normal
          ? AppBar(
              title: const Text('Your Groceries'),
              actions: [
                IconButton(
                  onPressed: _addItem,
                  icon: const Icon(Icons.add),
                ),
              ],
            )
          : AppBar(
              title: Text('${selectedItems.length} items(s) selected'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  setState(() {
                    mode = Mode.normal;
                  });
                },
              ),
              actions: [
                IconButton(
                  onPressed: deletedSelectedItem,
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile(this.groceryItem,
      {super.key,
      required this.onEdit,
      required this.mode,
      required this.onLongPress,
      required this.isSelected,
      required this.onToggleSelectedItem});

  final GroceryItem groceryItem;
  final Function(GroceryItem) onEdit;
  final VoidCallback onLongPress;
  final Mode mode;
  final bool isSelected; // Indicates if the item is selected
  final Function(String)
      onToggleSelectedItem; // Callback for toggling selection

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(groceryItem.name),
      onLongPress: onLongPress,
      leading: mode == Mode.normal
          ? Container(
              width: 24,
              height: 24,
              color: groceryItem.category.color,
            )
          : Checkbox(
              value: isSelected, // Use the selection state from parent
              onChanged: (bool? value) {
                if (value != null) {
                  onToggleSelectedItem(
                      groceryItem.id); // Toggle selection state
                }
              },
            ),
      trailing: Text(groceryItem.quantity.toString()),
      onTap: () {
        if (mode == Mode.normal) {
          onEdit(groceryItem);
        } else {
          onToggleSelectedItem(groceryItem.id); // Toggle selection state
        }
      },
    );
  }
}
