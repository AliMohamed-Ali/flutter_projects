import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/Home/presentation/views/widgets/feature_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/assets.dart';
import 'custom_app_bar.dart';
import 'feature_best_seller_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeatureBookListView(),
          SizedBox(
            height: 40,
          ),
          Text(
            "Best Saller",
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 20,
          ),
          FeatureBestSellerItem(),
        ],
      ),
    );
  }
}
