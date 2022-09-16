import 'package:flutter/material.dart';

class FollowDetalis extends StatelessWidget {
  const FollowDetalis({Key? key, required this.number, required this.post})
      : super(key: key);

  final String post;
  final int number;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Text(
          post,
          style: const TextStyle(
              color: Color.fromARGB(255, 53, 51, 51),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        Text(
          number.toString(),
          style: const TextStyle(
            color: Color.fromRGBO(39, 105, 171, 1),
            fontSize: 25,
          ),
        ),
      ],
    );
  }

static PopupMenuItem buildPopupMenuItem(String  title, IconData iconData,Function? ontap,  BuildContext context) {
    return PopupMenuItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: (() {ontap;}),),
          Icon(
            iconData,
            color: Colors.black,
          ),
          Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}




