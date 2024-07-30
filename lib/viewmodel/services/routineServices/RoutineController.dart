// controllers/schedule_controller.dart

import 'package:get/get.dart';
import '../../../data/apiCall.dart';
import '../../../model/ClassRoutineModel.dart';

class ScheduleController extends GetxController {
  var schedule = <String, List<Schedule>>{}.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchAndSetSchedule();
    super.onInit();
  }

  Future<void> fetchAndSetSchedule() async {
    try {
      isLoading(true);
      schedule.value = await fetchSchedule();
    } finally {
      isLoading(false);
    }
  }
}
