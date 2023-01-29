import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pyramides/componants/my_navigate.dart';
import 'package:task_pyramides/componants/style/colors.dart';
import 'package:task_pyramides/componants/style/size.dart';
import 'package:task_pyramides/componants/toast.dart';
import 'package:task_pyramides/core/local/global_config.dart';
import 'package:task_pyramides/screen/login/controller/login_states.dart';
import 'package:task_pyramides/screen/login/model/login_model.dart';
import 'package:task_pyramides/screen/scan_qr_code/view/scan_qr_code_view.dart';
import 'package:task_pyramides/shared/local/cache_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  bool isSecure = false;

  void changeVisibility() {
    isSecure = !isSecure;
    emit(ChangeIconState());
  }

  // Map<dynamic, dynamic>? loginResponse;
  LoginModel? userLoginModel;

  Future<void> login(context) async {
    if (!formKey.currentState!.validate()) return;
    print('>>>>>>>>>>>>>> getting Login data >>>>>>>>>');
    emit(LoginLoadingState());
    try {
      Response? response;
      response = await Dio().post(
        AllAppApiConfig.baseUrl + AllAppApiConfig.login,
        data: {
          "email": emailCtrl.text,
          "password": passwordCtrl.text,
        },
        options: Options(
            method: "post",
            validateStatus: (state) => state! <= 500,
            headers: null),
      );
      if (response.data["status"] == 0) {
        showToast(text: response.data['massage'], state: ToastStates.error);
        emit(LoginFailureState());
      } else {
        userLoginModel = LoginModel.fromJson(response.data);
        showToast(text: response.data['massage'], state: ToastStates.success);
        saveDataToShared(userLoginModel!.data!.token!);
        showModalBottomSheet(
            isDismissible: false,
            context: context,
            isScrollControlled: true,
            enableDrag: false,
            backgroundColor: AppColor.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(height(context)*0.02)),
            ),
            builder: (context) => const CustomScanQrCode());
        emit(LoginSuccessState());
      }
    } catch (e, s) {
      print(e);
      print(s);
    }

    print('>>>>>>>>>>>>>> finishing Login data >>>>>>>>>');
  }

  saveDataToShared(String userToken) async {
    print('Start Saving data');
    CacheHelper.saveData("token", userToken);
    print('Finish Saving data');
  }
}
