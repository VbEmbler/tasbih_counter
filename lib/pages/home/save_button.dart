import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          child: const SizedBox(
            height: 45,
            width: double.infinity,
            child: Center(
              child: Text(
                'Save dhikr',
                style: TextStyle(
                  color: Color(0xFF4664FF),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}