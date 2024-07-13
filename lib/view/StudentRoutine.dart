// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
//
// import '../model/ClassRoutineModel.dart';
// import '../viewmodel/services/routineServices/RoutineController.dart';
//
// class ScheduleScreen extends StatelessWidget {
//   final ScheduleController scheduleController = Get.put(ScheduleController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Class Schedule')),
//       body: Obx(() {
//         if (scheduleController.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         } else if (scheduleController.schedule.isEmpty) {
//           return Center(child: Text('No data available'));
//         } else {
//           return ListView.builder(
//             itemCount: scheduleController.schedule.keys.length,
//             itemBuilder: (ctx, index) {
//               String day = scheduleController.schedule.keys.elementAt(index);
//               List<Schedule> daySchedule = scheduleController.schedule[day]!;
//
//               return Card(
//                 margin: EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(10),
//                       color: Colors.blue,
//                       child: Text(
//                         day,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     ...daySchedule.map((schedule) {
//                       return ListTile(
//                         title: Text(schedule.subName),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Room: ${schedule.roomName}'),
//                             Text('Teacher: ${schedule.teacherName}'),
//                             Text('Paper Code: ${schedule.paperCode}'),
//                             Text('Time: ${schedule.startingTime} - ${schedule.endingTime}'),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                   ],
//                 ),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }

//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../model/ClassRoutineModel.dart';
// import '../viewmodel/services/routineServices/RoutineController.dart';
//
// class ScheduleScreen extends StatelessWidget {
//   final ScheduleController scheduleController = Get.put(ScheduleController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Class Schedule')),
//       body: Obx(() {
//         if (scheduleController.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         } else if (scheduleController.schedule.isEmpty) {
//           return Center(child: Text('No data available'));
//         } else {
//           return ListView.builder(
//             itemCount: scheduleController.schedule.keys.length,
//             itemBuilder: (ctx, index) {
//               String day = scheduleController.schedule.keys.elementAt(index);
//               List<Schedule> daySchedule = scheduleController.schedule[day]!;
//
//               return Card(
//                 margin: EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(10),
//                       color: Colors.blue,
//                       child: Text(
//                         day,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     Column(
//                       children: daySchedule.map((schedule) {
//                         return Card(
//                           margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                           child: Padding(
//                             padding: EdgeInsets.all(10),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   schedule.subName,
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(height: 5),
//                                 Text('Room: ${schedule.roomName}'),
//                                 Text('Teacher: ${schedule.teacherName}'),
//                                 Text('Paper Code: ${schedule.paperCode}'),
//                                 Text('Time: ${schedule.startingTime} - ${schedule.endingTime}'),
//                               ],
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }

//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../model/ClassRoutineModel.dart';
// import '../viewmodel/services/routineServices/RoutineController.dart';
//
// class ScheduleScreen extends StatelessWidget {
//   final ScheduleController scheduleController = Get.put(ScheduleController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Class Schedule')),
//       body: Obx(() {
//         if (scheduleController.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         } else if (scheduleController.schedule.isEmpty) {
//           return Center(child: Text('No data available'));
//         } else {
//           return ListView.builder(
//             itemCount: scheduleController.schedule.keys.length,
//             itemBuilder: (ctx, index) {
//               String day = scheduleController.schedule.keys.elementAt(index);
//               List<Schedule> daySchedule = scheduleController.schedule[day]!;
//
//               return Card(
//                 margin: EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       padding: EdgeInsets.all(10),
//                       color: Colors.blue,
//                       child: Text(
//                         day,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: GridView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 10,
//                           mainAxisSpacing: 10,
//                         ),
//                         itemCount: daySchedule.length,
//                         itemBuilder: (ctx, index) {
//                           Schedule schedule = daySchedule[index];
//                           return Card(
//                             margin: EdgeInsets.zero,
//                             child: Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     schedule.subName,
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(height: 5),
//                                   Text('Room: ${schedule.roomName}'),
//                                   Text('Teacher: ${schedule.teacherName}'),
//                                   Text('Paper Code: ${schedule.paperCode}'),
//                                   Text('Time: ${schedule.startingTime} - ${schedule.endingTime}'),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }
//










import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/ClassRoutineModel.dart';
import '../viewmodel/services/routineServices/RoutineController.dart';

class ScheduleScreen extends StatelessWidget {
  final ScheduleController scheduleController = Get.put(ScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Class Schedule')),
      body: Obx(() {
        if (scheduleController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (scheduleController.schedule.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          return ListView.builder(
            itemCount: scheduleController.schedule.keys.length,
            itemBuilder: (ctx, index) {
              String day = scheduleController.schedule.keys.elementAt(index);
              List<Schedule> daySchedule = scheduleController.schedule[day]!;

              return Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      color: Colors.blue,
                      child: Text(
                        day,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: daySchedule.length,
                          itemBuilder: (ctx, index) {
                            Schedule schedule = daySchedule[index];
                            return Card(
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      schedule.subName,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text('Room: ${schedule.roomName}'),
                                    Text('Teacher: ${schedule.teacherName}'),
                                    Text('Paper Code: ${schedule.paperCode}'),
                                    Text('Time: ${schedule.startingTime} - ${schedule.endingTime}'),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
