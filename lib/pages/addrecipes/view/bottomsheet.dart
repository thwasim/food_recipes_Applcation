import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../profile/controller/profilecontroller.dart';

class CameraGallery {
  static showBottom(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(70)),
              color: Color.fromARGB(255, 150, 244, 226),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.16,
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const Text(
                'Choice Profile Photo',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        context.read<ProfileController>().takeCamera(context);
                      },
                      icon: const Icon(Icons.camera, color: Colors.black),
                      label: const Text(
                        'Camera',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton.icon(
                        onPressed: () {
                          context
                              .read<ProfileController>()
                              .takeGallery(context);
                        },
                        icon: const Icon(
                          Icons.image,
                          color: Colors.black,
                        ),
                        label: const Text(
                          'Gallery',
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
