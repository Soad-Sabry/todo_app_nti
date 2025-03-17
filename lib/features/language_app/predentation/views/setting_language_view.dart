import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingLanguageView extends StatelessWidget {
  const SettingLanguageView({super.key});

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
              isSelected: [],
              //[!isEnglish, isEnglish],
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
              onPressed: (index) {
                 },
            ),
          ],
        ),
      ),
    );
  }

}
