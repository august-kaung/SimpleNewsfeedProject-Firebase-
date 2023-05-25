import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_newsfeed_project_two/bloc/register_bloc.dart';
import 'package:simple_newsfeed_project_two/constant/colors.dart';
import 'package:simple_newsfeed_project_two/constant/strings.dart';
import 'package:simple_newsfeed_project_two/pages/login_page.dart';
import 'package:simple_newsfeed_project_two/utils/extensions.dart';
import 'package:simple_newsfeed_project_two/view_items/register_page_view_items/register_page_view_items.dart';
import 'package:simple_newsfeed_project_two/widgets/easy_text.dart';


import '../constant/dimens.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterBloc>(
      create: (_) => RegisterBloc(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(kSP20x),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const EasyText(
                    textColor: kSecondaryTextColor,
                    text: kRegisterText,
                    fontSize: kFontSize30x,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: kSP20x,
                  ),
                  UserNameTextFieldItemView(
                      userNameController: _userNameController),
                  const SizedBox(
                    height: kSP10x,
                  ),
                  RegisterEmailTextFieldItemView(
                      emailController: _emailController),
                  const SizedBox(
                    height: kSP10x,
                  ),
                  RegisterPasswordTextFieldItemView(
                      passwordController: _passwordController),
                  const SizedBox(
                    height: kSP10x,
                  ),
                  RegisterConfirmPasswordTextFieldItemView(
                      confirmPasswordController: _confirmPasswordController),
                  const SizedBox(
                    height: kSP20x,
                  ),
                  RegisterButtonItemView(
                    formKey: _formKey,
                    onPressed: () {
                      _confirmPasswordController.clear();
                      _emailController.clear();
                      _passwordController.clear();
                    },
                  ),
                  const SizedBox(
                    height: kSP10x,
                  ),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const EasyText(
                          text: '$kAlreadyAccountText  ',
                          textColor: kSecondaryTextColor,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.navigateToNextScreenReplace(
                                context, const LoginPage());
                          },
                          child: const EasyText(
                            text: kLoginText,
                            fontWeight: FontWeight.w600,
                            textColor: kPrimaryBgColor,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
