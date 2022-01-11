import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/controllers/home_page_controller.dart';
import 'package:to_do_list/views/home_page/background.dart';
import 'package:to_do_list/views/tasks_page/info.dart';
import 'package:to_do_list/views/tasks_page/menu_back_button.dart';
import 'package:to_do_list/views/tasks_page/task_list_item.dart';

class TasksPage extends StatelessWidget {
  final VoidCallback onPressedBack;
  final String imagePath;
  final String category;

  final HomePageController homePageController = HomePageController.to;

  TasksPage({
    Key? key,
    required this.onPressedBack,
    required this.imagePath,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              children: [
                Background(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.20,
                  heightRatio: 0.6,
                ),
                SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: Column(
                    children: [
                      MenuBackButton(
                        width: constraints.maxWidth,
                        onPressed: onPressedBack,
                      ),
                      Info(
                        width: constraints.maxWidth,
                        imagePath: imagePath,
                        category: category,
                      ),
                      Expanded(
                        child: Obx(
                          () => ListView.builder(
                            itemExtent: 50.0,
                            physics: const BouncingScrollPhysics(),
                            itemCount: homePageController.taskCount(category),
                            itemBuilder: (BuildContext context, int index) {
                              return TaskListItem(
                                task: homePageController
                                    .getTasksFromCategory(category)[index],
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
