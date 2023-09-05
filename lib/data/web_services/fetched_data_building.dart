// This is Mohamed

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:coffee_ui/AppConstant/assests_manager.dart';

Future<List<DropDownValueModel>> fetchBuildings() async {
  AssetsManager assetsManager = AssetsManager();
  final response = await http.get(Uri.parse(
      'http://${assetsManager.ipAddress}:8080/admin/sites/building-data'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    if (data != null &&
        data['buildings'] != null &&
        data['buildings'] is List) {
      List<DropDownValueModel> buildings = [];
      // print(data);
      // print(data['buildings']);
      for (var building in data['buildings']) {
        // print(building['buildingname']);
        buildings.add(DropDownValueModel(
          value: building['buildingid'].toString(),
          name: building['buildingname'] ?? 'Noor',
        ));
      }

      return buildings;
    } else {
      throw Exception(
          'Buildings data is missing or not in the expected format.');
    }
  } else {
    throw Exception('Failed to load buildings: ${response.statusCode}');
  }
}

List<DropDownValueModel> buildings = [];
DropDownValueModel? dropdownValueBuilding;
