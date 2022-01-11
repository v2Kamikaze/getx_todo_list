import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/controllers/home_page_controller.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/views/add_task_page/custom_text_field.dart';
import 'package:to_do_list/views/home_page/background.dart';

class AddTaskPage extends StatelessWidget {
  AddTaskPage({Key? key}) : super(key: key);

  final HomePageController homePageController = HomePageController.to;
  final TextEditingController inputController = TextEditingController();

  final Task _task = Task(name: "", type: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              children: [
                Background(
                  height: constraints.maxHeight * 0.2,
                  width: constraints.maxWidth,
                ),
                SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.keyboard_backspace,
                                  size: 30.0,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Nova Tarefa",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.15,
                        ),
                        SizedBox(
                          width: constraints.maxWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Obx(
                                  () {
                                    return DropdownButton<String>(
                                      isExpanded: true,
                                      alignment: Alignment.center,
                                      focusColor: Colors.red,
                                      icon: Row(
                                        children: [
                                          Obx(
                                            () => _task.type.isEmpty
                                                ? Text(
                                                    "Tipo",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline2!,
                                                  )
                                                : Text(
                                                    _task.type,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline2!
                                                        .copyWith(
                                                            fontSize: 12.0),
                                                  ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Theme.of(context)
                                                .primaryColorDark,
                                            size: 10.0,
                                          ),
                                        ],
                                      ),
                                      items: _dropDownButtonList(context),
                                      onChanged: (v) => {_task.type = v!},
                                      borderRadius: BorderRadius.circular(10.0),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: CustomTextField(
                                  inputController: inputController,
                                  label: 'Nome da tarefa',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: constraints.maxWidth,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: ElevatedButton(
                              onPressed: () => _addNewTask(context),
                              child: Text(
                                "Adicionar Tarefa",
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/images/to-do-list.png",
                          width: 150,
                          height: 150.0,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void _addNewTask(BuildContext context) {
    if (inputController.value.text.isEmpty || _task.type.isEmpty) {
      _showSnackBar(context, "Os campos de nome e tipo devem ser preenchidos.");
      return;
    }
    _task.name = inputController.value.text;
    homePageController.addTask(_task.clone());
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    _showSnackBar(context, "Tarefa adicionada!");
  }

  void _showSnackBar(BuildContext context, String label) {
    final SnackBar snackBar = SnackBar(
      content: Text(
        label,
        style: Theme.of(context).textTheme.headline2,
      ),
      duration: const Duration(seconds: 4),
      backgroundColor: Theme.of(context).primaryColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  List<DropdownMenuItem<String>> _dropDownButtonList(context) =>
      homePageController.taskCategories.map((taskCat) {
        return DropdownMenuItem<String>(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                taskCat.assetPath,
                width: 15.0,
                height: 15.0,
              ),
              Text(
                taskCat.name,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 12.0),
              ),
            ],
          ),
          value: taskCat.name,
        );
      }).toList();
}
