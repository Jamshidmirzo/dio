import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lesson81/data/models/product.dart';
import 'package:lesson81/data/services/dio_service_product.dart';
import 'package:lesson81/ui/widgets/edit_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Products extends StatelessWidget {
  final serviceproduct = DioServiceProduct();

  final Product product;
  Products({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return EditScreen(product: product);
          },
        );
      },
      child: ListTile(
        trailing: IconButton(
          onPressed: () {
            serviceproduct.deleteProduct(product.id);
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
        leading: CircleAvatar(
          child: Image.network(
            fit: BoxFit.cover,
            product.images[0],
          ),
        ),
        title: Text(product.title),
        subtitle: Text(product.category.name),
      ),
    );
    ;
  }
}
