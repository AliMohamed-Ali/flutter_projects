import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar": {"1": "الصفحة الرئيسية", "2": "عربي", "3": "انكليزي"},
        "en": {"1": "Home", "2": "Arabic", "3": "English"},
      };
}
