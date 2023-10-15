import 'package:ecommerce_course/core/constant/app_color.dart';
import 'package:ecommerce_course/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/localization/change_localization.dart';
import '../widgets/language/custom_button_language.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("3".tr,style: Theme.of(context).textTheme.displayMedium,),
            const SizedBox(height: 10,),
            CustomButtonLanguage(buttonText: "1",onPressed: (){
              controller.changeLang("ar");
              Get.toNamed(AppRoutes.onboarding);
            }),
            CustomButtonLanguage(buttonText: "2",onPressed: (){
              controller.changeLang("en");
              Get.toNamed(AppRoutes.onboarding);

            }),

          ],
        ),
      ),
    );
  }
}
