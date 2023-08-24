import 'package:flutter/material.dart';
import 'package:tasbih_counter/pages/home/save_button.dart';
int tasbihCount = 0;

class CounterPanel extends StatefulWidget {
  const CounterPanel({Key? key}) : super(key: key);

  @override
  State<CounterPanel> createState() => _CounterPanelState();
}

class _CounterPanelState extends State<CounterPanel> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                    onTap: () {
                        if(tasbihCount > 0) {
                          setState(() {
                            tasbihCount--;
                          });
                        }
                    },
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.asset('assets/images/decrement.png'),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Material(
                  color: const Color(0xFF4664FF),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        tasbihCount++;
                      });
                    },
                    child: SizedBox(
                      width: 154,
                      height: 154,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 42),
                            child: Text(
                              tasbihCount.toString(),
                              style: const TextStyle(
                                fontFamily: 'REM-Bold',
                                color: Colors.white,
                                fontSize: 48,
                              ),
                            ),
                          ),
                          const Text(
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
                    onTap: () {
                        if(tasbihCount > 0) {
                          setState(() {
                            tasbihCount = 0;
                          });
                        }
                    },
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.asset('assets/images/rollback.png'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 14),
        const SaveButton(),
      ],
    );
  }
}