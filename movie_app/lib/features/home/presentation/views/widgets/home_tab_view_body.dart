import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/views/widgets/comming_soon_list.dart';
import 'package:movie_app/features/home/presentation/views/widgets/top_rated_list.dart';
import 'auto_scrolling_bar.dart';

class HomeTabViewBody extends StatelessWidget {
  const HomeTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: MovieCarousel(),
        ),
        Container(
          width: 150,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(10),
          child: const Text(
            "Top Rating",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const TopRatedListView(),
        Container(
          width: 150,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(10),
          child: const Text(
            "Comming Soon",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const CommingSoonListView(),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
