import 'package:get_storage/get_storage.dart';

class AppUrl {
  static const String baseurl = "https://attendancesystem-s1.onrender.com";


  static String get AllDepartmentApiUrl{

    return "$baseurl/api/dept/all";
  }
static String get fetchRoutine{
  final storage = GetStorage();
  int? deptId = storage.read('selectedDepartmentId');
  int? semId = storage.read('selectedSemesterId');

  print(deptId);
  print(semId);
  if (deptId != null && semId != null) {
    return "$baseurl/api/classRoutine/getRoutine?deptId=$deptId&sem=$semId";

  } else {
    return "$baseurl/api/classRoutine/getRoutine?deptId=1&sem=1"; // default or handle error
  }
}

}

