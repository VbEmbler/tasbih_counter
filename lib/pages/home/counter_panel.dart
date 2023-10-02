import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tasbih_counter/pages/home/save_button.dart';

class CounterPanel extends StatelessWidget {
  final int counter;
  final Function increment;
  final Function decrement;
  final Function zeroing;
  final Function mySetState;
  const CounterPanel({
    Key? key,
    required this.counter,
    required this.increment,
    required this.decrement,
    required this.zeroing,
    required this.mySetState,
  }) : super(key: key);

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
                    onTap: () => decrement(),
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
                    onTap: () => increment(),
                    child: SizedBox(
                      width: 154,
                      height: 154,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 42),
                            child: Text(
                              counter.toString(),
                              style: const TextStyle(
                                fontFamily: 'REM-Bold',
                                color: Colors.white,
                                fontSize: 48,
                              ),
                            ),
                          ),
                          Text(
                            'Dhikr'.tr(),
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
                    onTap: () => zeroing(),
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
        SaveButton(counter: counter, mySetState: mySetState,),
      ],
    );
  }
}
