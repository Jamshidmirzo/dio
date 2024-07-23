import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lesson81/data/models/category.dart';
import 'package:lesson81/data/models/product.dart';
import 'package:lesson81/data/services/dio_service_product.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({super.key});

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final namecontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final desccontroller = TextEditingController();
  final imagecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final serviceproduct = DioServiceProduct();
  final isLoading = false;

  save() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await serviceproduct.addProducts({
          'title': namecontroller.text,
          'price': int.parse(pricecontroller.text),
          'description': desccontroller.text, // Ensure description is included
          'categoryId': 1,
          'images': [imagecontroller.text]
        });
        Navigator.pop(context);
      } catch (e) {
        print(e); // Log any errors for further inspection
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min, // Add this line
          children: [
            TextFormField(
              controller: namecontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Input name of product';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Input name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: pricecontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Input price of product';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Input price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: desccontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Input description of product';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Input description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: imagecontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Input image URL';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Input image',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: save,
          child: const Text("Done"),
        ),
      ],
    );
  }
}
