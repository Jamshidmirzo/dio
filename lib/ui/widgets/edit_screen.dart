import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lesson81/data/models/category.dart';
import 'package:lesson81/data/models/product.dart';
import 'package:lesson81/data/services/dio_service_product.dart';

class EditScreen extends StatefulWidget {
  final Product product;
  const EditScreen({super.key, required this.product});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
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
        serviceproduct.editProduct({
          'title': namecontroller.text,
          'price': int.parse(pricecontroller.text),
        }, widget.product.id);
        Navigator.pop(context);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    namecontroller.text = widget.product.title;
    pricecontroller.text = widget.product.price.toString();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
