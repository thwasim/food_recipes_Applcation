import 'package:flutter/material.dart';
import 'package:food_recipes/pages/home/view/search.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key? key,
  }) : super(key: key);

  List<String> images = [
    "https://t3.ftcdn.net/jpg/02/96/25/62/360_F_296256203_EXtHvQ5WRKWTpBVUi04BD0eedxZvM9rQ.jpg",
    "https://c.ndtvimg.com/2020-12/gsb6apq_biryani_625x300_23_December_20.jpg",
    "https://media.istockphoto.com/photos/spicy-and-hot-parippu-vada-and-indian-tea-picture-id1169097707?k=20&m=1169097707&s=612x612&w=0&h=RSVYK4six1i31o6Y4Ixh6Y2JmKCWNNnMh3BOzYr1mO8=",
    "https://media.istockphoto.com/photos/indian-dish-chicken-tikka-masala-picture-id1093661558?k=20&m=1093661558&s=612x612&w=0&h=bf_i0GFuoaQZ5XxdDZAVRvxkYF5TbfAQfHcPuAg8Z4I="
  ];

  List<String> times = ["Break Fast", "Lunch", "Snacks", "Dinner"];

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
          bottom: -60,
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(0, 6, 4, 4),
                              spreadRadius: 4),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          times[index],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Widget buildChip(String label, Color color) {
    return Chip(
      labelPadding: const EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.white70,
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: const EdgeInsets.all(8.0),
    );
  }

  chipList() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: <Widget>[
        buildChip('Break Fast', const Color(0xFFff6666)),
        buildChip('Lunch', const Color(0xFF007f5c)),
        buildChip('Snacks', const Color(0xFF5f65d3)),
        buildChip('Dinner', const Color(0xFF19ca21)),
      ],
    );
  }
}
