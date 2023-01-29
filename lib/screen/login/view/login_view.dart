import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pyramides/componants/custom_botton.dart';
import 'package:task_pyramides/componants/custom_loading.dart';
import 'package:task_pyramides/componants/custom_text.dart';
import 'package:task_pyramides/componants/custom_text_formfield.dart';
import 'package:task_pyramides/componants/style/colors.dart';
import 'package:task_pyramides/componants/style/size.dart';
import 'package:task_pyramides/screen/login/controller/login_cubit.dart';
import 'package:task_pyramides/screen/login/controller/login_states.dart';
import 'package:task_pyramides/screen/scan_qr_code/view/scan_qr_code_view.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = LoginCubit.get(context);
            return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Align(
                              alignment: AlignmentDirectional.topStart,
                              child:
                                  Image.asset("assets/images/Ellipse 48.png")),
                          Align(
                              alignment: AlignmentDirectional.topEnd,
                              child:
                                  Image.asset("assets/images/Ellipse 47.png")),
                          Positioned(
                            bottom: 23,
                            left: 145,
                            child: CustomText(
                                text: "Login",
                                color: AppColor.blackColor,
                                fontSize: AppFonts.t2,
                                fontweight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: height(context) * 0.12),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width(context) * 0.05),
                        child: Form(
                          key: cubit.formKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                hint: "Enter Your Email",
                                type: TextInputType.emailAddress,
                                ctrl: cubit.emailCtrl,
                                validation: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email can\'t be empty';
                                  }
                                  else if(!value.contains('@')){
                                    return 'Email must contain @';
                                  }
                                  else if(!RegExp (r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(cubit.emailCtrl.text)){
                                    return 'Invalid Email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: height(context) * 0.015),
                              CustomTextField(
                                hint: "Password",
                                type: TextInputType.visiblePassword,
                                ctrl: cubit.passwordCtrl,
                                isSecure: cubit.isSecure,
                                validation: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password can\'t be empty';
                                  }
                                  return null;
                                },
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.changeVisibility();
                                    },
                                    icon: Icon(
                                        cubit.isSecure == false
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: AppColor.textColor,
                                        size: 25)),
                              ),
                              SizedBox(height: height(context) * 0.02),
                              Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: InkWell(
                                  onTap: () {},
                                  child: CustomText(
                                      text: "Forget Password ?",
                                      fontSize: AppFonts.t5,
                                      color: AppColor.textColor),
                                ),
                              ),
                              SizedBox(height: height(context) * 0.04),
                              state is LoginLoadingState
                                  ? const CustomLoading(load: false)
                                  : CustomBottom(
                                      context: context,
                                      label: "Login",
                                      onPressed: () async {
                                        await cubit.login(context);
                                      }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
