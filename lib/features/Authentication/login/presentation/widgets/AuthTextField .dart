import 'package:chella/core/constants/auth_constants.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onToggleVisibility;
  final bool showVisibilityToggle;

  const AuthTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.onToggleVisibility,
    this.showVisibilityToggle = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: kGrey50,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: kPaddingL,
          vertical: kPaddingM,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusM),
          borderSide: BorderSide.none,
        ),
        suffixIcon: showVisibilityToggle
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: kGrey600,
                ),
                onPressed: onToggleVisibility,
              )
            : null,
      ),
    );
  }
}
