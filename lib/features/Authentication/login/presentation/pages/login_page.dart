import 'package:chella/features/Authentication/login/presentation/provider/auth_provder.dart';
import 'package:chella/features/Authentication/login/presentation/widgets/AuthTextField%20.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chella/core/constants/auth_constants.dart';
import 'package:chella/core/constants/string_constants.dart';
import 'package:chella/features/Authentication/register/presentation/pages/register_page.dart';
import 'package:chella/features/Authentication/home/home_screen.dart';
import 'package:chella/core/network/token_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TokenManager _tokenManager = TokenManager();

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  void _checkToken() async {
    final token = await _tokenManager.getAccessToken();
    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (!_formKey.currentState!.validate()) return;

    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    final authProvider = context.read<AuthProvider>();
    await authProvider.login(username, password);

    if (authProvider.user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Welcome back, ${authProvider.user!.username}!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else if (authProvider.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authProvider.error!),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong. Please try again.'),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      body: Container(
        color: kWhite,
        padding: const EdgeInsets.all(kPaddingXL),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    StringConstants.appName,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: kPaddingS),
                  Text(
                    StringConstants.loginTitle,
                    style: Theme.of(context).textTheme.titleLarge,
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
                        const Divider(color: kGrey300),
                        const SizedBox(height: kPadding2XL),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: authProvider.loading ? null : _login,
                            child: authProvider.loading
                                ? const CircularProgressIndicator()
                                : Text(StringConstants.loginButton),
                          ),
                        ),
                        if (authProvider.error != null) ...[
                          const SizedBox(height: kPaddingM),
                          Text(
                            authProvider.error!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const RegisterPage(),
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
