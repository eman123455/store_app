import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/screens/update_product_screen.dart';

class CustomCard extends StatefulWidget {
  CustomCard({super.key, required this.product,required this.favouriteToggle});
  ProductsModel product;
  final Function(bool) favouriteToggle;
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  Color color = Colors.white;
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,
            arguments: [widget.product]);
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: const Offset(10, 10)),
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
                    widget.product.title.substring(0, 6),
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ' '${widget.product.price}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        onPressed: () {
                          if (color == Colors.white) {
                            color = Colors.red;
                            isActive = true;
                          } else if (color == Colors.red) {
                            color = Colors.white;
                            isActive = false;
                          }
                          setState(() {
                            widget.favouriteToggle(isActive);
                          });
                        },
                        icon: const Icon(Icons.favorite),
                        color: color,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: -55,
            right: 9,
            child: Image.network(
              widget.product.image,
              height: 100,
              width: 100,
            ))
      ]),
    );
  }
}
