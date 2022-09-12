import 'package:flutter/material.dart';
import 'package:food_recipes/pages/home/view/iconbox.dart';

 searchForJobs(context) {
  return  Container(
    width: MediaQuery.of(context).size.width*1,
    height: 65,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        IconButton(
          padding: const EdgeInsets.only(left: 20, right: 20),
          color: Colors.black,
          iconSize: 28,
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        Expanded(
          child: SizedBox(
            child: TextFormField(
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Search Recipes',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 17),
                  border: InputBorder.none),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 10),
          child: IconBox(width: 55, height: 50, icon: Icons.line_style_rounded),
        ),
      ],
    ),
  );
}
