
import 'package:flutter/material.dart';
import 'package:task_pyramides/componants/style/colors.dart';
import 'package:task_pyramides/componants/style/size.dart';

Widget CustomTextField({
  bool? isEnabled = false,
  String? hint,
  TextInputType? type,
  bool? isPass,
  Widget? suffixIcon,
  bool isSecure = false,
  TextEditingController? ctrl,
  EdgeInsetsGeometry? contentPadding,
  Function()? onTap,
  Function? validation,
  int maxLines= 1,
}) =>
    TextFormField(
      controller: ctrl,
      readOnly: isEnabled!,
      maxLines: maxLines,
      onTap: onTap,
      cursorColor: AppColor.textOrange,
      cursorHeight: 25,
      validator: validation != null
          ? (value) {
        return validation(value);
      }
          : (value) {},
      style: TextStyle(fontSize: AppFonts.t5, color: AppColor.blackColor),
      decoration: InputDecoration(
        contentPadding: contentPadding,
        errorBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColor.greyWith.withOpacity(0.7))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
            borderSide:const BorderSide(color: AppColor.greyColor)

        ),
        enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:const BorderSide(color: AppColor.greyColor)

        ),
        hintText: hint,
        hintStyle:const TextStyle(
          color: AppColor.greyColor,
        ),
        suffixIcon: suffixIcon,
      ),
      keyboardType: type,
      obscureText: isSecure,
    );
