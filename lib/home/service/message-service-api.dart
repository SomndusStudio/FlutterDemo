import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:tp_twitter/api/api-response.dart';
import 'package:tp_twitter/auth/auth-context.dart';
import 'package:tp_twitter/home/service/message-service.dart';
import 'package:tp_twitter/home/components/tweet.dart';

@Named("api")
@Singleton(as: MessageService)
class MessageServiceApi implements MessageService {

  @override
  Future<ApiResponse<List<Tweet>>> getMessages() async {
    var url = Uri.parse("http://localhost:3000/v2/comment/all");

    final headers =
    {
      'Authorization': 'Bearer ${ AuthContext().token }'
    };

    var response = await http.get(url, headers: headers);

    var json = convert.jsonDecode(response.body);

    var apiResponse = ApiResponse<List<Tweet>>(json['code'], json['message']);

    return apiResponse;
  }
}
