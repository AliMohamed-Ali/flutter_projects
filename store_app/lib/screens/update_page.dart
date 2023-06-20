import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/custom_button.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widget/custom_form_filed.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = "updatePage";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            title: Text(
              "Update Page",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  CustomTextField(
                    onChanged: (data) => productName = data,
                    hintText: "product",
                    label: "product",
                  ),
                  CustomTextField(
                    onChanged: (data) => description = data,
                    hintText: "description",
                    label: "description",
                  ),
                  CustomTextField(
                    onChanged: (data) => price = data,
                    hintText: "price",
                    input: TextInputType.number,
                    label: "price",
                  ),
                  CustomTextField(
                    onChanged: (data) => image = data,
                    hintText: "image",
                    label: "image",
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    buttonText: "Update",
                    buttonColor: Colors.blue,
                    onTap: () async {
                      isLoading = true;
                      setState(() {});
                      await updateProduct(product);

                      try {
                        print("succes");
                      } catch (e) {
                        print(e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: description == null ? product.description : description!,
        image: image == null ? product.image : image!,
        category: product.category,
        id: product.id);
  }
}
