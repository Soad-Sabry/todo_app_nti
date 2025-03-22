import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/cashe_helper/cache_data.dart';
import 'package:todo/core/cashe_helper/cache_helper.dart';
import 'package:todo/core/cashe_helper/cache_helper_keys.dart';
import 'package:todo/core/localization/app_strings_keys.dart';
class SettingLanguageView extends StatefulWidget {
  const SettingLanguageView({super.key});

  @override
  State<SettingLanguageView> createState() => _SettingLanguageViewState();
}

class _SettingLanguageViewState extends State<SettingLanguageView> {
  List<bool> isSelected = [false, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Language',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ToggleButtons(
              isSelected: isSelected,
              selectedColor: Colors.white,
              color: Colors.black,
              fillColor: Colors.green,
              borderRadius: BorderRadius.circular(10),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('AR', style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('EN', style: TextStyle(fontSize: 18)),
                ),
              ],
              onPressed: (index) async{
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = (i == index);
                  }
                  print(isSelected[0]); // ar true

                });
                if(isSelected[0])
                {
                  await CacheHelper.saveData(
                    key: CacheHelperKeys.langKey,
                    value: CacheHelperKeys.keyAR,
                  );
                  await Get.updateLocale(AppStringsKeys.localeAR);
                  LocalData.lang = CacheHelperKeys.keyAR;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
