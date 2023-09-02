import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAlertDhikr({
  required BuildContext context,
  required bool isEdit,
  String? title,
}) {
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
            const Text(
              'Количество Зикров: 3',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoTextField(
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
            onPressed: () {},
            child: const Text('Сохранить'),
          )
        ],
      );
    },
  );
}
