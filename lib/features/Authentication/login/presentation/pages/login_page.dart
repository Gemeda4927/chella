import 'package:chella/core/constants/auth_constants.dart';
import 'package:chella/features/Authentication/login/presentation/widgets/AuthTextField%20.dart';
import 'package:flutter/material.dart';
import 'package:chella/core/constants/string_constants.dart';
import 'package:chella/features/Authentication/register/presentation/pages/register_page.dart'; // Add this import

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (_formkey.currentState!.validate()) {
      final username = _usernameController.text.trim();
      final password = _passwordController.text.trim();

      print('Username: $username');
      print('Password: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kWhite,
        padding: const EdgeInsets.all(kPaddingXL),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        StringConstants.appName,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: kPaddingS),
                      Text(
                        StringConstants.welcomeBack,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
              
                  const SizedBox(height: kPadding4XL),
              
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(kPadding2XL),
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(kBorderRadiusL),
                      boxShadow: [
                        BoxShadow(
                          color: kBlack.withOpacity(kShadowOpacity),
                          blurRadius: kShadowBlur,
                          spreadRadius: kShadowSpread,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.loginTitle,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
              
                        const SizedBox(height: kPadding3XL),
              
                        Text(
                          StringConstants.usernameLabel,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: kPaddingS),
                        AuthTextField(
                          hintText: StringConstants.usernameHint,
                          controller: _usernameController,
                        ),
              
                        const SizedBox(height: kPadding2XL),
              
                        Text(
                          StringConstants.passwordLabel,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: kPaddingS),
                        AuthTextField(
                          hintText: StringConstants.passwordHint,
                          obscureText: true,
                          controller: _passwordController,
                        ),
              
                        const SizedBox(height: kPaddingXL),
              
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              StringConstants.forgotPassword,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        ),
              
                        const SizedBox(height: kPadding2XL),
              
                        const Divider(color: kGrey300, height: 1, thickness: 1),
              
                        const SizedBox(height: kPadding2XL),
              
                        ElevatedButton(
                          onPressed: login,
                          child: Text(StringConstants.loginButton),
                        ),
              
                        const SizedBox(height: kPadding2XL),
              
                        Center(
                          child: Column(
                            children: [
                              Text(
                                StringConstants.noAccount,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(height: kPaddingS),
                              GestureDetector(
                                onTap: () {
                                  // Navigation added here
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const RegisterPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  StringConstants.createAccount,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
              
                        const SizedBox(height: kPaddingL),
              
                        Center(
                          child: Text(
                            StringConstants.terms,
                            style: Theme.of(context).textTheme.labelSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}