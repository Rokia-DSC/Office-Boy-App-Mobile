import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../AppConstant/assests_manager.dart';

Future<List<DropDownValueModel>> fetchSites() async {
  AssetsManager assetsManager = AssetsManager();
  final response = await http.get(Uri.parse(
      'http://${assetsManager.ipAddress}:8080/admin/sites/site-data'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    if (data != null && data['sites'] != null && data['sites'] is List) {
      List<DropDownValueModel> sites = [];
      // print(data);
      // print(data['sites']);
      for (var site in data['sites']) {
        // print(site['sitename']);
        sites.add(DropDownValueModel(
          value: site['siteid'].toString() ?? 'Rehap',
          name: site['sitename'] ?? 'Rehap',
        ));
      }

      return sites;
    } else {
      throw Exception('Sites data is missing or not in the expected format.');
    }
  } else {
    throw Exception('Failed to load sites: ${response.statusCode}');
  }
}

List<DropDownValueModel> sites = [];
DropDownValueModel? dropdownValueSite;
