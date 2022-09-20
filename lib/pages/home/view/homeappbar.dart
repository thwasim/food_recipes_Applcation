import 'package:flutter/material.dart';
import 'package:food_recipes/pages/home/view/search.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key? key,
  }) : super(key: key);

  final List<String> textes = ["Break Fast", "Lunch", "Snacks", "Dinner"];
  final List<Icon> iconses = [
    const Icon(
      Icons.food_bank_outlined,
      color: Colors.white,
    ),
    const Icon(
      Icons.restaurant,
      color: Colors.white,
    ),
    const Icon(
      Icons.restaurant_menu_rounded,
      color: Colors.white,
    ),
    const Icon(
      Icons.table_restaurant_sharp,
      color: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: const Color.fromARGB(255, 150, 244, 226),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.32,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20, top: 10),
                    child: Text(
                      'Find Best Recipes\n  For Cooking',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  searchForJobs(context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                ],
              ),
            ),
          ]),
        ),
        Positioned(
          bottom: -72,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              primary: false,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Wrap(spacing: 10, children: [
                    GestureDetector(
                      onTap: () {},
                      child: Chip(
                        label: Text(textes[index]),
                        avatar: iconses[index],
                        backgroundColor:
                            const Color.fromARGB(255, 121, 120, 119),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                      ),
                    ),
                  ]),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
