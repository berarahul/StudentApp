import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../model/SemesterModel.dart';

class SemesterController extends GetxController {
  var semesterList = <SemesterModel>[].obs;
  var selectedSemesterId = 0.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchSemesters();
    selectedSemesterId.value = storage.read('selectedSemesterId') ?? 0;
  }

  void fetchSemesters() {
    List<SemesterModel> semesters = [
      SemesterModel(id: 1, semesterName: 'Semester 1'),
      SemesterModel(id: 2, semesterName: 'Semester 2'),
      SemesterModel(id: 3, semesterName: 'Semester 3'),
      SemesterModel(id: 4, semesterName: 'Semester 4'),
      SemesterModel(id: 5, semesterName: 'Semester 5'),
      SemesterModel(id: 6, semesterName: 'Semester 6'),
    ];
    semesterList.value = semesters;
  }

  void selectSemester(int id) {
    selectedSemesterId.value = id;
    storage.write('selectedSemesterId', id);
    print('Selected Semester ID: $id has been stored.');
  }
  void clearSemester() {
    semesterList.clear();
  }
}
