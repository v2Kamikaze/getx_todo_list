import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/controllers/home_page_controller.dart';
import 'package:to_do_list/views/add_task_page/add_task_page.dart';

import 'background.dart';
import 'hello_user.dart';
import 'user_task_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 35.0,
        ),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskPage(),
            ),
          ),
        },
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              children: [
                Background(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.5,
                ),
                SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HelloUser(
                        height: constraints.maxHeight * 0.15,
                        width: constraints.maxWidth,
                        todaysTaskNumber: homePageController.totalTasksCount(),
                        userName: homePageController.userName,
                      ),
                      UserTaskList(
                        itemHeight: constraints.maxHeight * 0.20,
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
