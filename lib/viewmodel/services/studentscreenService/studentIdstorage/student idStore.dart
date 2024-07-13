import 'package:get_storage/get_storage.dart';

class StudentIdStorage {
  final GetStorage _storage = GetStorage();

  // Method to write student ID to storage
  void writeStudentId(String studentId) {
    _storage.write('studentId', studentId);
  }

  // Method to read stored student ID from storage
  String? readStudentId() {
    return _storage.read('studentId');
  }
}
