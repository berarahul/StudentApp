// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../constant/routes/AppColors.dart';
// import '../constant/routes/approutes.dart';
//
// class StudentInformationCard extends StatelessWidget {
//   final List<String> buttonNames = ['Student', 'Routine'];
//   final List<String> iconPaths = [
//     'assets/images/studentinfo.png',
//     'assets/images/routine.png',
//   ];
//
//   StudentInformationCard({super.key});
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
//       gradientColors = [AppColors.softRed, AppColors.peach];
//     } else {
//       greeting = 'Good Night';
//       gradientColors = [Colors.indigo, Colors.black];
//     }
//
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: gradientColors,
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 20),
//                       Text(
//                         greeting,
//                         style: const TextStyle(
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Column(
//                         children: List.generate(buttonNames.length, (index) {
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 10.0),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   flex: 2,
//                                   child: AdminCard(
//                                     title: buttonNames[index],
//                                     iconPath: iconPaths[index],
//                                     onTap: () {
//                                       print('Tapped on: ${buttonNames[index]}');
//                                       if (buttonNames[index] == 'Student') {
//                                         Get.toNamed(AppRoutes.studentDetails);
//                                       } else if (buttonNames[index] == 'Routine') {
//                                         Get.toNamed(AppRoutes.routineView);
//                                       }
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AdminCard extends StatelessWidget {
//   final String title;
//   final String iconPath;
//   final VoidCallback onTap;
//
//   const AdminCard({super.key, required this.title, required this.iconPath, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         shadowColor: Colors.black,
//         color: AppColors.appcolor,
//         elevation: 6,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             children: [
//               IconCard(iconPath: iconPath),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Text(
//                   title,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class IconCard extends StatelessWidget {
//   final String iconPath;
//
//   const IconCard({super.key, required this.iconPath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Image.asset(
//         iconPath,
//         width: 50,
//         height: 50,
//       ),
//     );
//   }
// }

//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../constant/routes/AppColors.dart';
// import '../constant/routes/approutes.dart';
//
// class StudentInformationCard extends StatelessWidget {
//   final List<String> buttonNames = ['Student', 'Routine'];
//   final List<String> iconPaths = [
//     'assets/images/studentinfo.png',
//     'assets/images/routine.png',
//   ];
//
//   StudentInformationCard({super.key});
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
//       gradientColors = [AppColors.softRed, AppColors.peach];
//     } else {
//       greeting = 'Good Night';
//       gradientColors = [Colors.indigo, Colors.black];
//     }
//
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: gradientColors,
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 20),
//                       Text(
//                         greeting,
//                         style: const TextStyle(
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Column(
//                         children: List.generate(buttonNames.length, (index) {
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 10.0),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   flex: 2,
//                                   child: AdminCard(
//                                     title: buttonNames[index],
//                                     iconPath: iconPaths[index],
//                                     onTap: () {
//                                       print('Tapped on: ${buttonNames[index]}');
//                                       if (buttonNames[index] == 'Student') {
//                                         Get.toNamed(AppRoutes.studentDetails);
//                                       } else if (buttonNames[index] == 'Routine') {
//                                         Get.toNamed(AppRoutes.routineView);
//                                       }
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }),
//                       ),
//                       const SizedBox(height: 20),
//                       // Adding Holiday Notice Card
//                       Container(
//                         margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                         child: Card(
//                           elevation: 8,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                           ),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15.0),
//                               gradient: LinearGradient(
//                                 colors: gradientColors,
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: const [
//                                       Text(
//                                         'Holiday Notice',
//                                         style: TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       Icon(
//                                         Icons.notifications,
//                                         color: Colors.white,
//                                       ),
//                                     ],
//                                   ),
//                                   Divider(color: Colors.white),
//                                   const SizedBox(height: 8.0),
//                                   const Text(
//                                     'Reason: Example Reason',
//                                     style: TextStyle(fontSize: 16, color: Colors.white),
//                                   ),
//                                   const SizedBox(height: 8.0),
//                                   const Text(
//                                     'Start Date: 2024-07-25',
//                                     style: TextStyle(fontSize: 16, color: Colors.white),
//                                   ),
//                                   const SizedBox(height: 8.0),
//                                   const Text(
//                                     'End Date: 2024-07-30',
//                                     style: TextStyle(fontSize: 16, color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AdminCard extends StatelessWidget {
//   final String title;
//   final String iconPath;
//   final VoidCallback onTap;
//
//   const AdminCard({super.key, required this.title, required this.iconPath, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         shadowColor: Colors.black,
//         color: AppColors.appcolor,
//         elevation: 6,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             children: [
//               IconCard(iconPath: iconPath),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Text(
//                   title,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class IconCard extends StatelessWidget {
//   final String iconPath;
//
//   const IconCard({super.key, required this.iconPath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Image.asset(
//         iconPath,
//         width: 50,
//         height: 50,
//       ),
//     );
//   }
// }

//
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../viewmodel/services/HolidayServices/holidayController.dart';
// import '../constant/routes/AppColors.dart';
// import '../constant/routes/approutes.dart';
// // Import your holiday controller
//
// class StudentInformationCard extends StatelessWidget {
//   final List<String> buttonNames = ['Student', 'Routine'];
//   final List<String> iconPaths = [
//     'assets/images/studentinfo.png',
//     'assets/images/routine.png',
//   ];
//
//   final HolidayController holidayController = Get.put(HolidayController());
//
//   StudentInformationCard({super.key});
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
//       gradientColors = [AppColors.softRed, AppColors.peach];
//     } else {
//       greeting = 'Good Night';
//       gradientColors = [Colors.indigo, Colors.black];
//     }
//
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: gradientColors,
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 20),
//                 Text(
//                   greeting,
//                   style: const TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: buttonNames.length + 1, // Adding one for the holiday card
//                   itemBuilder: (context, index) {
//                     if (index < buttonNames.length) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10.0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               flex: 2,
//                               child: AdminCard(
//                                 title: buttonNames[index],
//                                 iconPath: iconPaths[index],
//                                 onTap: () {
//                                   print('Tapped on: ${buttonNames[index]}');
//                                   if (buttonNames[index] == 'Student') {
//                                     Get.toNamed(AppRoutes.studentDetails);
//                                   } else if (buttonNames[index] == 'Routine') {
//                                     Get.toNamed(AppRoutes.routineView);
//                                   }
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     } else {
//                       return Obx(() {
//                         if (holidayController.holidays.isEmpty) {
//                           return SizedBox.shrink(); // No holidays, so return an empty widget
//                         } else {
//                           return ListView.builder(
//                             shrinkWrap: true,
//                             physics: NeverScrollableScrollPhysics(),
//                             itemCount: holidayController.holidays.length,
//                             itemBuilder: (context, holidayIndex) {
//                               final holiday = holidayController.holidays[holidayIndex];
//                               return Container(
//                                 margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                                 child: Card(
//                                   elevation: 8,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15.0),
//                                       gradient: LinearGradient(
//                                         colors: gradientColors,
//                                         begin: Alignment.topLeft,
//                                         end: Alignment.bottomRight,
//                                       ),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(16.0),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           const Row(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Holiday Notice',
//                                                 style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                               Icon(
//                                                 Icons.notifications,
//                                                 color: Colors.white,
//                                               ),
//                                             ],
//                                           ),
//                                           Divider(color: Colors.white),
//                                           const SizedBox(height: 8.0),
//                                           Text(
//                                             'Reason: ${holiday['reason']}',
//                                             style: TextStyle(fontSize: 16, color: Colors.white),
//                                           ),
//                                           const SizedBox(height: 8.0),
//                                           Text(
//                                             'Start Date: ${holiday['startDate']}',
//                                             style: TextStyle(fontSize: 16, color: Colors.white),
//                                           ),
//                                           const SizedBox(height: 8.0),
//                                           Text(
//                                             'End Date: ${holiday['endDate']}',
//                                             style: TextStyle(fontSize: 16, color: Colors.white),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         }
//                       });
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class AdminCard extends StatelessWidget {
//   final String title;
//   final String iconPath;
//   final VoidCallback onTap;
//
//   const AdminCard({super.key, required this.title, required this.iconPath, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         shadowColor: Colors.black,
//         color: AppColors.appcolor,
//         elevation: 6,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             children: [
//               IconCard(iconPath: iconPath),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Text(
//                   title,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class IconCard extends StatelessWidget {
//   final String iconPath;
//
//   const IconCard({super.key, required this.iconPath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Image.asset(
//         iconPath,
//         width: 50,
//         height: 50,
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../viewmodel/services/HolidayServices/holidayController.dart';
import '../constant/routes/AppColors.dart';
import '../constant/routes/approutes.dart';

class StudentInformationCard extends StatelessWidget {
  final List<String> buttonNames = ['Student', 'Routine'];
  final List<String> iconPaths = [
    'assets/images/studentinfo.png',
    'assets/images/routine.png',
  ];

  final HolidayController holidayController = Get.put(HolidayController());

  StudentInformationCard({super.key});

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
      gradientColors = [AppColors.softRed, AppColors.peach];
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                greeting,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount:
                      buttonNames.length + 1, // Adding one for the holiday card
                  itemBuilder: (context, index) {
                    if (index < buttonNames.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: AdminCard(
                                title: buttonNames[index],
                                iconPath: iconPaths[index],
                                onTap: () {
                                  print('Tapped on: ${buttonNames[index]}');
                                  if (buttonNames[index] == 'Student') {
                                    Get.toNamed(AppRoutes.studentDetails);
                                  } else if (buttonNames[index] == 'Routine') {
                                    Get.toNamed(AppRoutes.routineView);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Obx(() {
                        if (holidayController.holidays.isEmpty) {
                          return SizedBox
                              .shrink(); // No holidays, so return an empty widget
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: holidayController.holidays.length,
                            itemBuilder: (context, holidayIndex) {
                              final holiday =
                                  holidayController.holidays[holidayIndex];
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      gradient: LinearGradient(
                                        colors: gradientColors,
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Holiday Notice',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Icon(
                                                Icons.notifications,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                          Divider(color: Colors.white),
                                          const SizedBox(height: 8.0),
                                          Text(
                                            'Reason: ${holiday['reason']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(height: 8.0),
                                          Text(
                                            'Start Date: ${holiday['startDate']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(height: 8.0),
                                          Text(
                                            'End Date: ${holiday['endDate']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  const AdminCard(
      {super.key,
      required this.title,
      required this.iconPath,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shadowColor: Colors.black,
        color: AppColors.appcolor,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              IconCard(iconPath: iconPath),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  final String iconPath;

  const IconCard({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(
        iconPath,
        width: 50,
        height: 50,
      ),
    );
  }
}
