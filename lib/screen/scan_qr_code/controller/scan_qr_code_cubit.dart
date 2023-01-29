import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:task_pyramides/componants/my_navigate.dart';
import 'package:task_pyramides/componants/style/colors.dart';
import 'package:task_pyramides/componants/style/size.dart';
import 'package:task_pyramides/componants/toast.dart';
import 'package:task_pyramides/core/local/global_config.dart';
import 'package:task_pyramides/screen/get_qr_code/view/get_qr_code_view.dart';
import 'package:task_pyramides/screen/login/view/login_view.dart';
import 'package:task_pyramides/screen/scan_qr_code/controller/scan_qr_code_states.dart';
import 'package:task_pyramides/shared/local/cache_helper.dart';

class CustomScanQrCodeCubit extends Cubit<CustomScanQrCodeStates> {
  CustomScanQrCodeCubit() : super(CustomScanQrCodeInitialState());

  static CustomScanQrCodeCubit get(context) => BlocProvider.of(context);
  File? file;
  Future<void> scanning(context,String? serial) async {
    print('>>>>>>>>>>>>>> Post Loading Scan data >>>>>>>>>');
    emit(ScanningLoadingState());

    final formData = FormData.fromMap({
      'image': file == null ? null : await MultipartFile.fromFile(file!.path),
      "pin":"12345678910",
      "serial":serial,
      "phone_type":  Platform.isAndroid?"android":"iphone",
      "category_id":"1",
    });
    try {
      Response? response;
      response = await Dio().post(
        AllAppApiConfig.baseUrl + AllAppApiConfig.postScan,
         data: formData,
        options: Options(
            method: "post",
            validateStatus: (state) => state! <= 500,
            headers: {
              "Accept": "application/json",
              "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNjRlMmNkZDMyZjk3OTI2ZTNjNGVmNGE1ZDMwMDY4MGU5MDQwMjU0ZDA3M2E5MTIyNWRlNDc3ZGYxZGQ0MGRiNTAzNjMxYzA0YmY0NDU1MGUiLCJpYXQiOjE2NzQ2NDExMjkuMDAyNjc0LCJuYmYiOjE2NzQ2NDExMjkuMDAyNjg0LCJleHAiOjE3MDYxNzcxMjguOTgxNzY4LCJzdWIiOiI4Iiwic2NvcGVzIjpbXX0.JOd-r3twtDhwqR9U3xz1Vbm33TI2eHv6XflvJdhRoiCfhn1I2WM-dMK3-S_KUVR8vAZWf89gdcKiFhvaUwxZ0BwnOTLSuZnitSyfwkfzh9_Bda8dkpk77TFJ_nLLB27edJSeCaz2NkMr4-nsjmCyJKzCiTIjR3NHVxAZ0FQv75axS7t2BrWi1DidIKhT7KHlMPsZVBpMcOpFaWTP6n9AaDV9xKV2SGr4necH0eL9UcA89ze1AoP9TMjKksKoUT8rJcb2m59ubcYrDgIZb3YAy-WYeZWXPw7G78KYDwY9kNkhBW2lnw8j6pAWj0beA67eerZmSXPZa0gxbDYL-W6dAqAVj1nX-xOiPCRFniDjVRfuZ1iTMmTmBMoHTEuDwypFmS_jYeHcpOZFU5Fpp8rf2umNTIyScFLHqij7Ye6uvO3pfC0sjQkGjBghIcsto8dMc0S9sLDiQynOnZx1ubst71zF0d67sIVsFZ2QSqOlK7qL1zWqY0a2SOGarIOhV0GooUel98d0-N6L3C_AK2hCL7ucn8xgMSZ02ljO_yy7qtbhw-KbtpSOy6SPck3mAq1QkSEifhxhRKdVYt2I1PUupcV7jhaRVAQ4uFbGNaba4WQ-sgD16w_dylCxlym4w94soYI2TYqNYP8GqKXAWt0qOdpdskWjHnlYLnjVMi2t4iU",
            }),
      );
      if (response.data["status"] == 0) {
        showToast(text: response.data['massage'], state: ToastStates.error);
        print('>>>>>>>>>>>>>>  Error Scanning data >>>>>>>>>');
        emit(ScanningFailureState());
      } else {
        print(response.data);
        showToast(text: response.data['massage'], state: ToastStates.success);
        navigatorPop(context);
        showModalBottomSheet(
            isDismissible: false,
            context: context,
            isScrollControlled: true,
            enableDrag: false,
            backgroundColor: AppColor.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(height(context)*0.02)),
            ),
            builder: (context) =>  GetQrCodeScreen());
        print('>>>>>>>>>>>>>> getting Scanning data >>>>>>>>>');
        emit(ScanningSuccessState());
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
    print('>>>>>>>>>>>>>> finishing Scanning data >>>>>>>>>');
  }


}