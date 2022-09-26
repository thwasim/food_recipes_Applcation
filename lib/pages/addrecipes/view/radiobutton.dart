import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String? food;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Padding(
              padding: const EdgeInsets.only(left: 14, top: 14),
              child: Row(
                children: const [
                  Text(
                    "Selete Food Type",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
        RadioListTile(
          activeColor:const Color.fromARGB(255, 150, 244, 226),
          title: const Text("Break Fast"),
          value: "Break Fast",
          groupValue: food,
          onChanged: (value) {
            setState(() {
              food = value.toString();
            });
          },
        ),
        RadioListTile(
          activeColor:const Color.fromARGB(255, 150, 244, 226),
          title: const Text("Lunch"),
          value: "Lunch",
          groupValue: food,
          onChanged: (value) {
            setState(() {
              food = value.toString();
            });
          },
        ),
        RadioListTile(
          activeColor:const Color.fromARGB(255, 150, 244, 226),
          title: const Text("Snacks"),
          value: "Snacks",
          groupValue: food,
          onChanged: (value) {
            setState(() {
              food = value.toString();
            });
          },
        ),
        RadioListTile(
          activeColor:const Color.fromARGB(255, 150, 244, 226),
          title: const Text("Dinner"),
          value: "Dinner",
          groupValue: food,
          onChanged: (value) {
            setState(() {
              food = value.toString();
            });
          },
        )
      ],
    );
  }
}



