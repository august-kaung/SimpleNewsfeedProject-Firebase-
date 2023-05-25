import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:simple_newsfeed_project_two/constant/colors.dart';
import 'package:simple_newsfeed_project_two/constant/strings.dart';
import 'package:simple_newsfeed_project_two/pages/home_page.dart';
import 'package:simple_newsfeed_project_two/utils/extensions.dart';
import 'package:simple_newsfeed_project_two/widgets/easy_text.dart';
import 'package:simple_newsfeed_project_two/widgets/material_button_widget.dart';
import 'package:simple_newsfeed_project_two/widgets/text_field_widget.dart';


import '../../widgets/alert_dialog_widget.dart';

class LoginPasswordTextFieldItemView extends StatelessWidget {
  const LoginPasswordTextFieldItemView({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
        controller: controller,
        onChange: (text) {
          context.getLoginBlocInstance().setPasswordText = text;
        },
        isShowText: false,
        isShowSuffix: true,
        inputType: TextInputType.text,
        labelText: kPasswordText,
        onTapIcon: () {},
        prefixIcon: Icons.lock,
        validate: (text) {
          if ((text?.isEmpty) ?? false) {
            return kEmailEmptyText;
          }
          return null;
        });
  }
}

class LoginEmailTextFieldItemView extends StatelessWidget {
  const LoginEmailTextFieldItemView({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      controller: controller,
      onTapIcon: () {},
      validate: (text) {
        if ((text?.isEmpty) ?? true) {
          return kEmailEmptyText;
        }
        if (!EmailValidator.validate(text ?? '')) {
          return kEmailInValidText;
        }
        return null;
      },
      onChange: (text) {
        context.getLoginBlocInstance().setEmailText = text;
      },
    );
  }
}

class LoginButtonItemView extends StatelessWidget {
  const LoginButtonItemView({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.onPressed,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButtonWidget(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const LoadingAlertDialogWidget());
            context.getLoginBlocInstance().login().then((value) {
              context.navigateBack(context);
              context.navigateToNextScreen(context, const HomePage());
            }).catchError((error) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: EasyText(
                  text: error.toString(),
                  textColor: kPrimaryTextColor,
                ),
                backgroundColor: kPrimaryBgColor,
              ));
            });
            onPressed();
          } else {}
        },
        height: 50,
        minWidth: double.infinity,
        child: const EasyText(
          text: kLoginText,
          textColor: kPrimaryTextColor,
        ));
  }
}
