import 'package:bookly_app/core/widgets/custom_failure_widget.dart';
import 'package:bookly_app/core/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubit/similar_books_cubit.dart';
import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.16,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                            "",
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomFailureWidget(errMessage: state.errMessage);
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}
