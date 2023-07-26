import 'package:flutter/material.dart';
import 'package:movie_app/features/search/presentation/views/widgets/search_tab_view_body.dart';

import '../../../../core/utils/check_conductivity.dart';
import '../../../../core/utils/widget/custom_progress_indicator.dart';
import '../../../../core/utils/widget/no_internet.dart';

class SearchTabView extends StatelessWidget {
  const SearchTabView({super.key});

  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<SearchTabViewModel>(context, listen: false);

    return Scaffold(
      body: FutureBuilder<bool>(
        future: ConnectivityUtils.hasInternetConnection(),
        builder: (context, snapshot) {
          final hasInternet = snapshot.data ?? false;

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomProgressIndicator();
          } else if (!hasInternet) {
            return const NoInternetWidget();
          } else {
            return const SearchTabViewBody();
          }
        },
      ),
    );
  }
}
