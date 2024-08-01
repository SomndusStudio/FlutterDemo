import 'package:flutter/material.dart';
import 'package:tp_twitter/api/api-response.dart';
import 'package:tp_twitter/helper/app-alert-mgr.dart';

class ApiHelper {
  static final ApiHelper _instance = ApiHelper._internal();

  ApiHelper._internal();

  factory ApiHelper() {
    return _instance;
  }

  /**
   * Common process when call service (can be mock or api)
   * Display a loading dialog
   * Call async service
   * Hide loading dialog
   * Execute post call service instructions
   */
  void commonCallApi(BuildContext context, String loadingMessage, Future<ApiResponse> Function() serviceCall, Function(ApiResponse) postCall) async{
    // show loading progress
    AppAlertMgr().showProgress(context, loadingMessage);

    // Call service
    var serviceResponse = await serviceCall();

    // Close loading dialog
    AppAlertMgr().closeProgress();

    // Call the procedure after receive service reponse
    postCall!(serviceResponse);

  }
}