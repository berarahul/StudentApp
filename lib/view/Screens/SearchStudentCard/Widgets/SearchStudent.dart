import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get_storage/get_storage.dart';
import 'package:studentapp/view/constant/routes/AppColors.dart';
import '../../../../model/subjectModel.dart';
import '../../../../viewmodel/services/studentscreenService/studentScreenSearchController.dart';
import '../../RoutineCard/widgets/DropdownForRoutine.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final StudentSearchController _searchController =
      Get.put(StudentSearchController());
  final _storage = GetStorage();
  late Rx<List<Color>> _backgroundGradientColors = Rx<List<Color>>([]);
  late Rx<String> _greeting = Rx<String>('');

  @override
  Widget build(BuildContext context) {
    _setBackgroundGradientAndGreeting();

    Timer.periodic(const Duration(minutes: 1), (timer) {
      _setBackgroundGradientAndGreeting();
    });

    String? storedStudentId = _searchController.getStoredStudentId();
    if (storedStudentId != null) {
      _controller.text = storedStudentId;
    }

    return Scaffold(
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
              const SizedBox(height: 50),
              const Text(
                "Welcome Student",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _controller,
                  onChanged: (value) {
                    _storage.write('studentId', value);
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Your Student Id",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _searchController.search(_controller.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  child: Text('Search',
                      style:
                          TextStyle(fontSize: 16, color: AppColors.textwhite)),
                ),
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
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                color:
                                    _backgroundGradientColors.value.isNotEmpty
                                        ? _backgroundGradientColors.value[0]
                                            .withOpacity(0.8)
                                        : Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name: ${_searchController.student.value!.name}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Semester: ${_searchController.student.value!.sem}',
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Class Roll: ${_searchController.student.value!.classRoll}',
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Department Name: ${_searchController.student.value!.departmentName}',
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'ID: ${_searchController.student.value!.id}',
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      const SizedBox(height: 16),
                                      DropdownButton<String>(
                                        value: _searchController
                                                .selectedSubject.value ??
                                            '',
                                        onChanged: (newValue) {
                                          _searchController.selectedSubject
                                              .value = newValue!;
                                          _searchController
                                              .fetchSubjectDetails(newValue);
                                        },
                                        isExpanded: true,
                                        items: [
                                          const DropdownMenuItem(
                                            value: '',
                                            child: Text(
                                              'Select a Subject',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          ..._searchController
                                              .student.value!.subjects
                                              .map((subject) {
                                            return DropdownMenuItem(
                                              value:
                                                  subject.subjectId.toString(),
                                              child: Text(
                                                style: TextStyle(
                                                    color: Colors.white),
                                                subject.subjectName,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            );
                                          }).toList(),
                                        ],
                                        dropdownColor: Colors.black,
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
                                if (subject == null ||
                                    subject.subName == null) {
                                  return Container();
                                }

                                return Center(
                                  child: GestureDetector(
                                    onTap: () =>
                                        _showBarChartDialog(context, subject),
                                    child: Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      color: _backgroundGradientColors
                                              .value.isNotEmpty
                                          ? _backgroundGradientColors.value[0]
                                              .withOpacity(0.8)
                                          : Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Subject Name: ${subject.subName}',
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              'Classes Attended: ${subject.classAttended}',
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              'Total Classes: ${subject.totalClass}',
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              'Max Attendance: ${subject.maxAttendance}',
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 16),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
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
      gradientColors = [AppColors.softRed, AppColors.peach];
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
        title: const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Text('Attendance Chart'),
        ),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
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
                          return Container();
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          if (value % 5 == 0) {
                            return Text('${value.toInt()}');
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 8),
                    const Text('Total Classes'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.greenAccent,
                    ),
                    const SizedBox(width: 8),
                    const Text('Total Classes Attended'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 8),
                    const Text('Max Attendance'),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}
