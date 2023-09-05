import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../AppConstant/assests_manager.dart';

Future<List<DropDownValueModel>> fetchOffices() async {
  AssetsManager assetsManager = AssetsManager();
  final response = await http.get(Uri.parse(
      'http://${assetsManager.ipAddress}:8080/admin/sites/office-data'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print(data['offices']);
    if (data != null && data['offices'] != null && data['offices'] is List) {
      List<DropDownValueModel> offices = [];
      for (var office in data['offices']) {
        offices.add(DropDownValueModel(
          value: office['officeid'].toString() ?? '1',
          name: office['officeno'].toString() ?? '1',
        ));
      }

      return offices;
    } else {
      throw Exception('Offices data is missing or not in the expected format.');
    }
  } else {
    throw Exception('Failed to load offices: ${response.statusCode}');
  }
}

List<DropDownValueModel> offices = [];
DropDownValueModel? dropdownValueOffice;
