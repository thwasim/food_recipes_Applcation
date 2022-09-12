import 'package:flutter/material.dart';
import 'package:food_recipes/pages/favourite/view/favourite.dart';
import 'package:food_recipes/pages/home/view/homescreen.dart';
import 'package:food_recipes/pages/profile/view/profile.dart';
import '../../addrecipes/view/addrecipes.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  int currentIndex = 0;

  List<IconData> data = [
    Icons.home_outlined,
    Icons.add_box_outlined,
    Icons.bookmark_border,
    Icons.person_outline_sharp,
  ];
  List<Widget> page = [
    const HomeScreen(),
    const AddRecipesScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          page[currentIndex],
          Positioned(bottom: 50,left: 40,right: 40,child: _buildBottom(context))
        ],
      ),
    );
  }

  Material _buildBottom(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: Colors.black,
      child: SizedBox(
        child: SizedBox(
          height: 70,
          width: double.infinity,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      currentIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    width: MediaQuery.of(context).size.height * 0.057,
                    decoration: BoxDecoration(
                      border: index == selectedIndex
                          ? Border(
                              top: BorderSide(
                                  width: MediaQuery.of(context).size.width *
                                      0.01,
                                  color: Colors.white))
                          : null,
                      gradient: index == selectedIndex
                          ? const LinearGradient(
                              colors: [
                                  Color.fromARGB(255, 20, 163, 134),
                                  Colors.black
                                ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          : null,
                    ),
                    child: Icon(
                      data[index],
                      size: 35,
                      color: index == selectedIndex
                          ? Colors.white
                          : Colors.grey.shade800,
                    ),
                  ),
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
