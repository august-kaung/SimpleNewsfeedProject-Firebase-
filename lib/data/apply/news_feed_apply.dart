import 'dart:io';



import 'package:simple_newsfeed_project_two/data/vos/news_feed_vo.dart';

import '../vos/user_vo.dart';

abstract class NewsFeedApply {
  Stream<List<NewsFeedVO>?> getNewsFeedList();

  Future<void> createPost(
      String description, NewsFeedVO? newsFeedVO, File? file);

  Future<void> deletePost(int postID);

  Future<NewsFeedVO> getNewsFeedByPostID(int postID);

  Future registerNewUser(UserVO newUser);

  Future login(String email, String password);

  bool isLoggedIn();

  UserVO getLoggedInUser();

  Future logout();
}
