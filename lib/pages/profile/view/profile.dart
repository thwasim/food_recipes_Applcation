import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/pages/addrecipes/view/bottomsheet.dart';
import 'package:food_recipes/pages/profile/controller/profilecontroller.dart';
import 'package:food_recipes/pages/profile/model/profilemodel.dart';
import 'package:food_recipes/pages/profile/view/customs.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, this.profile}) : super(key: key);
  final Profilemodel? profile;
  @override
  Widget build(BuildContext context) {
    final controllerWatch = context.watch<ProfileController>();
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 150, 244, 226),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PopupMenuButton(
                        splashRadius: 9000,
                        itemBuilder: (ctx) => [
                          FollowDetalis.buildPopupMenuItem(
                              "Settings",
                              Icons.settings,
                              context.read<ProfileController>().logout(context),
                              context),
                          FollowDetalis.buildPopupMenuItem(
                              "Logout", Icons.logout, null, context),
                          FollowDetalis.buildPopupMenuItem(
                              "Edite", Icons.edit, null, context),
                        ],
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.049,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(50)),
                            child: const Icon(
                              Icons.settings,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                  Text(
                    'My Profile'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.3,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: innerHeight * 0.6,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black,
                                          spreadRadius: 2,
                                          blurRadius: 10)
                                    ]),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: innerHeight * 0.15,
                                    ),
                                    Text(
                                      '${controllerWatch.loggedInUser.fullname}',
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(39, 105, 171, 1),
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        FollowDetalis(number: 5, post: "posts"),
                                        FollowDetalis(
                                            number: 800, post: "Followers"),
                                        FollowDetalis(
                                            number: 300, post: "Following"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                top: 60,
                                left: 160,
                                right: 0,
                                child: IconButton(
                                    onPressed: () {
                                      CameraGallery.showBottom(context);
                                    },
                                    icon: const Icon(
                                      Icons.add_a_photo,
                                      size: 29,
                                    ))),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Consumer<ProfileController>(
                                  builder: (context, value, child) {
                                    return CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: value.url == null
                                          ? const NetworkImage(
                                              "https://cdn.icon-icons.com/icons2/2645/PNG/512/person_circle_icon_159926.png")
                                          : NetworkImage(value.url.toString()),
                                      radius: 65,
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "Posts".toLowerCase(),
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        dragStartBehavior: DragStartBehavior.start,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.245,
                            child: Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50))),
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      width: MediaQuery.of(context).size.width *
                                          0.859,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              topRight: Radius.circular(50)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://img.freepik.com/premium-photo/big-hamburger-with-double-beef-french-fries_252907-8.jpg?w=2000"),
                                              fit: BoxFit.cover)),
                                    ),
                                    const Text(
                                      "Food Name",
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
