import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasbih_counter/pages/home/save_button.dart';
import 'package:tasbih_counter/providers/counter_provider.dart';
import 'package:tasbih_counter/providers/toggle_panel_provider.dart';

class CounterPanel extends StatelessWidget {
  const CounterPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.read<CounterProvider>();
    return Visibility(
      visible: context.watch<TogglePanelProvider>().isActivity,
      child: Column(
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
                      onTap: () => counterProvider.decrement(),
                      child: SizedBox(
                        width: 35,
                        height: 35,
                        child: Image.asset('assets/images/decrement.png'),
                      ),
                    ),
                  ),
                ),
                const TasbihCounterNumber(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Material(
                    color: const Color(0xFF778DFF),
                    child: InkWell(
                      onTap: () => counterProvider.zeroing(),
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
      ),
    );
  }
}

class TasbihCounterNumber extends StatelessWidget {
  const TasbihCounterNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: const Color(0xFF4664FF),
        child: InkWell(
          onTap: () => counterProvider.increment(),
          child: SizedBox(
            width: 154,
            height: 154,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 42),
                  child: Text(
                    counterProvider.tasbihCount.toString(),
                    style: const TextStyle(
                      fontFamily: 'REM-Bold',
                      color: Colors.white,
                      fontSize: 48,
                    ),
                  ),
                ),
                Text(
                  'Dhikr'.tr(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
