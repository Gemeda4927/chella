import 'package:chella/core/constants/auth_constants.dart';
import 'package:flutter/material.dart';
import 'package:chella/core/constants/string_constants.dart';
import 'package:chella/features/Authentication/presentation/widgets/auth_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kWhite,
        padding: const EdgeInsets.all(kPaddingXL),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header: Chella & Welcome back
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

                // Login Card
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
                      // Title: Login to Account
                      Text(
                        StringConstants.loginTitle,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),

                      const SizedBox(height: kPadding3XL),

                      // Username Section
                      Text(
                        StringConstants.usernameLabel,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: kPaddingS),
                      AuthTextField(hintText: StringConstants.usernameHint),

                      const SizedBox(height: kPadding2XL),

                      // Password Section
                      Text(
                        StringConstants.passwordLabel,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: kPaddingS),
                      AuthTextField(
                        hintText: StringConstants.passwordHint,
                        obscureText: true,
                      ),

                      const SizedBox(height: kPaddingXL),

                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            // Handle forgot password
                          },
                          child: Text(
                            StringConstants.forgotPassword,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),

                      const SizedBox(height: kPadding2XL),

                      // Divider
                      const Divider(color: kGrey300, height: 1, thickness: 1),

                      const SizedBox(height: kPadding2XL),

                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          // Handle login
                        },
                        child: Text(StringConstants.loginButton),
                      ),

                      const SizedBox(height: kPadding2XL),

                      // Create Account Section
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
                                // Handle create account
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

                      // Terms & Conditions
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
    );
  }
}
