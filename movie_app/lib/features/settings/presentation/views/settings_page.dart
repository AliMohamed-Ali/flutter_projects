import 'package:flutter/material.dart';

import 'package:movie_app/features/settings/presentation/views/widgets/settings_view_body.dart';

class SettingsViewTab extends StatelessWidget {
  const SettingsViewTab({super.key});
 

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingsViewBody(),
    );
  }
}
