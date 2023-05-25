import 'package:firebase_database/firebase_database.dart';
import 'package:simple_newsfeed_project_two/constant/strings.dart';
import 'package:simple_newsfeed_project_two/data/vos/news_feed_vo.dart';
import 'package:simple_newsfeed_project_two/data/vos/user_vo.dart';
import 'package:simple_newsfeed_project_two/network/data_agent/news_feed_data_agent.dart';



class RealTimeDataBaseDataAgent extends NewsFeedDataAgent {
  RealTimeDataBaseDataAgent._();

  static final RealTimeDataBaseDataAgent _singleton =
      RealTimeDataBaseDataAgent._();

  factory RealTimeDataBaseDataAgent() => _singleton;

  final _database = FirebaseDatabase.instance.ref();

  @override
  Stream<List<NewsFeedVO>?> getNewFeedList() {
    var a = _database.child(kRootNodeForNewFeed).once();
    a.then((value) {
      print('Data===>$value');
    });

    return _database.child(kRootNodeForNewFeed).onValue.map((event) {
      return event.snapshot.children.map((snapshot) {
        return NewsFeedVO.fromJson(
            Map<String, dynamic>.from(snapshot.value as Map));
      }).toList();
    });
  }

  @override
  Future<void> createPost(NewsFeedVO newsFeedVO) {
    return _database
        .child(kRootNodeForNewFeed)
        .child(newsFeedVO.id.toString())
        .set(newsFeedVO.toJson());
  }

  @override
  Future<void> deletePost(int postID) {
    return _database
        .child(kRootNodeForNewFeed)
        .child(postID.toString())
        .remove();
  }

  @override
  Future<NewsFeedVO> getNewsFeedByPostID(int postID) {
    return _database
        .child(kRootNodeForNewFeed)
        .child(postID.toString())
        .once()
        .asStream()
        .map((event) => event.snapshot)
        .map((snapshot) {
      return NewsFeedVO.fromJson(
          Map<String, dynamic>.from(snapshot.value as Map));
    }).first;
  }

  @override
  Future<void> createUser(UserVO userVO) {
    return _database
        .child(kRootNodeForUser)
        .child(userVO.id.toString())
        .set(userVO.toJson());
  }
}
