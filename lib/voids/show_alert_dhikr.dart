import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasbih_counter/models/dhikr.dart';

void showAlertDhikr({
  required mySetState,
  required int counter,
  required BuildContext context,
  required bool isEdit,
  int? index,
  String? title,
}) {
  final TextEditingController controller = TextEditingController();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: isEdit
            ? const Text('Редактировать Зикр')
            : const Text('Сохранить Зикр'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Количество Зикров: $counter',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoTextField(
              controller: controller,
              placeholder: title ?? 'Введите название',
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
        insetPadding: const EdgeInsets.all(2),
        actions: [
          Visibility(
            visible: isEdit,
            child: IconButton(
              onPressed: () {
                if (index != null) fakeDB.removeAt(index);
                mySetState();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Отменить',
              style: TextStyle(color: Colors.black),
            ),
          ),
          FilledButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xFF4664FF),
              ),
            ),
            onPressed: () {
              if (!isEdit) {
                fakeDB.add(
                  Dhikr(
                    counter: counter,
                    title: controller.text,
                    date: DateTime.now(),
                  ),
                );
              } else {
                if (index != null) {
                  fakeDB[index] = Dhikr(
                    counter: counter,
                    title: controller.text,
                    date: DateTime.now(),
                  );
                }
              }
              mySetState();
              Navigator.pop(context);
            },
            child: const Text('Сохранить'),
          )
        ],
      );
    },
  );
}
