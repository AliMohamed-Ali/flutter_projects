import 'package:ecommerce_course/core/constant/app_color.dart';
import 'package:ecommerce_course/core/localization/change_localization.dart';
import 'package:ecommerce_course/core/localization/translation.dart';
import 'package:ecommerce_course/core/services/services.dart';
import 'package:ecommerce_course/routes.dart';
import 'package:ecommerce_course/view/screen/language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await IninteServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: controller.language,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
         displayMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          bodyLarge:  TextStyle(height: 2, fontSize: 20,fontWeight:
          FontWeight.bold,color: AppColor.grey),
          bodyMedium:  TextStyle( fontSize: 14,fontWeight:
          FontWeight.bold,color: AppColor.grey),
        )
      ),
      home: const Language(),
      routes: routes,
    );
  }
}
