import 'package:flutter/material.dart';
import 'package:todo_app/utilities/button.dart';

class DailogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  const DailogBox({super.key, required this.onSave, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add new task",
              ),
              //controller: textController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonName(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: "Cancel"),
                const SizedBox(
                  width: 8,
                ),
                ButtonName(onPressed: onSave, text: "Save"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
