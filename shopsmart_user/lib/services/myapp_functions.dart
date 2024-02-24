import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/subtitle_text.dart';
import 'assets_manager.dart';

class MyAppFunctions {
  static Future<void> showErrorOrWarningDialog(
      {required BuildContext context,
      required String subTitle,
       required Function fct,
      bool isError = true}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    isError ? AssetsManager.error : AssetsManager.warning,
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                   SubtitleTextWidget(
                    label: subTitle,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: !isError,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const SubtitleTextWidget(
                              label: "Cancel",

                              color: Colors.green,
                            )),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const SubtitleTextWidget(
                            label: 'OK',
                            color: Colors.red,
                          
                          ))
                    ],
                  ),
                ],
              ));
        });
  }
}
