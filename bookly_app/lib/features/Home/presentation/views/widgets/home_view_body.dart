import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/Home/presentation/views/widgets/feature_book_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'custom_app_bar.dart';

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

class FeatureBestSellerItem extends StatelessWidget {
  const FeatureBestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 2.7 / 3.9,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.red,
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AssetsData.book2),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: const Text(
                  "the name of the book ",
                  style: Styles.textStyle20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
