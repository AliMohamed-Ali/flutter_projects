import 'package:flutter/material.dart';
import 'package:movie_app/features/search/presentation/views/widgets/search_tab_view_body.dart';

class SearchTabView extends StatelessWidget {
  const SearchTabView({super.key});

  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<SearchTabViewModel>(context, listen: false);

    return const SearchTabViewBody();
  }
}
