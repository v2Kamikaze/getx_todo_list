import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/controllers/home_page_controller.dart';

class HelloUser extends StatelessWidget {
  final double height;
  final double width;
  final double imageSize;
  final String userName;
  final int todaysTaskNumber;

  HelloUser({
    Key? key,
    required this.height,
    required this.width,
    required this.userName,
    required this.todaysTaskNumber,
    this.imageSize = 60.0,
  }) : super(key: key);

  final HomePageController homePageController = HomePageController.to;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
      child: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Olá $userName",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Obx(
                  () => Text(
                    homePageController.totalTasksCount() != 0
                        ? "Hoje você possui ${homePageController.totalTasksCount()} tarefa(s)."
                        : "Você não possui tarefas para fazer.",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ],
            ),
            Image.asset(
              "assets/images/woman.png",
              height: imageSize,
              width: imageSize,
            ),
          ],
        ),
      ),
    );
  }
}
