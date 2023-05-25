import 'package:flutter/foundation.dart';
import 'package:simple_newsfeed_project_two/constant/strings.dart';
import 'package:simple_newsfeed_project_two/data/vos/news_feed_vo.dart';


import '../data/apply/news_feed_apply.dart';
import '../data/apply/news_feed_apply_impl.dart';

class HomePageBloc extends ChangeNotifier {
  ///State Variable
  bool _dispose = false;
  List<NewsFeedVO>? _newsFeedList;
  String _profileName = '';
  String _profileURL = '';

  ///Getter
  bool get isDispose => _dispose;

  List<NewsFeedVO>? get getNewsFeedList => _newsFeedList;

  String get getProfileName => _profileName;

  String get getProfileURL => _profileURL;

  ///State Instance
  final NewsFeedApply _newsFeedApply = NewsFeedApplyImpl();

  HomePageBloc() {
    _newsFeedApply.getNewsFeedList().listen((event) {
      _newsFeedList = event;
      _profileName =
          (_newsFeedList != null && (_newsFeedList?.isNotEmpty ?? false))
              ? _newsFeedList?.first.userName ?? ""
              : "Kaung Htet";
      _profileURL =
          (_newsFeedList != null && (_newsFeedList?.isNotEmpty ?? false))
              ? _newsFeedList?.first.profile ?? ""
              : kDefaultImage;
      notifyListeners();
    });
  }
  Future deletePost(int postID) {
    return _newsFeedApply.deletePost(postID);
  }

  Future logout() {
    return _newsFeedApply.logout();
  }

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
}
