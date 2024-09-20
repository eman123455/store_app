import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/screens/update_product_screen.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.product});
  ProductsModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,arguments: product);
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: Offset(10, 10)),
          ]),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.substring(0, 6),
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ' '${product.price}',
                        style: TextStyle(fontSize: 16),
                      ),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: -50,
            right: 25,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ))
      ]),
    );
  }
}
