import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/theme/color_pallete.dart';

import '../widgets/auth_field.dart';
import '../widgets/auth_gradient_button.dart';
import 'sign_up.dart';

class SignInPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignInPage(),
      );
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Sign In.",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              AuthField(
                controller: emailController,
                hintText: "Email",
              ),
              const SizedBox(
                height: 15,
              ),
              AuthField(
                isObsecureText: true,
                controller: passwordController,
                hintText: "Password",
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: double.infinity,
                child: AuthGradientButton(
                  buttonTitle: "Sign In",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                      text: "Sign Up",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppPallete.gradient2,
                            fontWeight: FontWeight.bold,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(SignUpPage.route());
                        })
                ],
                text: 'Don\'t have an account? ',
                style: Theme.of(context).textTheme.titleMedium,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
