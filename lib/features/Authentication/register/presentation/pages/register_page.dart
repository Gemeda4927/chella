import 'package:chella/features/Authentication/login/presentation/widgets/AuthTextField%20.dart';
import 'package:chella/features/Authentication/register/presentation/providers/register_providers.dart'
    show RegisterProvider;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chella/core/constants/auth_constants.dart';
import 'package:chella/core/constants/string_constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _register(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    final provider = Provider.of<RegisterProvider>(context, listen: false);

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Creating your account...'),
        duration: Duration(seconds: 2),
      ),
    );

    await provider.register(
      fullName: _fullNameController.text,
      username: _usernameController.text,
      password: _passwordController.text,
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    if (provider.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Account created successfully!'),
          backgroundColor: kPrimaryYellow,
        ),
      );
    } else if (provider.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(provider.error!), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
      builder: (context, provider, child) {
        if (provider.isSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Account created successfully!'),
                backgroundColor: kPrimaryYellow,
                duration: const Duration(seconds: 2),
              ),
            );
            provider.reset();
          });
        }

        if (provider.error != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(provider.error!),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
            provider.reset();
          });
        }

        return Scaffold(
          body: Container(
            color: kWhite,
            padding: const EdgeInsets.all(kPaddingXL),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
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
                            "Create your account",
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
                              StringConstants.registerTitle,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: kPadding3XL),
                            Text(
                              StringConstants.fullNameLabel,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: kPaddingS),
                            AuthTextField(
                              hintText: StringConstants.fullNameHint,
                              controller: _fullNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: kPaddingL),
                            Text(
                              StringConstants.usernameLabel,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: kPaddingS),
                            AuthTextField(
                              hintText: StringConstants.usernameHint,
                              controller: _usernameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a username';
                                }
                                if (value.length < 3) {
                                  return 'Username must be at least 3 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: kPaddingL),
                            Text(
                              StringConstants.emailLabel,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: kPaddingS),
                            AuthTextField(
                              hintText: StringConstants.emailHint,
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                final emailRegex = RegExp(
                                  r'^[^@]+@[^@]+\.[^@]+',
                                );
                                if (!emailRegex.hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: kPaddingL),
                            Text(
                              StringConstants.passwordLabel,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: kPaddingS),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: _obscurePassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: StringConstants.passwordHint,
                                filled: true,
                                fillColor: kGrey50,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: kPaddingL,
                                  vertical: kPaddingM,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    kBorderRadiusM,
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: kGrey600,
                                  ),
                                  onPressed: () {
                                    setState(
                                      () =>
                                          _obscurePassword = !_obscurePassword,
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: kPaddingL),
                            Text(
                              StringConstants.confirmPasswordLabel,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: kPaddingS),
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: _obscureConfirmPassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != _passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: StringConstants.confirmPasswordHint,
                                filled: true,
                                fillColor: kGrey50,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: kPaddingL,
                                  vertical: kPaddingM,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    kBorderRadiusM,
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureConfirmPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: kGrey600,
                                  ),
                                  onPressed: () {
                                    setState(
                                      () => _obscureConfirmPassword =
                                          !_obscureConfirmPassword,
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: kPaddingXL),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: kPaddingS,
                              ),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: Theme.of(context).textTheme.labelSmall,
                                  children: [
                                    const TextSpan(
                                      text: 'By signing up, you agree to our ',
                                    ),
                                    TextSpan(
                                      text: 'Terms of Service',
                                      style: TextStyle(
                                        color: kPrimaryYellow,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const TextSpan(text: ' and '),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                        color: kPrimaryYellow,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: kPadding2XL),
                            const Divider(
                              color: kGrey300,
                              height: 1,
                              thickness: 1,
                            ),
                            const SizedBox(height: kPadding2XL),
                            ElevatedButton(
                              onPressed: provider.loading
                                  ? null
                                  : () => _register(context),
                              child: provider.loading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: kBlack,
                                      ),
                                    )
                                  : Text(StringConstants.registerButton),
                            ),
                            const SizedBox(height: kPadding2XL),
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    StringConstants.alreadyHaveAccount,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                  const SizedBox(height: kPaddingS),
                                  GestureDetector(
                                    onTap: provider.loading
                                        ? null
                                        : () {
                                            Navigator.pop(context);
                                          },
                                    child: Text(
                                      StringConstants.loginInstead,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelLarge,
                                    ),
                                  ),
                                ],
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
      },
    );
  }
}
