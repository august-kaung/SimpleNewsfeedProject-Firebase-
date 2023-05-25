import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_newsfeed_project_two/bloc/register_bloc.dart';
import 'package:simple_newsfeed_project_two/constant/colors.dart';
import 'package:simple_newsfeed_project_two/constant/strings.dart';
import 'package:simple_newsfeed_project_two/utils/extensions.dart';
import 'package:simple_newsfeed_project_two/widgets/easy_text.dart';
import 'package:simple_newsfeed_project_two/widgets/material_button_widget.dart';
import 'package:simple_newsfeed_project_two/widgets/text_field_widget.dart';


import '../../pages/login_page.dart';
import '../../widgets/alert_dialog_widget.dart';

class RegisterButtonItemView extends StatelessWidget {
  const RegisterButtonItemView(
      {super.key,
      required GlobalKey<FormState> formKey,
      required this.onPressed})
      : _formKey = formKey;

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
            context.getRegisterBlocInstance().register().then((value) {
              context.navigateBack(context);
              context.navigateToNextScreen(context, const LoginPage());
            }).catchError((error) {
              context.navigateBack(context);
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
          text: kRegisterText,
          textColor: kPrimaryTextColor,
        ));
  }
}

class RegisterConfirmPasswordTextFieldItemView extends StatelessWidget {
  const RegisterConfirmPasswordTextFieldItemView({
    super.key,
    required TextEditingController confirmPasswordController,
  }) : _confirmPasswordController = confirmPasswordController;

  final TextEditingController _confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Selector<RegisterBloc, bool>(
      selector: (_, bloc) => bloc.isShowConfirmPasswordText,
      builder: (_, isShowPassword, __) => TextFieldWidget(
          controller: _confirmPasswordController,
          onChange: (text) {
            context.getRegisterBlocInstance().setConfirmPasswordText = text;
          },
          suffixIcon: isShowPassword ? Icons.visibility : Icons.visibility_off,
          isShowText: isShowPassword,
          isShowSuffix: true,
          inputType: TextInputType.text,
          labelText: kConfirmPasswordText,
          onTapIcon: () {
            context
                .getRegisterBlocInstance()
                .setStatusOfShowConfirmPasswordText();
          },
          prefixIcon: Icons.lock,
          validate: (text) {
            if ((text?.isEmpty) ?? true) {
              return kPasswordEmptyText;
            }
            if ((text?.length ?? 0) < 8) {
              return kPasswordLengthText;
            }
            String passwordText =
                context.getRegisterBlocInstance().getPasswordText;
            if (passwordText != text) {
              return kPasswordNotSameText;
            }
            return null;
          }),
    );
  }
}

class RegisterPasswordTextFieldItemView extends StatelessWidget {
  const RegisterPasswordTextFieldItemView({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Selector<RegisterBloc, bool>(
      selector: (_, bloc) => bloc.isShowPasswordText,
      builder: (_, isShowPassword, __) => TextFieldWidget(
          controller: _passwordController,
          onChange: (text) {
            context.getRegisterBlocInstance().setPasswordText = text;
          },
          suffixIcon: isShowPassword ? Icons.visibility : Icons.visibility_off,
          isShowText: isShowPassword,
          isShowSuffix: true,
          inputType: TextInputType.text,
          labelText: kPasswordText,
          onTapIcon: () {
            context.getRegisterBlocInstance().setStatusOfShowPasswordText();
          },
          prefixIcon: Icons.key,
          validate: (text) {
            if ((text?.isEmpty) ?? true) {
              return kPasswordEmptyText;
            }
            if ((text?.length ?? 0) < 8) {
              return kPasswordLengthText;
            }
            return null;
          }),
    );
  }
}

class RegisterEmailTextFieldItemView extends StatelessWidget {
  const RegisterEmailTextFieldItemView({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      prefixIcon: Icons.email,
      controller: _emailController,
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
        context.getRegisterBlocInstance().setEmailText = text;
      },
    );
  }
}

class UserNameTextFieldItemView extends StatelessWidget {
  const UserNameTextFieldItemView({
    super.key,
    required TextEditingController userNameController,
  }) : _userNameController = userNameController;

  final TextEditingController _userNameController;

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      labelText: "User Name",
      inputType: TextInputType.name,
      controller: _userNameController,
      onTapIcon: () {},
      validate: (text) {
        if ((text?.isEmpty) ?? true) {
          return kUserNameEmptyText;
        }
        return null;
      },
      onChange: (text) {
        context.getRegisterBlocInstance().setUserNameText = text;
      },
    );
  }
}
