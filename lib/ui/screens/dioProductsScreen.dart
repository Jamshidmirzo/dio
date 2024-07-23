import 'package:flutter/material.dart';
import 'package:lesson81/data/models/product.dart';
import 'package:lesson81/data/services/dio_service_product.dart';
import 'package:lesson81/ui/widgets/add_dialog.dart';
import 'package:lesson81/ui/widgets/products.dart';

class Dioproductsscreen extends StatefulWidget {
  const Dioproductsscreen({super.key});

  @override
  State<Dioproductsscreen> createState() => _DioproductsscreenState();
}

class _DioproductsscreenState extends State<Dioproductsscreen> {
  final serviceproduct = DioServiceProduct();
  add() {
    showDialog(
      context: context,
      builder: (context) {
        return AddDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: serviceproduct.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Productlarimzi yoq'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          print(snapshot.data);
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final product = snapshot.data![index];
              return Products(product: product);
            },
          );
        },
       ),
    );
  }
}
