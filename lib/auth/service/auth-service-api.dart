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
    // Preparer l'url
    var url = Uri.parse("http://localhost:3000/auth");

    // Preparer le header
    // Attention pour envoyer du JSON dans le body il faut le content type json
    final headers = {'Content-Type': 'application/json'};

    // Le body de la request
    final bodyRequest =
        convert.json.encode({'email': email, 'password': password});

    // Appeler l'api
    var response = await http.post(url, headers: headers, body: bodyRequest);

    // convertir le body e njson
    var json = convert.jsonDecode(response.body);

    return json;
  }
}
