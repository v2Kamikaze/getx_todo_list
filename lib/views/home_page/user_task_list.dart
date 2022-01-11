import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/controllers/home_page_controller.dart';
import 'package:to_do_list/views/tasks_page/tasks_page.dart';

class UserTaskList extends StatelessWidget {
  final double itemHeight;

  final HomePageController homePageController = HomePageController.to;

  UserTaskList({
    Key? key,
    required this.itemHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: homePageController.taskCategories.length,
        padding: const EdgeInsets.only(left: 25, right: 25.0, top: 20.0),
        itemExtent: itemHeight,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TasksPage(
                    onPressedBack: () => Navigator.of(context).pop(),
                    category: homePageController.taskCategories[index].name,
                    imagePath:
                        homePageController.taskCategories[index].assetPath,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 25.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(3.0, 3.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Image.asset(
                        homePageController.taskCategories[index].assetPath,
                        width: itemHeight * 0.4,
                        height: itemHeight * 0.4,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                homePageController.taskCategories[index].name,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                            Obx(
                              () => Text(
                                homePageController
                                        .taskCategories[index].tasks.isEmpty
                                    ? "Não possui tarefas"
                                    : "${homePageController.taskCategories[index].tasks.length} tarefas",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(fontSize: 10.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
