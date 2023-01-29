import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_pyramides/componants/style/colors.dart';
import 'package:task_pyramides/screen/login/view/login_view.dart';
import 'package:task_pyramides/shared/local/cache_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qr Code',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.whiteColor,
      ),
      home: LoginScreen(),
    );
  }
}


