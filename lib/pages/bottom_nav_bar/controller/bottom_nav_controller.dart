
import 'package:flutter/material.dart';
import 'package:food_recipes/pages/addrecipes/view/addrecipes.dart';
import 'package:food_recipes/pages/favourite/view/favourite.dart';
import 'package:food_recipes/pages/home/view/homescreen.dart';
import 'package:food_recipes/pages/profile/view/profile.dart';

class BottomNavController with ChangeNotifier {

     int selectedIndex = 0;
  int currentIndex = 0;

  List<IconData> data = [
    Icons.home_outlined,
    Icons.add_box_outlined,
    Icons.favorite_outline_sharp,
    Icons.person_outline_sharp,
  ];
  List<Widget> page = [
    const HomeScreen(),
    const AddRecipesScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];

   selectecdIndexUpdate () {
    //  selectedIndex = i;
   }
}