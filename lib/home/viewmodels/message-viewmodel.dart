import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:tp_twitter/api/api-helper.dart';
import 'package:tp_twitter/auth/auth-context.dart';
import 'package:tp_twitter/helper/app-alert-mgr.dart';
import 'package:tp_twitter/home/service/message-service.dart';
import 'package:tp_twitter/home/components/tweet.dart';
import 'package:tp_twitter/injection.dart';

class MessageViewModel extends ChangeNotifier {

  List<Tweet> tweets = [];

  final MessageService messageService = GetAppService<MessageService>();

  void callApi(BuildContext context) async {
    // Clear tweets list
    tweets = [];

    // Common api stuff with loading modal
    ApiHelper().commonCallApi(
      context,
      'loading-get_tweets'.i18n(),
      () {
        return messageService.getMessages();
      },
      (apiResponse) {
        // When auth error
        if (apiResponse.code != '200') {
          AppAlertMgr().showErrorDialog(context, apiResponse.message);
          return;
        }
        // update tweets list
        tweets = apiResponse.data;
        // notify observers
        notifyListeners();
      },
    );
  }
}
