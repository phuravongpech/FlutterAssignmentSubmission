// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vong_flutter/Week10/S1/models/grocery_item.dart';
import '../models/grocery_category.dart';
import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

enum ScreenMode { editing, creating }

class NewItem extends StatefulWidget {
  final GroceryItem? groceryItem;
  const NewItem({super.key, this.groceryItem});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  @override
  void initState() {
    super.initState();
    mode =
        widget.groceryItem == null ? ScreenMode.creating : ScreenMode.editing;
    _defaultCategory = mode == ScreenMode.editing
        ? widget.groceryItem!.category
        : GroceryCategory.vegetables;
  }

  // We create a key to access and control the state of the Form.
  final _formKey = GlobalKey<FormState>();

  String _enteredName = '';
  String _enteredQuantity = '';
  late GroceryCategory _defaultCategory;
  late ScreenMode mode;

  void _saveItem() {
    // 1 - Validate the form
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      // 2 - Save the form to get last entered values
      _formKey.currentState!.save();

      print("Name $_enteredName");
      print("Quantity $_enteredQuantity");
      print("Category ${_defaultCategory.label}");

      final returnItem = GroceryItem(
          id: mode == ScreenMode.creating ? uuid.v4() : widget.groceryItem!.id,
          name: _enteredName,
          quantity: int.parse(_enteredQuantity),
          category: _defaultCategory);

      Navigator.pop(context, returnItem);
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
  }

  String? validateTitle(String? value) {
    if (value == null || value.isEmpty || value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }

  String? validateQuantity(String? value) {
    if (value == null || int.tryParse(value) == null || int.parse(value) <= 0) {
      return 'Must be a number between 1 and 50.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: mode == ScreenMode.creating
              ? const Text('Add a new item')
              : const Text('Editing the item')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
                initialValue:
                    mode == ScreenMode.editing ? widget.groceryItem?.name : '',
                validator: validateTitle,
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      validator: validateQuantity,
                      initialValue: mode == ScreenMode.editing
                          ? widget.groceryItem?.quantity.toString()
                          : '1',
                      onSaved: (value) {
                        _enteredQuantity = value!;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      items: [
                        for (final category in GroceryCategory.values)
                          DropdownMenuItem<GroceryCategory>(
                            value: category,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.label),
                              ],
                            ),
                          ),
                      ],
                      value: mode == ScreenMode.editing
                          ? widget.groceryItem?.category
                          : GroceryCategory.vegetables,
                      onChanged: (value) {
                        setState(() {
                          _defaultCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _resetForm,
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                      onPressed: _saveItem,
                      child: mode == ScreenMode.creating
                          ? const Text('Add Item')
                          : const Text('Edit '))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
