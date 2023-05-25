import 'package:flutter/material.dart';
import 'package:simple_newsfeed_project_two/constant/colors.dart';
import 'package:simple_newsfeed_project_two/constant/dimens.dart';


class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget(
      {Key? key,
        required this.onPressed,
      required this.child,
      required this.minWidth,
      this.height = kMaterialButtonHeight,
      this.backgroundColor=kPrimaryBgColor
      })
      : super(key: key);
  final Widget child;
  final double minWidth;
  final double height;
  final Color backgroundColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: backgroundColor,
      minWidth: minWidth,
      height: height,
      onPressed: () =>onPressed(),
      child: child
    );
  }
}
