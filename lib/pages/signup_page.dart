import 'package:blur/blur.dart';
import 'package:coffee_ui/pages/signin_page.dart';
import 'package:flutter/foundation.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import '../AppConstant/assests_manager.dart';
import '../data/web_services/fetched_data_building.dart';
import '../data/web_services/fetched_data_department.dart';
import '../data/web_services/fetched_data_office.dart';
import '../data/web_services/fetched_data_roles.dart';
import '../data/web_services/fetched_data_rooms.dart';
import '../data/web_services/fetched_data_sites.dart';
import 'package:coffee_ui/route/route.dart' as route;
//import 'package:dio/dio.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class SignupResponseCL {
  final String message;
  final int userId;
  const SignupResponseCL({required this.message, required this.userId});
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return SignupPageComponents(
      imagePath: 'assets/images/splash_image.png' ?? '',
    );
  }
}

class SignupPageComponents extends StatefulWidget {
  SignupPageComponents({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  String? imagePath;

  @override
  State<SignupPageComponents> createState() => _SignupPageComponentsState();
}

class _SignupPageComponentsState extends State<SignupPageComponents> {
  AssetsManager assetsManager = AssetsManager();
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //final TextEditingController _roleController = TextEditingController();
  //final TextEditingController _siteController = TextEditingController();
  //final TextEditingController _buildingController = TextEditingController();
  //final TextEditingController _departmentController = TextEditingController();
  //final TextEditingController _officeController = TextEditingController();
  //final TextEditingController _roomController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchRoles().then((data) {
      setState(() {
        roles = data;
        dropdownValueRole = roles.isNotEmpty ? roles.first : null;
        if (kDebugMode) {
          print('Fetched roles: $roles');
        }
      });
    });
    fetchSites().then((data) {
      setState(() {
        sites = data;
        dropdownValueSite = sites.isNotEmpty ? sites.first : null;
        if (kDebugMode) {
          print('Fetched sites: $sites');
        } // Debug print statement
      });
    });
    fetchBuildings().then((data) {
      setState(() {
        buildings = data;
        dropdownValueBuilding = buildings.isNotEmpty ? buildings.first : null;
        if (kDebugMode) {
          print('Fetched buildings: $buildings');
        } // Debug print statement
      });
    });
    fetchDepartments().then((data) {
      setState(() {
        departments = data;
        dropdownValueDepartment =
            departments.isNotEmpty ? departments.first : null;
        if (kDebugMode) {
          print('Fetched departments: $departments');
        } // Debug print statement
      });
    });
    fetchOffices().then((data) {
      setState(() {
        offices = data;
        dropdownValueOffice = offices.isNotEmpty ? offices.first : null;
        if (kDebugMode) {
          print('Fetched offices: $offices');
        } // Debug print statement
      });
    });
    fetchRooms().then((data) {
      setState(() {
        rooms = data;
        dropdownValueRooms = rooms.isNotEmpty ? rooms.first : null;
        if (kDebugMode) {
          print('Fetched rooms: $rooms');
        } // Debug print statement
      });
    });
  }

  Future<void> signUp(
      String firstname,
      String lastname,
      String email,
      String password,
      String roleId,
      String siteId,
      String buildingId,
      String departmentId,
      String officeId,
      String roomId) async {
    final url = Uri.parse('http://${assetsManager.ipAddress}:8080/auth/signup');
    final response = await http.post(
      url,
      //reRE12@re
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'password': password,
        'roleId': roleId,
        'siteId': siteId,
        'buildingId': buildingId,
        'departmentId': departmentId,
        'officeId': officeId,
        'roomId': roomId,
      }),
    );

    if (response.statusCode == 201) {
      // Successful signup
      if (kDebugMode) {
        print('Signup successful');
      }
      // json.decode(response.body({"message": message, "userId": userId}));
      if (kDebugMode) {
        // print(json.decode(response.body));
        var jsonData = json.decode(response.body);
        var res = SignupResponseCL(
            message: jsonData['message'], userId: jsonData['userId']);
        print(res.message);
      }
    } else {
      // Handle signup failure
      if (kDebugMode) {
        print('Signup failed with status code ${response.statusCode}');
      }
      if (kDebugMode) {
        print('Response body: ${response.body}');
      }
    }
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
                    image: AssetImage(widget.imagePath!), fit: BoxFit.cover),
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 150.w,
                            child: TextFormField(
                              controller: _fNameController,
                              validator: (value) {
                                if (!RegExp('[a-zA-Z]').hasMatch(value!) ||
                                    value.isEmpty) {
                                  return 'Please enter valid Name';
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
                                hintText: 'First Name',
                                hintStyle: TextStyle(
                                    color: const Color(0xFFCDCDCD),
                                    fontSize: 14.sp),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Color(0xFFCDCDCD),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150.w,
                            child: TextFormField(
                              controller: _lNameController,
                              validator: (value) {
                                if (!RegExp('[a-zA-Z]').hasMatch(value!) ||
                                    value.isEmpty) {
                                  return 'Please enter valid Name';
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
                                hintText: 'Last Name',
                                hintStyle: TextStyle(
                                    color: const Color(0xFFCDCDCD),
                                    fontSize: 14.sp),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Color(0xFFCDCDCD),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
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
                            obscureText: _obscureText,
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
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
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
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color(0xFFCDCDCD),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 29.0.r, right: 31.r),
                        child: DropDownTextField(
                          validator: (String? value) {
                            return value == null || value.isEmpty
                                ? "Please select a role"
                                : null;
                          },
                          textFieldDecoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.arrow_downward_rounded),
                            hintText: 'Select your Role',
                            hintStyle: TextStyle(
                                color: const Color(0xFFCDCDCD),
                                fontSize: 14.sp),
                            fillColor: const Color(0xff4E4E4E),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xff4E4E4E),
                                width: 5,
                                style: BorderStyle.solid,
                              ),
                            ),
                            suffixIcon: const Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xFFCDCDCD),
                            ),
                          ),
                          dropDownList: roles
                              .map((role) => DropDownValueModel(
                                    value: role.value,
                                    name: role.name,
                                  ))
                              .toList(),
                          onChanged: (dynamic value) {
                            setState(
                              () {
                                dropdownValueRole =
                                    value as DropDownValueModel?;
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 150.w,
                            child: DropDownTextField(
                              //controller: _siteController,
                              validator: (String? value) {
                                return value == null || value.isEmpty
                                    ? "Please select a site"
                                    : null;
                              },
                              textFieldDecoration: InputDecoration(
                                prefixIcon: const Icon(Icons.location_city),
                                hintText: 'Site',
                                hintStyle: TextStyle(
                                    color: const Color(0xFFCDCDCD),
                                    fontSize: 14.sp),
                                fillColor: const Color(0xff4E4E4E),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Color(0xff4E4E4E),
                                      width: 5,
                                      style: BorderStyle.solid),
                                ),
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xFFCDCDCD),
                                ),
                              ),

                              dropDownList: sites
                                  .map((site) => DropDownValueModel(
                                        value: site.value,
                                        name: site.name,
                                      ))
                                  .toList(),
                              onChanged: (dynamic value) {
                                setState(
                                  () {
                                    dropdownValueSite =
                                        value as DropDownValueModel?;
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 150.w,
                            child: DropDownTextField(
                              // controller: _buildingController,
                              validator: (String? value) {
                                return value == null || value.isEmpty
                                    ? "Please select a building"
                                    : null;
                              },
                              textFieldDecoration: InputDecoration(
                                prefixIcon: const Icon(Icons.apartment),
                                hintText: 'Building',
                                hintStyle: TextStyle(
                                    color: const Color(0xFFCDCDCD),
                                    fontSize: 14.sp),
                                fillColor: const Color(0xff4E4E4E),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Color(0xff4E4E4E),
                                      width: 5,
                                      style: BorderStyle.solid),
                                ),
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xFFCDCDCD),
                                ),
                              ),
                              dropDownList: buildings
                                  .map((building) => DropDownValueModel(
                                        value: building.value,
                                        name: building.name,
                                      ))
                                  .toList(),
                              onChanged: (dynamic value) {
                                setState(
                                  () {
                                    dropdownValueBuilding =
                                        value as DropDownValueModel?;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 180.w,
                            child: DropDownTextField(
                              //controller: _departmentController,
                              validator: (String? value) {
                                return value == null || value.isEmpty
                                    ? "Please select a department"
                                    : null;
                              },
                              textFieldDecoration: InputDecoration(
                                prefixIcon: const Icon(Icons.dashboard),
                                hintText: 'Department',
                                hintStyle: TextStyle(
                                    color: const Color(0xFFCDCDCD),
                                    fontSize: 14.sp),
                                fillColor: const Color(0xff4E4E4E),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Color(0xff4E4E4E),
                                      width: 5,
                                      style: BorderStyle.solid),
                                ),
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xFFCDCDCD),
                                ),
                              ),
                              dropDownList: departments
                                  .map((department) => DropDownValueModel(
                                        value: department.value,
                                        name: department.name,
                                      ))
                                  .toList(),
                              onChanged: (dynamic value) {
                                setState(
                                  () {
                                    dropdownValueDepartment =
                                        value as DropDownValueModel?;
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 150.w,
                            child: DropDownTextField(
                              //controller: _officeController,
                              validator: (String? value) {
                                return value == null || value.isEmpty
                                    ? "Please select an office"
                                    : null;
                              },
                              textFieldDecoration: InputDecoration(
                                prefixIcon: const Icon(Icons.numbers),
                                hintText: 'Office',
                                hintStyle: TextStyle(
                                    color: const Color(0xFFCDCDCD),
                                    fontSize: 14.sp),
                                fillColor: const Color(0xff4E4E4E),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Color(0xff4E4E4E),
                                      width: 5,
                                      style: BorderStyle.solid),
                                ),
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xFFCDCDCD),
                                ),
                              ),
                              dropDownList: offices
                                  .map((office) => DropDownValueModel(
                                        value: office.value,
                                        name: office.name,
                                      ))
                                  .toList(),
                              onChanged: (dynamic value) {
                                setState(
                                  () {
                                    dropdownValueOffice =
                                        value as DropDownValueModel?;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 29.0.r, right: 31.r),
                        child: DropDownTextField(
                          // controller: _roomController,
                          validator: (String? value) {
                            return value == null || value.isEmpty
                                ? "Please select a room"
                                : null;
                          },
                          textFieldDecoration: InputDecoration(
                            prefixIcon: const Icon(Icons.room),
                            hintText: 'Select your room',
                            hintStyle: TextStyle(
                                color: const Color(0xFFCDCDCD),
                                fontSize: 14.sp),
                            fillColor: const Color(0xff4E4E4E),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color(0xff4E4E4E),
                                  width: 5,
                                  style: BorderStyle.solid),
                            ),
                            suffixIcon: const Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xFFCDCDCD),
                            ),
                          ),
                          dropDownList: rooms
                              .map((room) => DropDownValueModel(
                                    value: room.value,
                                    name: room.name,
                                  ))
                              .toList(),
                          onChanged: (dynamic value) {
                            setState(
                              () {
                                dropdownValueRooms =
                                    value as DropDownValueModel?;
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 29.0.r, right: 31.r),
                  child: SizedBox(
                    width: 315.w,
                    height: 62.h,
                    child: ElevatedButton(
                      onPressed: _formKey.currentState?.validate() == true
                          ? () {
                              signUp(
                                _fNameController.text,
                                _lNameController.text,
                                _emailController.text,
                                _passwordController.text,
                                dropdownValueRole?.value.toString() ?? '',
                                dropdownValueSite?.value.toString() ?? '',
                                dropdownValueBuilding?.value.toString() ?? '',
                                dropdownValueDepartment?.value.toString() ?? '',
                                dropdownValueOffice?.value.toString() ?? '',
                                dropdownValueRooms?.value.toString() ?? '',
                              );
                              if (_formKey.currentState != null &&
                                  _formKey.currentState!.validate()) {
                                Navigator.pushNamed(context, route.signInPage);
                                // Get.to(const SignInPage());
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => const SignInPage(),
                                //   ),
                                // );
                              }
                            }
                          : null,
                      child: Text(
                        'Signup',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xffC67C4E)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                    ),
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
