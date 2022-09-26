import 'package:flutter/material.dart';

class FollowDetalis extends StatelessWidget {
  const FollowDetalis({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column();
  }

  static PopupMenuItem buildPopupMenuItem(
      String title, IconData iconData, Function? ontap, BuildContext context) {
    return PopupMenuItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (() {
              ontap;
            }),
          ),
          Icon(
            iconData,
            color: Colors.black,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
  static  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("!!!!!!!!!!"),
          content: const Text("xxxxxxxxxxx"),
          actions: [
            MaterialButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  

  void popupMenus(BuildContext context) {
    InkWell(
      onTap: () {
        PopupMenuButton<int>(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Row(
                children: const [
                  Icon(Icons.star),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Get The App")
                ],
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: Row(
                children: const [
                  Icon(Icons.chrome_reader_mode),
                  SizedBox(
                    width: 10,
                  ),
                  Text("About")
                ],
              ),
            ),
          ],
          offset: const Offset(0, 100),
          color: Colors.grey,
          elevation: 2,
          onSelected: (value) {
            if (value == 1) {
              _showDialog(context);
            } else if (value == 2) {
              _showDialog(context);
            }
          },
        );
      },
      child: const CircleAvatar(
        radius: 24,
        child: Icon(Icons.settings),
      ),
    );
  }
}
