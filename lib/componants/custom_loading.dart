
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:task_pyramides/componants/style/colors.dart';
import 'package:task_pyramides/componants/style/size.dart';


class CustomLoading extends StatelessWidget {
  final bool load ;

  const CustomLoading({Key? key, required this.load}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return load==true? Column(
      children: [
        SizedBox(height: height(context)*0.35),
        Center(
          child:SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return const DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColor.textOrange,
                ),
              );
            },
          ),
        )
      ],
    ):Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child:SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return const DecoratedBox(
              decoration: BoxDecoration(
                color: AppColor.textOrange,
              ),
            );
          },
        ),
      ),
    );
  }
}
