import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerPickerExample extends StatefulWidget {
  const TimerPickerExample({super.key});

  @override
  State<TimerPickerExample> createState() => _TimerPickerExampleState();
}

class _TimerPickerExampleState extends State<TimerPickerExample> {
  Duration duration = const Duration();

  void showDialog(Widget bottom) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: bottom,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14, top: 14),
          child: Row(
            children: const [
              Text(
                "Cooking Time",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 230, left: 11),
          child: Divider(
            thickness: 2,
            color: Colors.black,
          ),
        ),
        InkWell(
          onTap: () => showDialog(
            CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hm,
              initialTimerDuration: duration,
              onTimerDurationChanged: (Duration newDuration) {
                setState(() => duration = newDuration);
              },
            ),
          ),
          child: Container(
            width: 300,
            height: 60,
            color: const Color.fromARGB(255, 150, 244, 226),
            child: Center(
              child: Text(
                '${duration.inHours} Hour ${duration.inMinutes % 60} Minutes',
                style: const TextStyle(
                    fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
