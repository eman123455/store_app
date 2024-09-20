import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/get_all_product.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('New Title')),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 30,
                ))
          ],
        ),
        body: FutureBuilder<List<ProductsModel>>(
            future: GetAllProduct().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductsModel> products = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.only(top: 100,left: 16,right: 16),
                  child: GridView.builder(
                    itemCount: products.length,
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 100,
                              crossAxisCount: 2,
                              childAspectRatio: 1.3,
                              crossAxisSpacing: 15),
                      itemBuilder: (context, index) {
                        return CustomCard(product: products[index],);
                      }),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
        bottomNavigationBar: NavigationBar(destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: '',
          ),
        ])
        
        );
  }
}
