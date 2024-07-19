import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/ClassRoutineModel.dart';
import '../viewmodel/services/routineServices/RoutineController.dart';

class ScheduleScreen extends StatelessWidget {
  final ScheduleController scheduleController = Get.put(ScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          title:  const Center(child: Text('Routine Schedule',style: TextStyle(color: Colors.white),))

      ),

      body: Obx(() {
        if (scheduleController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (scheduleController.schedule.isEmpty) {
          return const Center(child: Center(child: Text('No data available')));
        } else {

          return ListView.builder(
            itemCount: scheduleController.schedule.keys.length,
            itemBuilder: (ctx, index) {
              String day = scheduleController.schedule.keys.elementAt(index);
              List<Schedule> daySchedule = scheduleController.schedule[day]!;

              return Card(

                margin: const EdgeInsets.all(10),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 45,),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      color: Colors.blue,
                      child: Text(
                        day,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.3, // Adjust this ratio as needed
                        ),
                        itemCount: daySchedule.length,
                        itemBuilder: (ctx, index) {
                          Schedule schedule = daySchedule[index];
                          return Card(
                            margin: EdgeInsets.zero,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      schedule.subName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text('Room: ${schedule.roomName}'),
                                    Text('Teacher: ${schedule.teacherName}'),
                                    Text('Paper Code: ${schedule.paperCode}'),
                                    Text('Time: ${schedule.startingTime} - ${schedule.endingTime}'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
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
