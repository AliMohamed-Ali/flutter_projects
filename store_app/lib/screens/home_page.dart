import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products_services.dart';

import '../widget/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = "HomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "New Trend",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 50.0, right: 16, left: 16),
          child: FutureBuilder<List<ProductModel>>(
            future: AllProductsService().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return CustomCard(
                        product: products[index],
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
