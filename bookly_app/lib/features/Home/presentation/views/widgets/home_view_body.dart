import 'package:bookly_app/features/Home/presentation/views/widgets/feature_book_list_view.dart';
import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [CustomAppBar(), FeatureBookListView()],
    );
  }
}
