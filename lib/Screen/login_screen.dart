import 'package:capstone/Widget/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool agreedToTerms = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                Text(
                  'Login',
                  style:
                      TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40.h),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Your email address',
                    hintStyle: TextStyle(color: Color(0xFFBDC1CA)),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      size: 24.sp,
                      color: Color(0xFF757575),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF3F3F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: Color(0xFFBDC1CA)),
                    prefixIcon: Icon(Icons.lock_outline,
                        size: 24.sp, color: Color(0xFF757575)),
                    filled: true,
                    fillColor: const Color(0xFFF3F3F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Checkbox(
                      value: agreedToTerms,
                      onChanged: (value) {
                        setState(() {
                          agreedToTerms = value ?? false;
                        });
                      },
                      activeColor: Color(0xFFDA946C),
                    ),
                    Text(
                      'I agree with Terms & Condition',
                      style:
                          TextStyle(fontSize: 14.sp, color: Color(0xFF7B7B7B)),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: SubmitButton(
                    text: 'Sign In',
                    onPressed: () {
                      String userId = emailController.text;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              MainScreen(pageIndex: 0, userId: userId),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 0.8.h)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text("Sing in with",
                          style: TextStyle(fontSize: 14.sp)),
                    ),
                    Expanded(child: Divider(thickness: 0.8.h)),
                  ],
                ),
                SizedBox(height: 16.h),
                Center(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/Kakao.png',
                      width: 20.w,
                      height: 20.h,
                    ),
                    label: Text(
                      'Kakao',
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      side: BorderSide(
                        color: Color(0xFFE2E2E2), // 테두리 색상
                        width: 1.5, // 테두리 두께
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6), // ← 사각형 느낌 강화
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
