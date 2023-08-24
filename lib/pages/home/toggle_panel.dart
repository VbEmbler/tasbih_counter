import 'package:flutter/material.dart';

class TogglePanel extends StatelessWidget {
  const TogglePanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            height: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFF4664FF),
                    ),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(4),
                    child: const Text(
                      'Activity',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(4),
                    child: const Text(
                      'Saved',
                      style: TextStyle(
                        color: Color(0xFF9E9E9E),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                width: 54,
                height: 38,
                child: Image.asset(
                  'assets/images/menu.png',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}