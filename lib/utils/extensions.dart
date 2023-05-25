import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_newsfeed_project_two/bloc/add_news_feed_bloc.dart';
import 'package:simple_newsfeed_project_two/bloc/details_bloc.dart';
import 'package:simple_newsfeed_project_two/bloc/home_page_bloc.dart';
import 'package:simple_newsfeed_project_two/bloc/login_bloc.dart';
import 'package:simple_newsfeed_project_two/bloc/register_bloc.dart';
import 'package:simple_newsfeed_project_two/utils/enums.dart';


extension Navigation on BuildContext {
  Future navigateToNextScreen(BuildContext context, Widget nextScreen) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => nextScreen));

  void navigateBack(BuildContext context) => Navigator.of(context).pop();

  Future navigateToNextScreenReplace(BuildContext context, Widget nextScreen) =>
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => nextScreen));

  HomePageBloc getHomePageBlocInstance() => read<HomePageBloc>();

  AddNewsFeedBloc getAddNewsFeedPageBlocInstance() => read<AddNewsFeedBloc>();

  DetailsBloc getDetailsPageBlocInstance() => read<DetailsBloc>();

  LoginBloc getLoginBlocInstance()=>read<LoginBloc>();

  RegisterBloc getRegisterBlocInstance()=>read<RegisterBloc>();
}

extension FileExtension on File {
  FileType getFileType() {
    if ((path.endsWith(".png") ) ||
        (path.endsWith(".jpg") ) ||
        (path.endsWith(".jpeg") )) {
      return FileType.image;
    }
    if ((path.endsWith(".mkv") ) ||
        (path.endsWith(".mp4") ) ||
        (path.endsWith(".mov") )) {
      return FileType.video;
    }
    if ((path.endsWith(".pdf") ) || (path.endsWith(".txt") )) {
      return FileType.file;
    }
    return FileType.none;
  }
}
