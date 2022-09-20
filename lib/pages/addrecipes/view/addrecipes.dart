import 'package:flutter/material.dart';
import 'package:food_recipes/pages/addrecipes/view/radiobutton.dart';
import 'package:food_recipes/pages/addrecipes/view/timer.dart';

class AddRecipesScreen extends StatelessWidget {
  AddRecipesScreen({Key? key}) : super(key: key);

  final List<String> ingredients = [
    "salt",
    "Sugar",
    "onian",
    "tomato",
    "pototo",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.37,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100)),
                  color: Colors.red,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?cs=srgb&dl=pexels-ella-olsson-1640777.jpg&fm=jpg'),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 130, right: 130),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 150, 244, 226),
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "Add Image",
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(
                        Icons.add,
                        size: 23,
                        color: Colors.black,
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, top: 14),
              child: Row(
                children: const [
                  Text(
                    "Add Ingredients",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 210, left: 11),
              child: Divider(
                thickness: 2,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Add Ingredients",
                            hintStyle: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 150, 244, 226),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "ADD",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ),
            Wrap(
                spacing: 4,
                children: ingredients
                    .map((e) => Chip(
                          deleteIcon: const Icon(Icons.cancel),
                          label: Text(e),
                          onDeleted: () {},
                          backgroundColor:
                              const Color.fromARGB(255, 150, 244, 226),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                        ))
                    .toList()),
            Padding(
              padding: const EdgeInsets.only(left: 14, top: 14),
              child: Row(
                children: const [
                  Text(
                    "How To Make",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 240, left: 11),
              child: Divider(
                thickness: 2,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 200,
                decoration: InputDecoration(
                  hintText: "How To Make",
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  fillColor: const Color(0xffffffff),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
             const TimerPickerExample(),
             const RadioButton(),
             Container(
              color: Colors.red,
              child:Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text("   Submit   "),
              ),
             ),
            const SizedBox(
              height: 150,
            ),
          ],
        ),
      )),
    );
  }
}
