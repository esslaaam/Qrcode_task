import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pyramides/componants/custom_botton.dart';
import 'package:task_pyramides/componants/custom_text.dart';
import 'package:task_pyramides/componants/my_navigate.dart';
import 'package:task_pyramides/componants/style/colors.dart';
import 'package:task_pyramides/componants/style/size.dart';
import 'package:task_pyramides/screen/scan_qr_code/controller/scan_qr_code_cubit.dart';
import 'package:task_pyramides/screen/scan_qr_code/controller/scan_qr_code_states.dart';
import 'package:task_pyramides/screen/scan_qr_code/view/scan_with_camera.dart';

class CustomScanQrCode extends StatelessWidget {
  const CustomScanQrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomScanQrCodeCubit(),
      child: BlocConsumer<CustomScanQrCodeCubit, CustomScanQrCodeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = CustomScanQrCodeCubit.get(context);
            return WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: width(context) * 0.04),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: height(context) * 0.015),
                    Image.asset("assets/images/Rectangle 5.png"),
                    SizedBox(height: height(context) * 0.02),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Image.asset("assets/images/menu.png"),
                    ),
                    SizedBox(height: height(context) * 0.02),
                    CustomText(
                        text: "Scan OR code",
                        color: AppColor.blackColor,
                        fontSize: AppFonts.t5,
                        fontweight: FontWeight.bold),
                    SizedBox(height: height(context) * 0.025),
                    CustomText(
                      text:
                          "Place qr code inside the frame to scan please\n\t\t\t\t\t\t\t\t avoid shake to get results quickly",
                      color: AppColor.greyColor,
                      fontSize: AppFonts.t6,
                    ),
                    SizedBox(height: height(context) * 0.07),
                    Image.asset("assets/images/bi_qr-code-scan.png",
                        width: width(context) * 0.45),
                    SizedBox(height: height(context) * 0.03),
                    CustomText(
                      text: "Scanning Code...",
                      color: AppColor.textColor,
                      fontSize: AppFonts.t6,
                    ),
                    SizedBox(height: height(context) * 0.04),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/image.png"),
                        SizedBox(width: width(context) * 0.035),
                        Image.asset("assets/images/Group 5.png"),
                        SizedBox(width: width(context) * 0.035),
                        Image.asset("assets/images/flash.png"),
                      ],
                    ),
                    SizedBox(height: height(context) * 0.04),
                    CustomBottom(
                        context: context,
                        label: "Place Camera Code",
                        onPressed: () {
                          navigateTo(context, QRViewExample(cubit: cubit));
                        },
                        widthh: width(context) * 0.8),
                    SizedBox(height: height(context) * 0.1),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
