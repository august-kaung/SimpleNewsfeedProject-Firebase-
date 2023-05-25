

import 'package:simple_newsfeed_project_two/data/vos/news_feed_vo.dart';
import 'package:simple_newsfeed_project_two/data/vos/user_vo.dart';

abstract class NewsFeedDataAgent {
  Stream<List<NewsFeedVO>?> getNewFeedList();

  Future<void> createPost(NewsFeedVO newsFeedVO);

  Future<void> deletePost(int postID);

  Future<NewsFeedVO> getNewsFeedByPostID(int postID);

  Future<void> createUser(UserVO userVO);
}
