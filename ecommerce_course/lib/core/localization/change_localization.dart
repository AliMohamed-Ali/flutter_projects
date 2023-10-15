import 'dart:ui';

import 'package:ecommerce_course/core/services/services.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController{
  late Locale? language;
  MyServices myService = Get.find();

  changeLang (String codeLang){
    Locale locale = Locale(codeLang);
    myService.sharedPreferences.setString("lang", codeLang);
    Get.updateLocale(locale);

  }
@override
  void onInit() {
    String? sharedPrefLang = myService.sharedPreferences.getString("lang");
    language = sharedPrefLang != null ?
     Locale(sharedPrefLang) :   Locale(Get.deviceLocale!.languageCode) ;
    super.onInit();
  }
}
