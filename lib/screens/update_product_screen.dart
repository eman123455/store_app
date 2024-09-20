import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key});
  static String id = 'UpdateProductScreen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? title, image, desc, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductsModel productsModel =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextField(
                    onChange: (value) {
                      title = value;
                    },
                    hinttext: 'Product Name'),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    onChange: (value) {
                      price = value;
                    },
                    type: TextInputType.number,
                    hinttext: 'Price'),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    onChange: (val) {
                      desc = val;
                    },
                    hinttext: 'Description'),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    onChange: (val) {
                      image = val;
                    },
                    hinttext: 'image'),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    onTap: () async {
                      setState(() {
                      isLoading = true;
                        
                      });
                      try {
                        await UpdateProduct(productsModel);
                        print('sucess added product');
                      } catch (e) {
                        print(e.toString());
                      }

                      setState(() {
                      isLoading = false;
                        

                      });
                    },
                    text: 'Update'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> UpdateProduct(ProductsModel productsModel) async {
    await UpdateProductService().updateProduct(
        title: title == null ? productsModel.title : title!,
        price: price == null ? productsModel.price.toString() : price!,
        description: desc == null ? productsModel.description : desc!,
        image: image == null ? productsModel.image : image!,
        category: productsModel.category,
        id: productsModel.id);
  }
}
