import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/Splash/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';

class SplahsViewBody extends StatefulWidget {
  const SplahsViewBody({super.key});

  @override
  State<SplahsViewBody> createState() => _SplahsViewBodyState();
}

class _SplahsViewBodyState extends State<SplahsViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetsData.logo,
        ),
        const SizedBox(
          height: 4,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }
}
