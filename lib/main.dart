import 'package:chitchat/Config/PagePath.dart';
import 'package:chitchat/Config/Themes.dart';
import 'package:chitchat/Pages/SplacePage/SplacePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      builder: (context, child)=> GetMaterialApp(
        debugShowCheckedModeBanner: false,
        builder: FToastBuilder(),
        title: 'chitchat',
        theme: lightTheme,
        getPages: pagePath,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: const SplacePage(),
      )
    );
  }
}

