import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/api_service.dart';
import 'package:movie_app/core/utils/widget/custom_failure_message.dart';
import 'package:movie_app/core/utils/widget/custom_progress_indicator.dart';
import 'package:movie_app/features/home/presentation/manager/upcommingMovie/upcomming_cubit.dart';
import 'package:movie_app/core/utils/widget/custom_movie_image.dart';

class CommingSoonListView extends StatelessWidget {
  const CommingSoonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: BlocBuilder<UpcommingCubit, UpcommingState>(
        builder: (context, state) {
          if (state is UpcommingSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: CustomMovieImage(
                        imageUrl:
                            "${ApiService.baseImageW200}${state.movies[index].posterPath}"),
                  ),
                );
              },
            );
          } else if (state is UpcommingFailure) {
            return CustomFailureWidget(errMessage: state.errMessage);
          } else {
            return const CustomProgressIndicator();
          }
        },
      ),
    );
  }
}
