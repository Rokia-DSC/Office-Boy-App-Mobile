import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../AppConstant/assests_manager.dart';

Future<List<DropDownValueModel>> fetchRooms() async {
  AssetsManager assetsManager = AssetsManager();
  final response = await http.get(Uri.parse(
      'http://${assetsManager.ipAddress}:8080/admin/sites/room-data'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print(data['rooms']);
    if (data != null && data['rooms'] != null && data['rooms'] is List) {
      List<DropDownValueModel> rooms = [];
      for (var room in data['rooms']) {
        rooms.add(DropDownValueModel(
          value: room['roomid'].toString() + ' ' + room['roomno'].toString() ??
              '1',
          name: room['roomname'] + ' ' + room['roomno'].toString() ?? '1',
        ));
      }

      return rooms;
    } else {
      throw Exception('Rooms data is missing or not in the expected format.');
    }
  } else {
    throw Exception('Failed to load rooms: ${response.statusCode}');
  }
}

List<DropDownValueModel> rooms = [];
DropDownValueModel? dropdownValueRooms;
