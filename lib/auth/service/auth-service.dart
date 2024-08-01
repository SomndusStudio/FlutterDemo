import 'package:tp_twitter/api/api-response.dart';

abstract class AuthService {

  Future<ApiResponse<String>> postAuth(String email, String password);
}