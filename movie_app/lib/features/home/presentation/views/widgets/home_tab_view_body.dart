import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/widget/custom_container.dart';
import 'package:movie_app/features/home/presentation/views/widgets/comming_soon_list.dart';
import 'package:movie_app/features/home/presentation/views/widgets/playing_now_list.dart';
import 'package:movie_app/features/home/presentation/views/widgets/top_rated_list.dart';
import 'auto_scrolling_bar.dart';

class HomeTabViewBody extends StatelessWidget {
  const HomeTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: MovieCarousel(),
        ),
        CustomContainer(text: "Top Rating"),
        SizedBox(height: 10),
        TopRatedListView(),
        CustomContainer(text: "Comming Soon"),
        SizedBox(height: 10),
        CommingSoonListView(),
        CustomContainer(text: "Playing Now"),
        SizedBox(height: 10),
        PlayingNowListView(),
        SizedBox(height: 100),
      ],
    );
  }
}
