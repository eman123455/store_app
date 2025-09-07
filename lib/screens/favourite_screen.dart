import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/helper/handle_Favourite_product.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/widgets/custom_card.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key, required this.favouriteProducts});
  static String id = 'FavouriteScreen';
  final List<ProductsModel> favouriteProducts;
  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('New Title')),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 30,
                ))
          ],
        ),
        body:favouriteProducts.isEmpty?
        const Text('There is No Favourite Product ',
        style: TextStyle(
        color: Colors.red,
        fontSize: 32
        ),
        )
        : Padding(
          padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
          child: GridView.builder(
              itemCount: favouriteProducts.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 100,
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 15),
              itemBuilder: (context, index) {
                return CustomCard(
                  product: favouriteProducts[index],
                  favouriteToggle: (isActive) {
                    handleFavouriteProduct(isActive, favouriteProducts[index]);
                  },
                );
              }),
        ));
  }
}
