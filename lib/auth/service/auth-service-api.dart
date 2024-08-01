import 'package:injectable/injectable.dart';
import 'package:tp_twitter/api/api-response.dart';
import 'package:tp_twitter/auth/service/auth-service.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

@Named("api")
@Singleton(as: AuthService)
class AuthServiceApi implements AuthService {
  @override
  Future<ApiResponse<String>> postAuth(String email, String password) async {
    var url = Uri.parse("http://localhost:3000/auth");

    /// To send json payload we should setup the content-type
    final headers = {'Content-Type': 'application/json'};

    final bodyRequest =
        convert.json.encode({'email': email, 'password': password});

    var response = await http.post(url, headers: headers, body: bodyRequest);

    var json = convert.jsonDecode(response.body);

    return json;
  }
}
