import 'package:json_annotation/json_annotation.dart';

part 'tweet.g.dart';

@JsonSerializable()
class Tweet {
  int id;
  String profile;
  int created_date;
  String author;
  String message;

  Tweet(this.id, this.profile, this.created_date, this.author, this.message);

  /// Connect the generated [_$TweetFromJson] function to the `fromJson`
  /// factory.
  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);

  /// Connect the generated [_$TweetToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TweetToJson(this);

  String formatDuration() {
    // Convert timestamp to DateTime
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(created_date * 1000);

    // Diff from now and tweet created date
    Duration difference = DateTime.now().difference(dateTime);

    // Should'nt have negative timestamp
    if (difference.isNegative) {
      return '';
    }

    // Format displayed date
    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    }
    if (difference.inHours > 0) {
      return '${difference.inHours}h';
    }
    if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    }
    return '${difference.inSeconds}s';
  }

  String displayDate() {
    return formatDuration();
  }
}
