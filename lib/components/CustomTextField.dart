import 'package:flutter/material.dart';
import '../utils/style/colors.dart';

class CustomTextField extends StatelessWidget {
  final bool isBorder;
  final bool? isPasswordField;
  final bool obscureText;
  final VoidCallback? suffixOnPressed;
  final String? hintText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? Validator;
  final IconData? icon;
  final int maxLine;

  CustomTextField({
    Key? key,
    this.hintText = null,
    required this.onChanged,
    this.icon = null,
    required this.controller,
    required this.Validator,
    this.suffixOnPressed,
    this.obscureText = false,
    this.isPasswordField,
    this.maxLine = 1,
    this.isBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: AppColors.primaryBg,
      ),
      child: TextFormField(
        maxLines: maxLine,
        obscureText: obscureText,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: Validator,
        onChanged: onChanged,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 14),
          prefixIcon: icon != null ? Icon(icon, color: AppColors.secondaryText,
            size: 20,) : null,

          suffixIcon: isPasswordField != null
              ? IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: suffixOnPressed,
          )
              : null,
          prefixIconColor: AppColors.primaryButton,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          border: isBorder
              ? OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          )
              : InputBorder.none,
          enabledBorder: isBorder
              ? OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          )
              : null,
          focusedBorder: isBorder
              ? OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryButton,),
            borderRadius: BorderRadius.circular(10.0),
          )
              : null,
          errorBorder: isBorder
              ? OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.cyan),
            borderRadius: BorderRadius.circular(10.0),
          )
              : null,
        ),
      ),
    );
  }
}
