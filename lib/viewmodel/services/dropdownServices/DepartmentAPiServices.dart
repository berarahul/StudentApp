import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:studentapp/data/AppUrl.dart';

import '../../../model/alldepartmentModel.dart';

class DepartmentService {
  Future<List<DepartmentModel>> fetchDepartments() async {
    final response = await http.get(Uri.parse(AppUrl.AllDepartmentApiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((department) => DepartmentModel.fromJson(department))
          .toList();
    } else {
      throw Exception('Failed to load departments');
    }
  }
}
