import 'dart:io';

import 'package:simple_newsfeed_project_two/constant/strings.dart';
import 'package:simple_newsfeed_project_two/data/apply/news_feed_apply.dart';
import 'package:simple_newsfeed_project_two/data/vos/news_feed_vo.dart';
import 'package:simple_newsfeed_project_two/data/vos/user_vo.dart';
import 'package:simple_newsfeed_project_two/network/data_agent/fire_base_auth_abst.dart';
import 'package:simple_newsfeed_project_two/network/data_agent/fire_base_auth_impl.dart';
import 'package:simple_newsfeed_project_two/network/data_agent/firebase_storage_impl.dart';
import 'package:simple_newsfeed_project_two/network/data_agent/firebase_storage_store.dart';
import 'package:simple_newsfeed_project_two/network/data_agent/news_feed_data_agent.dart';
import 'package:simple_newsfeed_project_two/network/data_agent/real_time_data_base_data_agent.dart';


class NewsFeedApplyImpl extends NewsFeedApply {
  NewsFeedApplyImpl._();

  static final NewsFeedApplyImpl _singleton = NewsFeedApplyImpl._();

  factory NewsFeedApplyImpl() => _singleton;

  final NewsFeedDataAgent _newsFeedDataAgent = RealTimeDataBaseDataAgent();

  // final NewsFeedDataAgent _newsFeedDataAgent = CloudFireStoreDataAgentImpl();
  final FirebaseStorageStore _firebaseStorageStore = FirebaseStorageStoreImpl();

  final FirebaseAuthAbst _firebaseAuthAbst = FirebaseAuthImpl();

  @override
  Stream<List<NewsFeedVO>?> getNewsFeedList() =>
      _newsFeedDataAgent.getNewFeedList();

  @override
  Future<void> createPost(
      String description, NewsFeedVO? newsFeedVO, File? file) async {
    if (file != null) {
      String imageURL =
          await _firebaseStorageStore.uploadFileToFireStorage(file);
      return _addPostOrEdit(newsFeedVO, description, imageURL);
    }
    return _addPostOrEdit(newsFeedVO, description, kDefaultImage);
  }

  Future<void> _addPostOrEdit(
      NewsFeedVO? newsFeedVO, String description, String imageURL) {
    if (newsFeedVO == null) {
      NewsFeedVO newsFeed = NewsFeedVO(
          DateTime.now().microsecondsSinceEpoch,
          description,
          imageURL,
          'https://i.pinimg.com/236x/94/29/76/942976f5a1d91cbf8e51ab970044b1ae.jpg',
          'Kaung Htet');
      return _newsFeedDataAgent.createPost(newsFeed);
    }
    return _newsFeedDataAgent.createPost(newsFeedVO);
  }

  @override
  Future<void> deletePost(int postID) {
    return _newsFeedDataAgent.deletePost(postID);
  }

  @override
  Future<NewsFeedVO> getNewsFeedByPostID(int postID) =>
      _newsFeedDataAgent.getNewsFeedByPostID(postID);

  @override
  UserVO getLoggedInUser() => _firebaseAuthAbst.getLoggedInUser();

  @override
  bool isLoggedIn() => _firebaseAuthAbst.isLoggedIn();

  @override
  Future login(String email, String password) =>
      _firebaseAuthAbst.login(email, password);

  @override
  Future logout() => _firebaseAuthAbst.logout();

  @override
  Future registerNewUser(UserVO newUser) =>
      _firebaseAuthAbst.registerNewUser(newUser);
}
