import 'package:facebook_clone/models/models.dart';

class Post {
  final User user;
  final String caption;
  final String timeAgo;
  final String imageUrl;
  int likes;
  int comments;
  int shares;

  Post(
      {this.user,
      this.caption,
      this.timeAgo,
      this.imageUrl,
      this.likes,
      this.comments,
      this.shares});
}
