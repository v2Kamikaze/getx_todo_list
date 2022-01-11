import 'package:get/get.dart';
import 'package:to_do_list/models/task.dart';

class HomePageController extends GetxController {
  static HomePageController get to => Get.find<HomePageController>();
  final RxString _userName = "Catiorro".obs;

  final RxList<TaskCategoryObs> _taskCategories = <TaskCategoryObs>[
    TaskCategoryObs(
      name: "Para Hoje",
      assetPath: "assets/images/sun.png",
    ),
    TaskCategoryObs(
      name: "Planejadas",
      assetPath: "assets/images/calendar.png",
    ),
    TaskCategoryObs(
      name: "Pessoais",
      assetPath: "assets/images/man.png",
    ),
    TaskCategoryObs(
      name: "Trabalho",
      assetPath: "assets/images/suitcase.png",
    ),
    TaskCategoryObs(
      name: "Compras",
      assetPath: "assets/images/shopping-bag.png",
    )
  ].obs;

  String get userName => _userName.value;
  List<TaskCategoryObs> get taskCategories => _taskCategories;

  void addTask(Task task) {
    for (var taskCategory in _taskCategories) {
      if (taskCategory.name == task.type) {
        taskCategory.addTask(task);
        update();
        return;
      }
    }
  }

  int totalTasksCount() => taskCategories
      .map((e) => e.tasks.toList().length)
      .reduce((value, element) => value + element);

  int taskCount(String category) =>
      taskCategories.where((cat) => cat.name == category).elementAt(0).numTasks;

  List<Task> getTasksFromCategory(String category) =>
      taskCategories.where((cat) => cat.name == category).elementAt(0).tasks;
}
