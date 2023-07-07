import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/widgets/custom_failure_widget.dart';
import 'package:bookly_app/core/widgets/custom_progress_indicator.dart';
import 'package:bookly_app/features/Home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature_best_seller_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPrimaryPadding),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: BookListViewItem(
                      bookModel: state.books[index],
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is NewsetBooksFailure) {
          return CustomFailureWidget(errMessage: state.errMessage);
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}
