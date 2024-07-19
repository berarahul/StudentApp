import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:studentapp/view/DropDown/widgets/DepartmentDropdownWidgets.dart';
import 'package:studentapp/view/DropDown/widgets/SemesterDropdownWidget.dart';
import '../../data/AppUrl.dart';
import '../../viewmodel/services/dropdownServices/DepartmentController.dart';
import '../../viewmodel/services/dropdownServices/SemesterController.dart';
import '../StudentRoutine.dart';

class DropdownScreenForRoutine extends StatelessWidget {
  final DepartmentController departmentController = Get.put(DepartmentController());
  final SemesterController semesterController = Get.put(SemesterController());
  final RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: const Center(child: Text("Routine")),
      ),

      body: Obx(() {
        return SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 45,),
                DepartmentDropdown(),
                SizedBox(height: 20),
                SemesterDropdown(),
                SizedBox(height: 250),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final selectedDeptId = departmentController.selectedDepartmentId.value;
                      final selectedSemId = semesterController.selectedSemesterId.value;

                      print("Selected Department ID: $selectedDeptId");
                      print("Selected Semester ID: $selectedSemId");

                      if (selectedDeptId == 0 || selectedSemId == 0) {
                        Get.snackbar("Error", "Please select both Department and Semester.");
                        return;
                      }

                      final apiUrl = AppUrl.fetchRoutine;
                      print("API URL: $apiUrl");

                      isLoading.value = true;

                      try {
                        final response = await http.get(Uri.parse(apiUrl));

                        if (response.statusCode == 200) {
                          var data = jsonDecode(response.body);
                          print("API Response Data: $data");
                          Get.to(() => ScheduleScreen());
                          Get.snackbar("Success", "Data fetched successfully.");

                        } else {
                          Get.snackbar("Error", "Failed to fetch data. Status code: ${response.statusCode}");
                        }
                      } catch (e) {
                        Get.snackbar("Error", "An error occurred: $e");
                      } finally {

                        isLoading.value = false;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      minimumSize: Size(200, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    child: isLoading.value
                        ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 2,
                      ),
                    )
                        : const Text('Submit', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}



//
//
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:studentapp/view/DropDown/widgets/DepartmentDropdownWidgets.dart';
// import 'package:studentapp/view/DropDown/widgets/SemesterDropdownWidget.dart';
// import '../../data/AppUrl.dart';
// import '../../viewmodel/services/dropdownServices/DepartmentController.dart';
// import '../../viewmodel/services/dropdownServices/SemesterController.dart';
// import '../StudentRoutine.dart';
//
// class DropdownScreenForRoutine extends StatelessWidget {
//   final DepartmentController departmentController = Get.put(DepartmentController());
//   final SemesterController semesterController = Get.put(SemesterController());
//   final RxBool isLoading = false.obs;
//   final Rx<List<Color>> _backgroundGradientColors = Rx<List<Color>>([]);
//
//   DropdownScreenForRoutine() {
//     _setBackgroundGradient();
//
//     Timer.periodic(const Duration(minutes: 1), (timer) {
//       _setBackgroundGradient();
//     });
//   }
//
//   void _setBackgroundGradient() {
//     DateTime now = DateTime.now();
//     List<Color> gradientColors;
//
//     if (now.hour >= 6 && now.hour < 12) {
//       gradientColors = [Colors.yellow, Colors.lightBlueAccent];
//     } else if (now.hour >= 12 && now.hour < 17) {
//       gradientColors = [Colors.orangeAccent, Colors.yellowAccent];
//     } else if (now.hour >= 17 && now.hour < 22) {
//       gradientColors = [Colors.redAccent, Colors.pinkAccent];
//     } else {
//       gradientColors = [Colors.indigo, Colors.black];
//     }
//
//     _backgroundGradientColors.value = gradientColors;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.blue,
//         title: const Center(child: Text("Routine")),
//       ),
//       body: Obx(() {
//         return Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: _backgroundGradientColors.value,
//             ),
//           ),
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 45,),
//                   DepartmentDropdown(),
//                   SizedBox(height: 20),
//                   SemesterDropdown(),
//                   SizedBox(height: 250),
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         final selectedDeptId = departmentController.selectedDepartmentId.value;
//                         final selectedSemId = semesterController.selectedSemesterId.value;
//
//                         print("Selected Department ID: $selectedDeptId");
//                         print("Selected Semester ID: $selectedSemId");
//
//                         if (selectedDeptId == 0 || selectedSemId == 0) {
//                           Get.snackbar("Error", "Please select both Department and Semester.");
//                           return;
//                         }
//
//                         final apiUrl = AppUrl.fetchRoutine;
//                         print("API URL: $apiUrl");
//
//                         isLoading.value = true;
//
//                         try {
//                           final response = await http.get(Uri.parse(apiUrl));
//
//                           if (response.statusCode == 200) {
//                             var data = jsonDecode(response.body);
//                             print("API Response Data: $data");
//                             Get.to(() => ScheduleScreen());
//                             Get.snackbar("Success", "Data fetched successfully.");
//                           } else {
//                             Get.snackbar("Error", "Failed to fetch data. Status code: ${response.statusCode}");
//                           }
//                         } catch (e) {
//                           Get.snackbar("Error", "An error occurred: $e");
//                         } finally {
//                           isLoading.value = false;
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.white, backgroundColor: Colors.blue,
//                         padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                         minimumSize: Size(200, 60),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         elevation: 5,
//                       ),
//                       child: isLoading.value
//                           ? const SizedBox(
//                         width: 24,
//                         height: 24,
//                         child: CircularProgressIndicator(
//                           color: Colors.black,
//                           strokeWidth: 2,
//                         ),
//                       )
//                           : const Text('Submit', style: TextStyle(fontSize: 16)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
