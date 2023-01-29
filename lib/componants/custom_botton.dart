
import 'package:flutter/material.dart';
import 'package:task_pyramides/componants/custom_text.dart';
import 'package:task_pyramides/componants/style/colors.dart';
import 'package:task_pyramides/componants/style/size.dart';


Widget CustomBottom({
  required BuildContext? context,
  required String? label,
  required GestureTapCallback? onPressed,
  final double? widthh ,
}) =>
    InkWell(
      onTap: onPressed,
      child: Container(
        width:widthh?? width(context!) * 0.7,
        height: height(context!) * 0.07,
        decoration: const BoxDecoration(
               color: AppColor.textOrange,
                borderRadius: BorderRadius.all(Radius.circular(7)),),

        child: Center(
            child: CustomText(
                text: label!,
                color: AppColor.whiteColor,
                fontSize: AppFonts.t4)),
      ),
    );
