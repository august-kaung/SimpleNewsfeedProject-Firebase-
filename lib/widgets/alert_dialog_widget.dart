import 'package:flutter/material.dart';
import 'package:simple_newsfeed_project_two/constant/colors.dart';
import 'package:simple_newsfeed_project_two/constant/dimens.dart';
import 'package:simple_newsfeed_project_two/constant/strings.dart';
import 'package:simple_newsfeed_project_two/widgets/easy_text.dart';


class LoadingAlertDialogWidget extends StatelessWidget {
  const LoadingAlertDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CircularProgressIndicator(),
           SizedBox(
            width: kSP20x,
          ),
          EasyText(
            text: kLoadingText,
            fontWeight: FontWeight.w500,
            fontSize: kFontSize20x,
            textColor: kSecondaryTextColor,
          )
        ],
      ),

    );
  }
}
