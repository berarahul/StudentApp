import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart'; // Import fl_chart library
import 'package:get_storage/get_storage.dart';
import 'package:studentapp/viewmodel/services/dropdownServices/DepartmentController.dart';
import 'package:studentapp/viewmodel/services/dropdownServices/SemesterController.dart';
import '../../model/subjectModel.dart';
import '../../viewmodel/services/studentscreenService/studentScreenSearchController.dart';
import '../DropDown/DropdownScreenForRoutine.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final StudentSearchController _searchController = Get.put(StudentSearchController());
  final _storage = GetStorage(); // GetStorage instance
  late Rx<List<Color>> _backgroundGradientColors = Rx<List<Color>>([]); // Initialize with empty list
  late Rx<String> _greeting = Rx<String>(''); // Initialize with empty string

  @override
  Widget build(BuildContext context) {
    // Initialize background gradient and greeting message
    _setBackgroundGradientAndGreeting();

    // Update background gradient and greeting message every minute
    Timer.periodic(const Duration(minutes: 1), (timer) {
      _setBackgroundGradientAndGreeting();
    });

    // Retrieve the stored student ID and set it to the TextField
    String? storedStudentId = _searchController.getStoredStudentId();
    if (storedStudentId != null) {
      _controller.text = storedStudentId;
    }

    return

      Scaffold(

      extendBodyBehindAppBar: true,
      body: Obx(() {

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: _backgroundGradientColors.value,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                _greeting.value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Optional: Change color based on background
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _controller,
                  onChanged: (value) {
                    // Store the student ID in GetStorage whenever it changes
                    _storage.write('studentId', value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter Student Id',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _searchController.search(_controller.text); // Trigger search
                },
                child: const Text('Search'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (_searchController.isLoading.value)
                        const CircularProgressIndicator()
                      else if (_searchController.student.value != null)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                elevation: 4,
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name: ${_searchController.student.value!.name}',
                                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Semester: ${_searchController.student.value!.sem}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Class Roll: ${_searchController.student.value!.classRoll}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Department Name: ${_searchController.student.value!.departmentName}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'ID: ${_searchController.student.value!.id}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 16),
                                      // Dropdown for Subjects
                                      DropdownButton<String>(
                                        value: _searchController.selectedSubject.value ?? '',
                                        onChanged: (newValue) {
                                          _searchController.selectedSubject.value = newValue!;
                                          // Fetch subject details when subject is selected
                                          _searchController.fetchSubjectDetails(newValue);
                                        },
                                        isExpanded: true,
                                        items: [
                                          const DropdownMenuItem(
                                            value: '',
                                            child: Text('Select a Subject'), // Default text
                                          ),
                                          ..._searchController.student.value!.subjects.map((subject) {
                                            return DropdownMenuItem(
                                              value: subject.subjectId.toString(), // Assuming subjectId is int
                                              child: Text(
                                                subject.subjectName,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            );
                                          }).toList(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Obx(() {
                                if (_searchController.isLoading.value) {
                                  return const CircularProgressIndicator();
                                }

                                final subject = _searchController.subject.value;
                                if (subject == null || subject.subName == null) {
                                  return Container();
                                }

                                // Display column chart
                                return Center(
                                  child: GestureDetector(
                                    onTap: () => _showBarChartDialog(context, subject),
                                    child: Card(
                                      elevation: 4,
                                      margin: const EdgeInsets.symmetric(vertical: 10),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Subject Name: ${subject.subName}',
                                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              'Classes Attended: ${subject.classAttended}',
                                              style: const TextStyle(fontSize: 16),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              'Total Classes: ${subject.totalClass}',
                                              style: const TextStyle(fontSize: 16),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              'Max Attendance: ${subject.maxAttendance}',
                                              style: const TextStyle(fontSize: 16),
                                            ),
                                        const SizedBox(height: 16),
                                        // Add your new button here

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Your button action
                                    Get.to(DropdownScreenForRoutine());

                                  },
                                  child: Text('Show Routine'),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],

                  ),

                ),
              ),
            ],
          ),
        );
      }),
          );
  }

  void _setBackgroundGradientAndGreeting() {
    DateTime now = DateTime.now();
    String greeting;
    List<Color> gradientColors;

    if (now.hour >= 6 && now.hour < 12) {
      greeting = 'Good Morning';
      gradientColors = [Colors.yellow, Colors.lightBlueAccent];
    } else if (now.hour >= 12 && now.hour < 17) {
      greeting = 'Good Afternoon';
      gradientColors = [Colors.orangeAccent, Colors.yellowAccent];
    } else if (now.hour >= 17 && now.hour < 22) {
      greeting = 'Good Evening';
      gradientColors = [Colors.redAccent, Colors.pinkAccent];
    } else {
      greeting = 'Good Night';
      gradientColors = [Colors.indigo, Colors.black];
    }

    _backgroundGradientColors.value = gradientColors;
    _greeting.value = greeting;
  }
}

void _showBarChartDialog(BuildContext context, Subjectforchart subject) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Attendance Chart'),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        content: SizedBox(
          height: 400,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceEvenly,
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      toY: subject.totalClass.toDouble(),
                      color: Colors.blue,
                      width: 20,
                    ),
                  ],
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(
                      toY: subject.classAttended.toDouble(),
                      color: Colors.greenAccent,
                      width: 20,
                    ),
                  ],
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(
                      toY: subject.maxAttendance.toDouble(),
                      color: Colors.green,
                      width: 20,
                    ),
                  ],
                  showingTooltipIndicators: [0],
                ),
              ],
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      const style = TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      );
                      switch (value.toInt()) {
                        case 0:
                          return const Text('Total', style: style);
                        case 1:
                          return const Text('Attended', style: style);
                        case 2:
                          return const Text('Max', style: style);
                        default:
                          return Container();
                      }
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 5,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      const style = TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      );
                      return Text(value.toInt().toString(), style: style);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}




