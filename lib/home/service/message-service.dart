import 'package:tp_twitter/api/api-response.dart';
import 'package:tp_twitter/home/components/tweet.dart';

abstract class MessageService {

  Future<ApiResponse<List<Tweet>>> getMessages();
}