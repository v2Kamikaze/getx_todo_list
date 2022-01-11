import 'package:get/get_rx/src/rx_types/rx_types.dart';

class TaskCategoryObs {
  final RxString _name = ''.obs;
  final RxString _assetPath = ''.obs;
  RxList<Task> tasks = <Task>[].obs;

  TaskCategoryObs({required String name, required String assetPath}) {
    _name.value = name;
    _assetPath.value = assetPath;
  }

  String get name => _name.value;

  String get assetPath => _assetPath.value;

  void addTask(Task task) {
    tasks.add(task);
  }

  int get numTasks => tasks.length;
}

class Task {
  final RxString _name = ''.obs;
  final RxString _type = ''.obs;
  final RxBool _done = false.obs;

  Task({required String name, required String type}) {
    _name.value = name;
    _type.value = type;
  }

  String get name => _name.value;

  set name(String newVal) => _name.value = newVal;

  String get type => _type.value;

  set type(String newVal) => _type.value = newVal;

  bool get done => _done.value;
  set done(bool newVal) => _done.value = newVal;

  Task clone() => Task(name: name, type: type);
}
