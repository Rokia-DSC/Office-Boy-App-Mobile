import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<DropDownValueModel>> fetchRoles() async {
  final response =
      await http.get(Uri.parse('http://10.1.11.96:8080/admin/roles/get-roles'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    if (data != null && data['roles'] != null && data['roles'] is List) {
      List<DropDownValueModel> roles = [];
      // print(data);
      // print(data['roles']);
      for (var role in data['roles']) {
        // print(role['rolename']);
        roles.add(DropDownValueModel(
          value: role['roleid'].toString() ?? 'employee',
          name: role['rolename'] ?? 'employee',
        ));
      }

      return roles;
    } else {
      throw Exception('Roles data is missing or not in the expected format.');
    }
  } else {
    throw Exception('Failed to load roles: ${response.statusCode}');
  }
}

List<DropDownValueModel> roles = [];
DropDownValueModel? dropdownValueRole;
