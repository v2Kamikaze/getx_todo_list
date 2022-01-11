import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/models/task.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  const TaskListItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Obx(
              () => Checkbox(
                value: task.done,
                onChanged: (v) => task.done = v!,
                side: BorderSide(
                  width: 2.0,
                  color: Theme.of(context).primaryColorDark,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                activeColor:
                    Theme.of(context).primaryColorDark.withOpacity(0.2),
              ),
            ),
            Obx(
              () => Text(
                task.name,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      decoration: task.done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
