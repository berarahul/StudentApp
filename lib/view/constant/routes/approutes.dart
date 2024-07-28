import 'package:get/get.dart';
import 'package:studentapp/view/Screens/RoutineCard/widgets/DropdownForRoutine.dart';
import 'package:studentapp/view/Screens/SearchStudentCard/Widgets/SearchStudent.dart';

import '../../Screens/StudentInfromationCard.dart';

class AppRoutes {

  static const String studentDetails = '/studentDetails';
  static const String routineView = '/routineView';

  static List<GetPage> routes = [

    GetPage(name: studentDetails, page: () => SearchScreen()),
    GetPage(name: routineView, page: () => DropdownScreenForRoutine()),
  ];
}
