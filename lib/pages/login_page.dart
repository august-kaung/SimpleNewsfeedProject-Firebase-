import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_newsfeed_project_two/bloc/login_bloc.dart';
import 'package:simple_newsfeed_project_two/constant/colors.dart';
import 'package:simple_newsfeed_project_two/constant/strings.dart';
import 'package:simple_newsfeed_project_two/pages/register_page.dart';
import 'package:simple_newsfeed_project_two/utils/extensions.dart';
import 'package:simple_newsfeed_project_two/view_items/login_page_view_items/login_page_view_items.dart';
import 'package:simple_newsfeed_project_two/widgets/easy_text.dart';


import '../constant/dimens.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginBloc>(
      create: (_)=>LoginBloc(),
      builder: (_,child)=>child!,
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
                    text: kWelcomeText,
                    fontSize: kFontSize30x,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: kSP20x,
                  ),

                   LoginEmailTextFieldItemView(
                     controller: _emailController,
                   ),
                  const SizedBox(
                    height: kSP10x,
                  ),
                   LoginPasswordTextFieldItemView(
                     controller: _passwordController,
                   ),
                  const SizedBox(
                    height: kSP20x,
                  ),
                  LoginButtonItemView(formKey: _formKey,onPressed: (){
                    _passwordController.clear();
                    _emailController.clear();
                  },),
                  const SizedBox(
                    height: kSP10x,
                  ),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const EasyText(
                          text: '$kNoAccountText  ',
                          textColor: kSecondaryTextColor,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.navigateToNextScreenReplace(
                                context, const RegisterPage());
                          },
                          child: const EasyText(
                            text: kRegisterText,
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


