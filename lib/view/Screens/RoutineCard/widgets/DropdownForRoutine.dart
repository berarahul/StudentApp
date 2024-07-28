// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:studentapp/view/DropDown/widgets/DepartmentDropdownWidgets.dart';
// import 'package:studentapp/view/DropDown/widgets/SemesterDropdownWidget.dart';
// import '../../../../data/AppUrl.dart';
// import '../../../../viewmodel/services/dropdownServices/DepartmentController.dart';
// import '../../../../viewmodel/services/dropdownServices/SemesterController.dart';
// import 'RoutineScreen.dart';
//
//
// class DropdownScreenForRoutine extends StatelessWidget {
//   final DepartmentController departmentController = Get.put(DepartmentController());
//   final SemesterController semesterController = Get.put(SemesterController());
//   final RxBool isLoading = false.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final isDarkMode = theme.brightness == Brightness.dark;
//
//     return Scaffold(
//
//       body: Obx(() {
//         return SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 45),
//                 DepartmentDropdown(),
//                 const SizedBox(height: 20),
//                 SemesterDropdown(),
//                 const SizedBox(height: 250),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       final selectedDeptId = departmentController.selectedDepartmentId.value;
//                       final selectedSemId = semesterController.selectedSemesterId.value;
//
//                       print("Selected Department ID: $selectedDeptId");
//                       print("Selected Semester ID: $selectedSemId");
//
//                       if (selectedDeptId == 0 || selectedSemId == 0) {
//                         Get.snackbar("Error", "Please select both Department and Semester.");
//                         return;
//                       }
//
//                       final apiUrl = AppUrl.fetchRoutine;
//                       print("API URL: $apiUrl");
//
//                       isLoading.value = true;
//
//                       try {
//                         final response = await http.get(Uri.parse(apiUrl));
//
//                         if (response.statusCode == 200) {
//                           var data = jsonDecode(response.body);
//                           print("API Response Data: $data");
//                           Get.to(() => ScheduleScreen());
//                           Get.snackbar("Success", "Data fetched successfully.");
//                         } else {
//                           Get.snackbar("Error", "Failed to fetch data. Status code: ${response.statusCode}");
//                         }
//                       } catch (e) {
//                         Get.snackbar("Error", "An error occurred: $e");
//                       } finally {
//                         isLoading.value = false;
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: theme.colorScheme.onPrimary, backgroundColor: Colors.blue, // Adapt text color to theme
//                       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                       minimumSize: const Size(200, 60),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       elevation: 5,
//                     ),
//                     child: isLoading.value
//                         ? const SizedBox(
//                       width: 24,
//                       height: 24,
//                       child: CircularProgressIndicator(
//                         color: Colors.black,
//                         strokeWidth: 2,
//                       ),
//                     )
//                         : const Text('Submit', style: TextStyle(fontSize: 16)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
//


//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:studentapp/view/DropDown/widgets/DepartmentDropdownWidgets.dart';
// import 'package:studentapp/view/DropDown/widgets/SemesterDropdownWidget.dart';
// import '../../../../data/AppUrl.dart';
// import '../../../../viewmodel/services/dropdownServices/DepartmentController.dart';
// import '../../../../viewmodel/services/dropdownServices/SemesterController.dart';
// import 'RoutineScreen.dart';
//
// class DropdownScreenForRoutine extends StatelessWidget {
//   final DepartmentController departmentController = Get.put(DepartmentController());
//   final SemesterController semesterController = Get.put(SemesterController());
//   final RxBool isLoading = false.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     final DateTime now = DateTime.now();
//     final String greeting;
//     final List<Color> gradientColors;
//
//     if (now.hour >= 6 && now.hour < 12) {
//       greeting = 'Good Morning';
//       gradientColors = [Colors.yellow, Colors.lightBlueAccent];
//     } else if (now.hour >= 12 && now.hour < 17) {
//       greeting = 'Good Afternoon';
//       gradientColors = [Colors.orangeAccent, Colors.yellowAccent];
//     } else if (now.hour >= 17 && now.hour < 22) {
//       greeting = 'Good Evening';
//       gradientColors = [Colors.deepOrange, Colors.pinkAccent];
//     } else {
//       greeting = 'Good Night';
//       gradientColors = [Colors.indigo, Colors.black];
//     }
//
//     return Scaffold(
//
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: gradientColors,
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Obx(() {
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 20),
//                   Text(
//                     greeting,
//                     style: const TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   DepartmentDropdown(),
//                   const SizedBox(height: 20),
//                   SemesterDropdown(),
//                   const SizedBox(height: 250),
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
//                         foregroundColor: Theme.of(context).colorScheme.onPrimary,
//                         backgroundColor: Colors.blue,
//                         padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                         minimumSize: const Size(200, 60),
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
//           );
//         }),
//       ),
//     );
//   }
// }


//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:studentapp/view/DropDown/widgets/DepartmentDropdownWidgets.dart';
// import 'package:studentapp/view/DropDown/widgets/SemesterDropdownWidget.dart';
// import '../../../../data/AppUrl.dart';
// import '../../../../viewmodel/services/dropdownServices/DepartmentController.dart';
// import '../../../../viewmodel/services/dropdownServices/SemesterController.dart';
// import 'RoutineScreen.dart';
//
// class DropdownScreenForRoutine extends StatelessWidget {
//   final DepartmentController departmentController = Get.put(DepartmentController());
//   final SemesterController semesterController = Get.put(SemesterController());
//   final RxBool isLoading = false.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     final DateTime now = DateTime.now();
//     final String greeting;
//     final List<Color> gradientColors;
//
//     if (now.hour >= 6 && now.hour < 12) {
//       greeting = 'Good Morning';
//       gradientColors = [Colors.yellow, Colors.lightBlueAccent];
//     } else if (now.hour >= 12 && now.hour < 17) {
//       greeting = 'Good Afternoon';
//       gradientColors = [Colors.orangeAccent, Colors.yellowAccent];
//     } else if (now.hour >= 17 && now.hour < 22) {
//       greeting = 'Good Evening';
//       gradientColors = [Colors.deepOrange, Colors.pinkAccent];
//     } else {
//       greeting = 'Good Night';
//       gradientColors = [Colors.indigo, Colors.black];
//     }
//
//     return Scaffold(
//
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: gradientColors,
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: ConstrainedBox(
//             constraints: BoxConstraints(
//               minHeight: MediaQuery.of(context).size.height,
//             ),
//             child: IntrinsicHeight(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 80),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16.0),
//
//                   ),
//                   const SizedBox(height: 20),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: DepartmentDropdown(),
//                   ),
//                   const SizedBox(height: 20),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: SemesterDropdown(),
//                   ),
//                   const Spacer(),
//                   Center(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: ElevatedButton(
//                         onPressed: () async {
//                           final selectedDeptId = departmentController.selectedDepartmentId.value;
//                           final selectedSemId = semesterController.selectedSemesterId.value;
//
//                           print("Selected Department ID: $selectedDeptId");
//                           print("Selected Semester ID: $selectedSemId");
//
//                           if (selectedDeptId == 0 || selectedSemId == 0) {
//                             Get.snackbar("Error", "Please select both Department and Semester.");
//                             return;
//                           }
//
//                           final apiUrl = AppUrl.fetchRoutine;
//                           print("API URL: $apiUrl");
//
//                           isLoading.value = true;
//
//                           try {
//                             final response = await http.get(Uri.parse(apiUrl));
//
//                             if (response.statusCode == 200) {
//                               var data = jsonDecode(response.body);
//                               print("API Response Data: $data");
//                               Get.to(() => ScheduleScreen());
//                               Get.snackbar("Success", "Data fetched successfully.");
//                             } else {
//                               Get.snackbar("Error", "Failed to fetch data. Status code: ${response.statusCode}");
//                             }
//                           } catch (e) {
//                             Get.snackbar("Error", "An error occurred: $e");
//                           } finally {
//                             isLoading.value = false;
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           foregroundColor: Theme.of(context).colorScheme.onPrimary,
//                           backgroundColor: Colors.blue,
//                           padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                           minimumSize: const Size(200, 60),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           elevation: 5,
//                         ),
//                         child: isLoading.value
//                             ? const SizedBox(
//                           width: 24,
//                           height: 24,
//                           child: CircularProgressIndicator(
//                             color: Colors.black,
//                             strokeWidth: 2,
//                           ),
//                         )
//                             : const Text('Submit', style: TextStyle(fontSize: 16)),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:studentapp/view/DropDown/widgets/DepartmentDropdownWidgets.dart';
import 'package:studentapp/view/DropDown/widgets/SemesterDropdownWidget.dart';
import '../../../../data/AppUrl.dart';
import '../../../../viewmodel/services/dropdownServices/DepartmentController.dart';
import '../../../../viewmodel/services/dropdownServices/SemesterController.dart';
import 'RoutineScreen.dart';

class DropdownScreenForRoutine extends StatelessWidget {
  final DepartmentController departmentController = Get.put(DepartmentController());
  final SemesterController semesterController = Get.put(SemesterController());
  final RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String greeting;
    final List<Color> gradientColors;

    if (now.hour >= 6 && now.hour < 12) {
      greeting = 'Good Morning';
      gradientColors = [Colors.yellow, Colors.lightBlueAccent];
    } else if (now.hour >= 12 && now.hour < 17) {
      greeting = 'Good Afternoon';
      gradientColors = [Colors.orangeAccent, Colors.yellowAccent];
    } else if (now.hour >= 17 && now.hour < 22) {
      greeting = 'Good Evening';
      gradientColors = [Colors.deepOrange, Colors.pinkAccent];
    } else {
      greeting = 'Good Night';
      gradientColors = [Colors.indigo, Colors.black];
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: DepartmentDropdown(),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SemesterDropdown(),
                  ),
                  const Spacer(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Obx(
                            () => ElevatedButton(
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
                            foregroundColor: Theme.of(context).colorScheme.onPrimary,
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                            minimumSize: const Size(200, 60),
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
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
