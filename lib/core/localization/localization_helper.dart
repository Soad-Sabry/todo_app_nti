
import 'package:get/get.dart';
import 'package:todo/core/cashe_helper/cache_data.dart';
import 'package:todo/core/localization/app_strings_keys.dart';

import '../cashe_helper/cache_helper.dart';
import '../cashe_helper/cache_helper_keys.dart';
import 'ar.dart';
import 'en.dart';

class AppLocalization implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    CacheHelperKeys.keyAR: ar,
    CacheHelperKeys.keyEN: en,
  };

  static Future setLanguage() async {
    LocalData.lang = await CacheHelper.getData(key: CacheHelperKeys.langKey);

    if (LocalData.lang == null) {
      await CacheHelper.saveData(
        key: CacheHelperKeys.langKey,
        value: CacheHelperKeys.keyEN,
      );
      await Get.updateLocale(AppStringsKeys.localeEN);
      LocalData.lang = CacheHelperKeys.keyEN;
    }
  }
}