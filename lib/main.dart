import 'package:capstone/Screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp(
    userId: 'userID',
  ));
}

class MyApp extends StatelessWidget {
  final String userId;
  const MyApp({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Capstone',
          home: child,
        );
      },
      child: Scaffold(
        body: MainScreen(pageIndex: 0, userId: userId),
      ),
    );
  }
}
