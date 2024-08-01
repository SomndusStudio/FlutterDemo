import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:localization/localization.dart';
import 'package:tp_twitter/api/api-helper.dart';
import 'package:tp_twitter/auth/auth-context.dart';
import 'package:tp_twitter/auth/service/auth-service.dart';
import 'package:tp_twitter/helper/app-alert-mgr.dart';
import 'package:tp_twitter/injection.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService authService = GetAppService<AuthService>();

  void callApi(BuildContext context, String email, String password) async {
    ApiHelper().commonCallApi(
      context,
      'loading-login'.i18n(),
      () {
        return authService.postAuth(email, password);
      },
      (apiResponse) {
        // When auth error
        if (apiResponse.code != '203') {
          AppAlertMgr().showErrorDialog(context, apiResponse.message);
          return;
        }
        // store token in memory
        var token = apiResponse.data;
        AuthContext().refreshAuthContext(token!);

        // show success dialog and navigate to another page after close the dialog
        AppAlertMgr().showInfoDialog(context, apiResponse.message, onClose: () {
          Navigator.pushNamed(context, "/messages");
        });
      },
    );
  }
}
