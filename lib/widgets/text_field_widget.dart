import 'package:flutter/material.dart';
import 'package:simple_newsfeed_project_two/constant/colors.dart';
import 'package:simple_newsfeed_project_two/constant/strings.dart';


class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      required this.validate,
      required this.onTapIcon,
      required this.onChange,
        this.controller,
      this.prefixIcon = Icons.person,
      this.labelText = kEmailText,
      this.isShowSuffix = false,
      this.isShowText = true,
      this.autoFocus = false,
      this.inputType = TextInputType.emailAddress,
      this.suffixIcon = Icons.visibility_off})
      : super(key: key);
  final TextEditingController? controller;
  final IconData prefixIcon;
  final String labelText;
  final String? Function(String?) validate;
  final bool isShowSuffix;
  final IconData suffixIcon;
  final Function onTapIcon;
  final bool isShowText;
  final bool autoFocus;
  final TextInputType inputType;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (text)=>onChange(text),
      keyboardType: inputType,
      autofocus: autoFocus,
      obscureText: !isShowText,
      validator: (text) {
        return validate(text);
      },
      decoration: InputDecoration(
        focusedBorder:const  OutlineInputBorder(
            borderSide: BorderSide(
                color: kPrimaryBgColor
            )
        ),
        suffixIcon: (isShowSuffix)
            ? SuffixIconButtonView(
                iconData: suffixIcon, onTapIcon: () => onTapIcon())
            : null,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon,color: kPrimaryBgColor),
        labelStyle: const TextStyle(
          color: kPrimaryBgColor
        ),
        labelText: labelText,
      ),
    );
  }
}

class SuffixIconButtonView extends StatelessWidget {
  const SuffixIconButtonView(
      {Key? key, required this.iconData, required this.onTapIcon})
      : super(key: key);
  final IconData iconData;
  final Function onTapIcon;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () => onTapIcon(), icon: Icon(iconData,color: kPrimaryBgColor,));
  }
}
