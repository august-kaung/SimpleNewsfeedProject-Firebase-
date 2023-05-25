import 'package:flutter/foundation.dart';
import 'package:simple_newsfeed_project_two/data/apply/news_feed_apply_impl.dart';
import 'package:simple_newsfeed_project_two/data/vos/user_vo.dart';


import '../data/apply/news_feed_apply.dart';

class RegisterBloc extends ChangeNotifier {
  ///State Variable
  bool _dispose = false;
  String _emailText = '';
  String _passwordText = '';
  String _confirmPassword = '';
  String _userName = '';
  bool _showPasswordText = false;
  bool _showConfirmPasswordText = false;

  ///Getter
  bool get isDispose => _dispose;

  String get getPasswordText => _passwordText;

  bool get isShowPasswordText => _showPasswordText;

  bool get isShowConfirmPasswordText => _showConfirmPasswordText;

  ///Setter
  set setEmailText(String emailText) => _emailText = emailText;

  set setUserNameText(String userName) => _userName = userName;

  set setPasswordText(String passwordText) => _passwordText = passwordText;

  set setConfirmPasswordText(String confirmText) =>
      _confirmPassword = confirmText;

  final NewsFeedApply _newsFeedApply = NewsFeedApplyImpl();

  Future register() {
    UserVO newUser = UserVO('', _userName, _emailText, _confirmPassword);
    return _newsFeedApply.registerNewUser(newUser);
  }

  void setStatusOfShowPasswordText() {
    _showPasswordText = !_showPasswordText;
    notifyListeners();
  }

  void setStatusOfShowConfirmPasswordText() {
    _showConfirmPasswordText = !_showConfirmPasswordText;
    notifyListeners();
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
