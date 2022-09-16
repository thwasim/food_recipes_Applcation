import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/bottom_nav_controller.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerwatch = context.watch<BottomNavController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          controllerwatch.page[controllerwatch.currentIndex],
          Positioned(
              bottom: 40, left: 40, right: 40, child: buildBottom(context))
        ],
      ),
    );
  }

  Material buildBottom(BuildContext context) {
    final controller = context.read<BottomNavController>();
    final controllerwatch = context.watch<BottomNavController>();
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: Colors.black,
      child: SizedBox(
        child: SizedBox(
          height: 70,
          width: double.infinity,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controllerwatch.data.length,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    controller.selectecdIndexUpdate(index);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: MediaQuery.of(context).size.height * 0.057,
                    decoration: BoxDecoration(
                      border: index == controllerwatch.selectedIndex
                          ? Border(
                              top: BorderSide(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                  color: Colors.white))
                          : null,
                      gradient: index == controllerwatch.selectedIndex
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
                      controllerwatch.data[index],
                      size: 35,
                      color: index == controllerwatch.selectedIndex
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
