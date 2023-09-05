import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../AppConstant/assests_manager.dart';

Future<List<DropDownValueModel>> fetchDepartments() async {
  AssetsManager assetsManager = AssetsManager();
  final response = await http.get(Uri.parse(
      'http://${assetsManager.ipAddress}:8080/admin/sites/department-data'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    if (data != null &&
        data['departments'] != null &&
        data['departments'] is List) {
      List<DropDownValueModel> departments = [];
      // print(data);
      // print(data['departments']);
      for (var department in data['departments']) {
        // print(department['departmentname']);
        departments.add(DropDownValueModel(
          value: department['departmentid'].toString() ?? 'Software',
          name: department['departmentname'] ?? 'Software',
        ));
      }

      return departments;
    } else {
      throw Exception(
          'Departments data is missing or not in the expected format.');
    }
  } else {
    throw Exception('Failed to load departments: ${response.statusCode}');
  }
}

List<DropDownValueModel> departments = [];
DropDownValueModel? dropdownValueDepartment;
