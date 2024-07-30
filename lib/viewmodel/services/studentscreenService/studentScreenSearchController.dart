// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:get_storage/get_storage.dart';
//
// import '../../../model/SubjectAndStudentModel.dart';
//
// class StudentSearchController extends GetxController {
//   var student = Rxn<Student>();
//   var isLoading = false.obs;
//   final GetStorage storage = GetStorage();
//   var selectedSubject = ''.obs; // Define selectedSubject as an observable string
//
//   Future<void> search(String query) async {
//     isLoading(true);
//     try {
//       final res = await http.get(
//         Uri.parse('https://attendancesystem-s1.onrender.com/api/attendanceP/$query'),
//       );
//
//       if (res.statusCode == 200) {
//         student.value = Student.fromJson(jsonDecode(res.body));
//         storage.write('studentId', query); // Store the student ID in local storage
//       } else {
//         Get.snackbar('Error', 'Failed to fetch data');
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'Something went wrong');
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   String? getStoredStudentId() {
//     return storage.read('studentId'); // Retrieve the stored student ID
//   }
// }

//
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:get_storage/get_storage.dart';
//
// import '../../../model/SubjectAndStudentModel.dart';
//
// class StudentSearchController extends GetxController {
//   var student = Rxn<Student>();
//   var isLoading = false.obs;
//   var selectedSubject = ''.obs; // Observable for selected subject ID
//   final GetStorage storage = GetStorage();
//
//   Future<void> search(String query) async {
//     isLoading(true);
//     try {
//       final res = await http.get(
//         Uri.parse('https://attendancesystem-s1.onrender.com/api/attendanceP/$query'),
//       );
//
//       if (res.statusCode == 200) {
//         student.value = Student.fromJson(jsonDecode(res.body));
//         storage.write('studentId', query); // Store the student ID in local storage
//       } else {
//         Get.snackbar('Error', 'Failed to fetch data');
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'Something went wrong');
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   String? getStoredStudentId() {
//     return storage.read('studentId'); // Retrieve the stored student ID
//   }
//
//   Future<void> fetchSubjectDetails(String subjectId) async {
//     isLoading(true);
//     try {
//       final studentId = storage.read('studentId');
//       if (studentId == null) {
//         Get.snackbar('Error', 'Student ID not found');
//         return;
//       }
//
//       final res = await http.get(
//         Uri.parse('https://attendancesystem-s1.onrender.com/api/attendanceP/$studentId/$subjectId'),
//       );
//
//       if (res.statusCode == 200) {
//         // Handle the response according to your data model
//         // Example assuming response is of type SubjectDetails
//         // Update the model class according to your API response structure
//         // student.value = SubjectDetails.fromJson(jsonDecode(res.body));
//       } else {
//         Get.snackbar('Error', 'Failed to fetch subject details');
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'Something went wrong');
//     } finally {
//       isLoading(false);
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:studentapp/viewmodel/services/studentscreenService/studentIdstorage/student%20idStore.dart';
import 'dart:convert';

// Assuming Student model is defined in Student.dart
import '../../../model/SubjectAndStudentModel.dart';
import '../../../model/subjectModel.dart';
// Import your StudentIdStorage service

class StudentSearchController extends GetxController {
  var student = Rxn<Student>();
  var isLoading = false.obs;
  var selectedSubject = ''.obs; // Observable for selected subject ID
  var subject = Rxn<Subjectforchart>(); // Observable for subject details
  final StudentIdStorage _studentIdStorage = StudentIdStorage();

  Future<void> search(String query) async {
    isLoading(true);
    try {
      final res = await http.get(
        Uri.parse(
            'https://attendancesystem-s1.onrender.com/api/attendanceP/$query'),
      );

      if (res.statusCode == 200) {
        student.value = Student.fromJson(jsonDecode(res.body));
        _studentIdStorage
            .writeStudentId(query); // Store the student ID in local storage
      } else {
        Get.snackbar('Error', 'Failed to fetch data');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading(false);
    }
  }

  String? getStoredStudentId() {
    return _studentIdStorage.readStudentId(); // Retrieve the stored student ID
  }

//   Future<void> fetchSubjectDetails(String subjectId) async {
//     isLoading(true);
//     try {
//       final studentId = _studentIdStorage.readStudentId();
//       if (studentId == null) {
//         Get.snackbar('Error', 'Student ID not found');
//         isLoading(false); // Ensure isLoading is set to false in error cases
//         return;
//       }
//
//       final res = await http.get(
//         Uri.parse(
//             'https://attendancesystem-s1.onrender.com/api/attendanceP/$studentId/$subjectId'),
//       );
//
//       if (res.statusCode == 200) {
//         final subjectData = jsonDecode(res.body);
//         subject.value = Subjectforchart(
//           subName: subjectData['subName'] ?? '',
//           classAttended: subjectData['classAttended'] ?? 0,
//           totalClass: subjectData['totalClass'] ?? 0,
//         );
//       } else {
//         print(
//             'Failed to fetch subject details. Status code: ${res.statusCode}');
//         Get.snackbar('Error', 'Failed to fetch subject details');
//       }
//     } catch (e) {
//       print('Exception during subject details fetch: $e');
//       Get.snackbar('Error', 'Something went wrong');
//     } finally {
//       isLoading(false);
//     }
//   }
// }

  Future<void> fetchSubjectDetails(String subjectId) async {
    isLoading(true);
    try {
      final studentId = _studentIdStorage.readStudentId();
      if (studentId == null) {
        Get.snackbar('Error', 'Student ID not found');
        return;
      }

      final res = await http.get(
        Uri.parse(
            'https://attendancesystem-s1.onrender.com/api/attendanceP/$studentId/$subjectId'),
      );

      if (res.statusCode == 200) {
        final subjectData = jsonDecode(res.body);
        subject.value = Subjectforchart.fromJson(subjectData);
      } else {
        Get.snackbar('Error', 'Failed to fetch subject details');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading(false);
    }
  }
}
