import 'package:injectable/injectable.dart';
import 'package:tp_twitter/api/api-response.dart';
import 'package:tp_twitter/home/service/message-service.dart';
import 'package:tp_twitter/home/components/tweet.dart';

@Named("mock")
@Singleton(as: MessageService)
class MessageServiceMock implements MessageService {

  @override
  Future<ApiResponse<List<Tweet>>> getMessages() async {
    // Simulate fake 1 sec load
    await Future.delayed(Duration(seconds: 1));

    var tweets = [
      Tweet(
          1,
          "https://avatar.iran.liara.run/public",
          1623376800,
          "clodomir@gmail.com",
          "Mais Attila vous y attend, Sire! Attila! Le Fléau de Dieu! Mais…"),
      Tweet(
          2,
          "https://avatar.iran.liara.run/public",
          1623376800,
          "clodomir@gmail.com",
          "Mais Attila vous y attend, Sire! Attila! Le Fléau de Dieu! Mais…"),
      Tweet(
          3,
          "https://avatar.iran.liara.run/public",
          1623376800,
          "clodomir@gmail.com",
          "Mais Attila vous y attend, Sire! Attila! Le Fléau de Dieu! Mais…")
    ];

    return ApiResponse("200", "Connecte(é) avec succès", data: tweets);
  }
}
