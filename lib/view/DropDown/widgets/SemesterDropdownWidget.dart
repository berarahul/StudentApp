// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../viewmodel/services/dropdownServices/SemesterController.dart';
//
// class SemesterDropdown extends StatelessWidget {
//   final SemesterController semesterController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return DropdownButton<int>(
//         value: semesterController.selectedSemesterId.value == 0
//             ? null
//             : semesterController.selectedSemesterId.value,
//         hint: Text('Select Semester'),
//         items: semesterController.semesterList.map((semester) {
//           return DropdownMenuItem<int>(
//             value: semester.id,
//             child: Text(semester.semesterName),
//           );
//         }).toList(),
//         onChanged: (value) {
//           if (value != null) {
//             semesterController.selectSemester(value);
//           }
//         },
//       );
//     });
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../viewmodel/services/dropdownServices/SemesterController.dart';

class SemesterDropdown extends StatelessWidget {
  final SemesterController semesterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonFormField<int>(
        value: semesterController.selectedSemesterId.value == 0
            ? null
            : semesterController.selectedSemesterId.value,
        decoration: InputDecoration(
          labelText: 'Select Semester',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          filled: true,
          fillColor: Colors.grey.shade200,
        ),
        items: semesterController.semesterList.map((semester) {
          return DropdownMenuItem<int>(
            value: semester.id,
            child: Text(
              semester.semesterName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            semesterController.selectSemester(value);
          }
        },
        dropdownColor: Colors.white,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 30,
        style: TextStyle(color: Colors.black, fontSize: 16),
        isExpanded: true,
      );
    });
  }
}
