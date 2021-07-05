import 'package:flutter/material.dart';

Widget defautButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required void Function()? onclicked,
  required String text,
}) =>
    Container(
      width: width,
      padding: const EdgeInsets.all(20),
      // color: background,
      child: ElevatedButton(
        child: Text(isUpperCase ? text.toUpperCase() : text.toLowerCase()),
        onPressed: onclicked,
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String hintText,
  required String text,
  IconData? prefix,
  IconData? suffix,
  required TextInputAction textInputAction,
  bool isPassword = false,
  bool border = false,
  void Function()? onSuffixPressed,
  Function(String)? onSubmit,
  Function(String)? onChanged,
  Function()? onEditingComplete,
  String? Function(String?)? validator,
  bool enable = true,
}) =>
    TextFormField(
      enabled: enable,
      obscureText: isPassword,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: text,
        prefixIcon: prefix != null
            ? Icon(
                prefix,
              )
            : null,
        suffix: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: onSuffixPressed,
              )
            : null,
        border: border ? const OutlineInputBorder() : null,
      ),
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      validator: validator,
    );
