import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentation/manager/upcommingMovie/upcomming_cubit.dart';

import 'auto_scrolling_bar.dart';

class HomeTabViewBody extends StatelessWidget {
  const HomeTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: BlocBuilder<UpcommingCubit, UpcommingState>(
            builder: (context, state) {
              if (state is UpcommingSuccess) {
                return Expanded(
                  child: MovieCarousel(
                    movies: state.movies,
                  ),
                );
              } else if (state is UpcommingFailure) {
                return Text(state.errMessage);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        )
      ],
    );
  }
}
