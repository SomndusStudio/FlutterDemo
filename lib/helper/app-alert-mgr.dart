import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class AppAlertMgr {
  static final AppAlertMgr _instance = AppAlertMgr._internal();

  AppAlertMgr._internal();

  factory AppAlertMgr() {
    return _instance;
  }

  ProgressDialog? pd;

  void showProgress(BuildContext context, String message,
      {Color barrierColor = const Color(0x77000000)}) {
    pd = ProgressDialog(context: context);

    // Display progress
    pd!.show(
        msg: message,
        progressBgColor: Colors.transparent,
        elevation: 10.0,
        barrierColor: barrierColor);
  }

  void closeProgress() {
    pd!.close();
  }

  void showInfoDialog(BuildContext context, String message,
      {VoidCallback? onClose}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('label-info'.i18n()),
            content: Text(message),
          );
        }).then((value) {
      onClose!();
    });
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('label-error'.i18n()),
            content: Text(message),
          );
        });
  }
}
