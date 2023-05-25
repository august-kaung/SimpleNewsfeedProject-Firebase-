

import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_newsfeed_project_two/data/vos/user_vo.dart';
import 'package:simple_newsfeed_project_two/network/data_agent/fire_base_auth_abst.dart';
import 'package:simple_newsfeed_project_two/network/data_agent/news_feed_data_agent.dart';
import 'package:simple_newsfeed_project_two/network/data_agent/real_time_data_base_data_agent.dart';

class FirebaseAuthImpl extends FirebaseAuthAbst {
  var auth = FirebaseAuth.instance;
  final NewsFeedDataAgent _newsFeedDataAgent = RealTimeDataBaseDataAgent();

  // final NewsFeedDataAgent _newsFeedDataAgent=CloudFireStoreDataAgentImpl();
  @override
  UserVO getLoggedInUser() {
    return UserVO(
        auth.currentUser?.uid.toString(),
        auth.currentUser?.displayName.toString(),
        auth.currentUser?.email.toString(),
        '');
  }

  @override
  bool isLoggedIn() {
    return auth.currentUser != null;
  }

  @override
  Future login(String email, String password) {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future logout() {
    return auth.signOut();
  }

  @override
  Future registerNewUser(UserVO newUser) => auth
          .createUserWithEmailAndPassword(
              email: newUser.email ?? '', password: newUser.password ?? '')
          .then((credential) {
        User? user = credential.user;
        if (user != null) {
          user.updateDisplayName(newUser.userName).then((_) {
            final User? user = auth.currentUser;
            newUser.id = user?.uid;
            _newsFeedDataAgent.createUser(newUser);
          });
        }
      });
}
