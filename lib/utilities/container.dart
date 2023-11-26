import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContainerSingled extends StatelessWidget {
  const ContainerSingled({
    super.key,
    required this.checkedCondition,
    required this.todotitle,
    required this.onChanged,
    required this.onDelete,
  });

  final String todotitle;
  final bool checkedCondition;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 245, 222, 14),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Checkbox(
                  value: checkedCondition,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Text(
                  todotitle,
                  style: TextStyle(
                      decoration: checkedCondition
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
