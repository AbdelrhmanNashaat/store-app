import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widget/custom_button.dart';
import 'package:store_app/widget/custom_form_text_field.dart';

class UpdateProduct extends StatefulWidget {
  static const routeName = 'Update Product';
  const UpdateProduct({super.key});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? productName, description, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  hint: 'Product Name',
                  onChanged: (data) {
                    productName = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: 'Description',
                  onChanged: (data) {
                    description = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: 'Price',
                  onChanged: (data) {
                    price = data;
                  },
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: 'Image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                const SizedBox(
                  height: 70,
                ),
                Button(
                  text: 'Update',
                  onTab: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(productModel);
                    } catch (ex) {
                      print(ex.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel productModel) async {
    await UpdateProductService().updateProduct(
        title: productName == null ? productModel.title : productName!,
        price: price == null ? productModel.price.toString() : price!,
        desc: description == null ? productModel.description : description!,
        image: image == null ? productModel.image : image!,
        id: productModel.id,
        category: productModel.category);
  }
}
