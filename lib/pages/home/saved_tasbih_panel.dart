import 'package:flutter/material.dart';

class SavedTasbihPanel extends StatelessWidget {
  const SavedTasbihPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Last saved dhikrs',
              style: TextStyle(
                fontFamily: 'REM-Bold',
                color: Color(0xFF232323),
                fontSize: 14,
              ),
            ),
            Container(
              width: 60,
              height: 2,
              color: const Color(0xFF4664FF),
              margin: const EdgeInsets.only(top: 4, bottom: 20),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF9F9F9),
                      ),
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: SavedTasbihRow(index),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class SavedTasbihRow extends StatelessWidget {
  final int index;
  const SavedTasbihRow(
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 45,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                '$index',
                style: const TextStyle(
                  fontFamily: 'REM-Bold',
                  color: Color(0xFF4664FF),
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 2,
          height: 30,
          color: Colors.white,
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Name of the file dhikr',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const Text(
          '18.08.2023',
          style: TextStyle(
            fontSize: 10,
            color: Color(0xFF9F9F9F),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: const Color(0xFFF9F9F9),
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: Image.asset('assets/images/row_menu.png'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
