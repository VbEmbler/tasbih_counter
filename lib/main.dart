import 'package:flutter/material.dart';

void main() {
  runApp(const TasbihCounter());
}

class TasbihCounter extends StatelessWidget {
  const TasbihCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasbih Counter',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(left: 15, top: 36, right: 15),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: TogglePanel(),
              ),
              CounterPanel(),
              SizedBox(height: 14),
              SaveButton(),
              Padding(padding: EdgeInsets.only(bottom: 14.0)),
              SavedTasbihPanel(),
            ],
          ),
        ),
      ),
    );
  }
}

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
              child: const SizedBox(
                width: 54,
                height: 38,
                child: Icon(
                  Icons.menu_rounded,
                  color: Color(0xFF4664FF),
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CounterPanel extends StatelessWidget {
  const CounterPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 202,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Material(
              color: const Color(0xFF778DFF),
              child: InkWell(
                onTap: () {},
                child: const SizedBox(
                  width: 35,
                  height: 35,
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Material(
              color: const Color(0xFF4664FF),
              child: InkWell(
                onTap: () {},
                child: const SizedBox(
                  width: 154,
                  height: 154,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 42),
                        child: Text(
                          '33',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                          ),
                        ),
                      ),
                      Text(
                        'Dhikr',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Material(
              color: const Color(0xFF778DFF),
              child: InkWell(
                onTap: () {},
                child: const SizedBox(
                  width: 35,
                  height: 35,
                  child: Icon(
                    Icons.settings_backup_restore,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
                color: Color(0xFF232323),
                fontSize: 14,
                fontWeight: FontWeight.bold,
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
  const SavedTasbihRow(this.index, {super.key,});

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
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                '$index',
                style: const TextStyle(
                    color: Color(0xFF4664FF),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
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
                child: const SizedBox(
                  width: 35,
                  height: 35,
                  child: Icon(
                    Icons.more_horiz,
                    color: Color(0xFF4664FF),
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
