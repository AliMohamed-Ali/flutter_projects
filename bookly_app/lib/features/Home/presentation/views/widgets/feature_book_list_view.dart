import 'package:flutter/material.dart';

import 'custom_view_list_item.dart';

class FeatureBookListView extends StatelessWidget {
  const FeatureBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomListViewItem(),
          );
        },
      ),
    );
  }
}
