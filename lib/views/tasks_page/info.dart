import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/controllers/home_page_controller.dart';

class Info extends StatelessWidget {
  final double width;
  final String imagePath;
  final String category;

  final HomePageController homePageController = HomePageController.to;

  Info({
    Key? key,
    required this.width,
    required this.imagePath,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 25.0, 25.0, 0.0),
      child: SizedBox(
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: 70.0,
              height: 70.0,
            ),
            const SizedBox(width: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Obx(
                  () => Text(
                    homePageController.taskCount(category) == 0
                        ? "Não possui tarefas"
                        : "${homePageController.taskCount(category)} tarefas",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
