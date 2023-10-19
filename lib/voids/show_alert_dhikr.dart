import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasbih_counter/models/dhikr.dart';

void showAlertDhikr({
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
            ? Text('Edit Dhikr'.tr())
            : Text('Save Dhikr'.tr()),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${'Dhikr Count:'.tr()} $counter',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoTextField(
              controller: controller,
              placeholder: title ?? 'Enter name'.tr(),
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
            child: Text(
              'Cancel'.tr(),
              // ignore: prefer_const_constructors
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
              Navigator.pop(context);
            },
            child: Text('Save'.tr()),
          )
        ],
      );
    },
  );
}


const Map<String, String> myLangs = {
  'en': 'English',
  'ru': 'Русский',
};

class EditLangs extends StatelessWidget {
  const EditLangs({super.key});

  @override
  Widget build(BuildContext context) {
    final supportedLocales = context.supportedLocales;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: List.generate(
          supportedLocales.length,
          (index) {
            return Column(
              children: [
                ListTile(
                  onTap: () async {
                    context.go('/');

                    await context.setLocale(supportedLocales[index]);
                  },
                  title: Text(
                    myLangs[supportedLocales[index].toString()].toString(),
                  ),
                ),
                const Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
