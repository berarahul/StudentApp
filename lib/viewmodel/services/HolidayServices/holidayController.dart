import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../HolidayServices/HolidayChecker.dart';

class HolidayController extends GetxController {
  RxList<Map<String, String>> holidays = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchingAllHolidays();
  }

  Future<void> fetchingAllHolidays() async {
    try {
      final holidaysList =
          await HolidayChecker.fetchingAllHolidays(); // Fetch all holidays
      holidays.value = holidaysList.map((holiday) {
        return {
          'reason': holiday['reason']!,
          'startDate': holiday['startDate']!,
          'endDate': holiday['endDate']!,
        };
      }).toList();
    } catch (e) {
      print('Failed to fetch holidays: $e');
      holidays.value = [];
    }
  }
}
