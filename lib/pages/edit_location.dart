import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'cart_page.dart';
import 'package:get/get.dart';
import 'package:coffee_ui/route/route.dart' as route;

List<DropDownValueModel> dropDownListSite = [
  const DropDownValueModel(
    value: 'Rehab',
    name: 'Rehab',
  ),
  const DropDownValueModel(value: 'Madinaty', name: 'Madinaty'),
  const DropDownValueModel(value: 'EL Nour', name: 'EL Nour'),
];
DropDownValueModel? dropdownValueSite = dropDownListSite.first;

List<DropDownValueModel> dropDownListBuilding = [
  const DropDownValueModel(
    value: 'Data Center',
    name: 'Data Center',
  ),
  const DropDownValueModel(value: 'Training Center', name: 'Training Center'),
];
DropDownValueModel? dropdownValueBuilding = dropDownListBuilding.first;

List<DropDownValueModel> dropDownListDepartment = [
  const DropDownValueModel(
    value: 'Software',
    name: 'Software',
  ),
  const DropDownValueModel(value: 'Training', name: 'Training'),
  const DropDownValueModel(value: 'Operation', name: 'Operation'),
];
DropDownValueModel? dropdownValueDepartment = dropDownListDepartment.first;

List<DropDownValueModel> dropDownListOffice = [
  const DropDownValueModel(
    value: '1',
    name: '1',
  ),
  const DropDownValueModel(value: '2', name: '2'),
  const DropDownValueModel(value: '3', name: '3'),
];
DropDownValueModel? dropdownValueOffice = dropDownListOffice.first;

List<DropDownValueModel> dropDownListRoom = [
  const DropDownValueModel(
    value: 'Meeting Room',
    name: 'Meeting Room',
  ),
  const DropDownValueModel(value: 'Operation Room', name: 'Operation Room'),
];
DropDownValueModel? dropdownValueRoom = dropDownListRoom.first;

class EditLocation extends StatefulWidget {
  const EditLocation({Key? key}) : super(key: key);

  @override
  State<EditLocation> createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
      builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 90.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0.r, right: 5.r),
                    child: Text(
                      'Edit Your Location Here',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sora',
                        color: const Color(0xFF2F2D2C),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.archive_rounded,
                    color: Color(0xffC67C4E),
                    size: 30,
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
                              child: DropDownTextField(
                                //controller: _siteController,
                                validator: (String? value) {
                                  return value == null || value.isEmpty
                                      ? "Please select a site"
                                      : null;
                                },
                                textFieldDecoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.location_city,
                                    color: Color(0xffC67C4E),
                                  ),
                                  hintText: 'Site',
                                  hintStyle: TextStyle(
                                    color: const Color(0xFF2F2D2C),
                                    fontSize: 14.sp,
                                  ),
                                  fillColor: const Color(0xFFCDCDCD),
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
                                dropDownList: dropDownListSite,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    dropdownValueSite =
                                        value as DropDownValueModel?;
                                  });
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
                                  prefixIcon: const Icon(
                                    Icons.apartment,
                                    color: Color(0xffC67C4E),
                                  ),
                                  hintText: 'Building',
                                  hintStyle: TextStyle(
                                    color: const Color(0xFF2F2D2C),
                                    fontSize: 14.sp,
                                  ),
                                  fillColor: const Color(0xFFCDCDCD),
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
                                dropDownList: dropDownListBuilding,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    dropdownValueBuilding =
                                        value as DropDownValueModel?;
                                  });
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
                                  prefixIcon: const Icon(
                                    Icons.dashboard,
                                    color: Color(0xffC67C4E),
                                  ),
                                  hintText: 'Department',
                                  hintStyle: TextStyle(
                                      color: const Color(0xFF2F2D2C),
                                      fontSize: 14.sp),
                                  fillColor: const Color(0xFFCDCDCD),
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
                                dropDownList: dropDownListDepartment,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    dropdownValueDepartment =
                                        value as DropDownValueModel?;
                                  });
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
                                  prefixIcon: const Icon(
                                    Icons.numbers,
                                    color: Color(0xffC67C4E),
                                  ),
                                  hintText: 'Office',
                                  hintStyle: TextStyle(
                                    color: const Color(0xFF2F2D2C),
                                    fontSize: 14.sp,
                                  ),
                                  fillColor: const Color(0xFFCDCDCD),
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
                                dropDownList: dropDownListOffice,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    dropdownValueOffice =
                                        value as DropDownValueModel?;
                                  });
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
                              prefixIcon: const Icon(
                                Icons.room,
                                color: Color(0xffC67C4E),
                              ),
                              hintText: 'Select your room',
                              hintStyle: TextStyle(
                                color: const Color(0xFF2F2D2C),
                                fontSize: 14.sp,
                              ),
                              fillColor: const Color(0xFFCDCDCD),
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
                            dropDownList: dropDownListRoom,
                            onChanged: (dynamic value) {
                              setState(() {
                                dropdownValueRoom =
                                    value as DropDownValueModel?;
                              });
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
                                if (_formKey.currentState != null &&
                                    _formKey.currentState!.validate()) {
                                  Navigator.pushNamed(context, route.cartPage);
                                  // Get.to(const CartPage());
                                  // Navigator.pushReplacement(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const CartPage(),
                                  //   ),
                                  // );
                                }
                              }
                            : null,
                        child: Text(
                          'Save',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xffC67C4E)),
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
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 29.0.r, right: 31.r),
                    child: SizedBox(
                      width: 315.w,
                      height: 62.h,
                      child: ElevatedButton(
                        // Navigator.pop(context)
                        //Get.back()
                        onPressed: () =>
                            Navigator.popAndPushNamed(context, route.cartPage),
                        child: Text(
                          'Close',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xffC67C4E)),
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
        );
      },
      onClosing: () {},
    );
  }
}
