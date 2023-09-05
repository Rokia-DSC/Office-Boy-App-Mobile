//ahMEd@123
import 'package:blur/blur.dart';
import 'package:coffee_ui/pages/signup_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:coffee_ui/pages/widgets/home_page.dart';
import '../AppConstant/assests_manager.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignupPageComponents(
      imagePath: 'assets/images/splash_image.png',
    );
  }
}

class SignupPageComponents extends StatefulWidget {
  const SignupPageComponents({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  final String imagePath;

  @override
  State<SignupPageComponents> createState() => _SignupPageComponentsState();
}

class _SignupPageComponentsState extends State<SignupPageComponents> {
  AssetsManager assetsManager = AssetsManager();
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<bool> _login() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    final url = Uri.parse('http://${assetsManager.ipAddress}:8080/auth/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      if (kDebugMode) {
        print('Request URL: ${url.toString()}');
      }
      if (kDebugMode) {
        print('Request Body: ${json.encode({
              'email': email,
              'password': '****'
            })}');
      }
      if (kDebugMode) {
        print('Response: $response');
      }

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Successful login');
        }
        final data = json.decode(response.body);
        if (kDebugMode) {
          print('Response Data: $data');
        }
        // final accessToken = data['accessToken'];
        return true;
      } else {
        if (kDebugMode) {
          print('Login failed: ${response.statusCode}');
        }
        if (kDebugMode) {
          print('Response Body: ${response.body}');
        }
        return false; // Login failed, return false
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return false; // Login failed due to an error, return false
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Blur(
            colorOpacity: 0.1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.imagePath), fit: BoxFit.cover),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80.0.r, right: 86.r),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 46.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 82.0.r, right: 84.r),
                  child: Text(
                    textAlign: TextAlign.center,
                    'TMG Office Boy App',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 49.h,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 29.0.r, right: 31.r),
                        child: SizedBox(
                          width: 315.w,
                          child: TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                      .hasMatch(value!) ||
                                  value.isEmpty) {
                                return 'Please enter correct email';
                              }
                              return null;
                            },
                            onChanged: (val) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xff4E4E4E),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  color: const Color(0xFFCDCDCD),
                                  fontSize: 14.sp),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Color(0xFFCDCDCD),
                              ),
                            ),
                            showCursor: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 29.0.r, right: 31.r),
                        child: SizedBox(
                          width: 315.w,
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: _hidePassword,
                            validator: (value) {
                              if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~)\%\-(_+=;:,.<>/?[{\]}\|^]).{8,}$')
                                      .hasMatch(value!) ||
                                  value.isEmpty) {
                                return 'Please enter valid password';
                              }
                              return null;
                            },
                            onChanged: (val) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _hidePassword = !_hidePassword;
                                  });
                                },
                                child: Icon(_hidePassword == true
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                              filled: true,
                              fillColor: const Color(0xff4E4E4E),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: const Color(0xFFCDCDCD),
                                  fontSize: 14.sp),
                              prefixIcon: const Icon(Icons.lock,
                                  color: Color(0xFFCDCDCD)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 105.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 29.0.r, right: 31.r),
                        child: SizedBox(
                          width: 315.w,
                          height: 62.h,
                          child: ElevatedButton(
                            onPressed: _formKey.currentState?.validate() == true
                                ? () async {
                                    bool loginSuccess = await _login();
                                    if (loginSuccess) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage(),
                                        ),
                                      );
                                    }
                                  }
                                : null, // Disable button if form data is not valid
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xffC67C4E)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 22.h),
                      const Text(
                        'OR',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 29.0.r, right: 31.r),
                        child: SizedBox(
                          width: 315.w,
                          height: 62.h,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()),
                              );
                            },
                            child: Text(
                              'Signup',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.white),
                            ),
                            style: ButtonStyle(
                              side: MaterialStateProperty.all<BorderSide?>(
                                const BorderSide(
                                    color: Color(0xffC67C4E), width: 3),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 98.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
