import 'package:flutter/material.dart';

class CardInside extends StatelessWidget {
  const CardInside({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Food Name",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 90, left: 90),
          child: Divider(
            thickness: 3,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.alarm_add,
                color: Colors.black,
                size: 20,
              ),
              label: const Text(
                'Time',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark_border_outlined,
                color: Colors.black,
                size: 20,
              ),
              label: const Text(
                'Save',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.health_and_safety_outlined,
                color: Colors.black,
                size: 20,
              ),
              label: const Text(
                'Healthy',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}
