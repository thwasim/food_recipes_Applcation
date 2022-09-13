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
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: const [
                          BoxShadow(color: Colors.transparent, spreadRadius: 4),
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
}
