import 'package:injectable/injectable.dart';
import 'package:tp_twitter/api/api-response.dart';
import 'package:tp_twitter/auth/auth-context.dart';
import 'package:tp_twitter/auth/service/auth-service.dart';

@Named("mock")
@Singleton(as: AuthService)
class AuthServiceMock implements AuthService {

  @override
  Future<ApiResponse<String>> postAuth(String email, String password) async {

    const fakeToken = "5s5d15s1d5s1d15sd";

    // Simuler 1 sec de lag
    await Future.delayed(Duration(seconds: 1));

    return ApiResponse("203", "Connecte(é) avec succès", data: fakeToken);
  }
}
