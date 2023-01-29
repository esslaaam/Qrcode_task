import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pyramides/componants/custom_botton.dart';
import 'package:task_pyramides/componants/custom_loading.dart';
import 'package:task_pyramides/componants/custom_text.dart';
import 'package:task_pyramides/componants/style/colors.dart';
import 'package:task_pyramides/componants/style/size.dart';
import 'package:task_pyramides/screen/get_qr_code/controller/get_qr_code_cubit.dart';
import 'package:task_pyramides/screen/get_qr_code/controller/get_qr_code_states.dart';

class GetQrCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetQrCodeCubit()..getScanning(context),
      child: BlocConsumer<GetQrCodeCubit, GetQrCodeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = GetQrCodeCubit.get(context);
            return WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width(context) * 0.06),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: height(context) * 0.015),
                    Image.asset("assets/images/Rectangle 5.png"),
                    SizedBox(height: height(context) * 0.02),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Image.asset("assets/images/Group 11.png"),
                    ),
                    SizedBox(height: height(context) * 0.02),
                    CustomText(
                        text: "Scanning Result",
                        color: AppColor.blackColor,
                        fontSize: AppFonts.t5,
                        fontweight: FontWeight.bold),
                    SizedBox(height: height(context) * 0.025),
                    CustomText(
                      text:
                          "Proreader will Keep your last 10 days history\n\t\t\t\t\t\t to keep your all scared history please\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t purched our pro package",
                      color: AppColor.greyColor,
                      fontSize: AppFonts.t6,
                    ),
                    SizedBox(height: height(context) * 0.07),
                    SizedBox(
                      height: height(context)*0.4,
                      child: state is GetQrCodeLoadingState ? const CustomLoading(load: false): ListView.separated(
                        shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                  color: AppColor.greyWith,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: width(context) * 0.04,
                                    vertical: height(context) * 0.02),
                            child: Row(
                              children: [
                                Image.asset("assets/images/Group 12.png"),
                                SizedBox(width: width(context)*0.05),
                                Expanded(
                                  child: CustomText(
                                    text: cubit.myScanModel!.data![index].serial,
                                    color: AppColor.blackColor,
                                    fontSize: AppFonts.t5,
                                  ),
                                ),
                              ],
                            ),
                              ),
                          separatorBuilder: (context, index) => SizedBox(height: height(context) * 0.02),
                          itemCount: cubit.myScanModel!.data!.length),
                    ),
                    SizedBox(height: height(context) * 0.04),
                    CustomBottom(
                        context: context,
                        label: "Send",
                        onPressed: () {},
                        widthh: width(context) * 0.8),
                    SizedBox(height: height(context) * 0.07),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
