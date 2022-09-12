import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/addrecipescontroller.dart';

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
              color: Color(0xFFFAD0C9),
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
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        context.read<AddRecipesController>().takeCamera();
                      },
                      icon: const Icon(Icons.camera, color: Colors.black),
                      label: const Text(
                        'Camera',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    TextButton.icon(
                        onPressed: () {
                          context.read<AddRecipesController>().takeGallery();
                        },
                        icon: const Icon(
                          Icons.image,
                          color: Colors.black,
                        ),
                        label: const Text(
                          'Gallery',
                          style: TextStyle(color: Colors.white),
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
