import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPrimaryPadding),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: CustomBookImage(),
          );
        },
      ),
    );
  }
}
