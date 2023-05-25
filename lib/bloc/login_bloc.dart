import 'package:flutter/foundation.dart';

import '../data/apply/news_feed_apply.dart';
import '../data/apply/news_feed_apply_impl.dart';

class LoginBloc extends ChangeNotifier {
  ///State Variable
  bool _dispose = false;
  String _emailText = '';
  String _passwordText = '';

  ///Getter
  bool get isDispose => _dispose;

  ///Setter
  set setEmailText(String emailText) => _emailText = emailText;

  set setPasswordText(String passwordText) => _passwordText = passwordText;
  final NewsFeedApply _newsFeedApply = NewsFeedApplyImpl();

  Future login() {
    return _newsFeedApply.login(_emailText, _passwordText);
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
