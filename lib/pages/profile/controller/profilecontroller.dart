import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/pages/bottom_nav_bar/controller/bottom_nav_controller.dart';
import 'package:image_picker/image_picker.dart';
import '../../firebase/uploadimagefirebase.dart';
import '../../login/view/login_page.dart';
import '../../signup/model/signupmodel.dart';
import '../model/profilemodel.dart';

class ProfileController with ChangeNotifier {
  File? file;
  UploadTask? task;
  String? url;
  File? imagefile;

  ProfileController() {
    usergetfunction();
    usergetimagefunction();
  }

//-------------data get by firebase-----------//

  User? user = FirebaseAuth.instance.currentUser;
  Usermodel loggedInUser = Usermodel();

  usergetfunction() {
    FirebaseFirestore.instance
        .collection(user!.email.toString())
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = Usermodel.fromMap(value.data());
      log(loggedInUser.fullname.toString());
      notifyListeners();
    });
  }

//----------------- upload file to the firbase--------------//

  Future uploadfile() async {
    log("message");
    if (file == null) {
      return;
    }
    final destination = "${FirebaseAuth.instance.currentUser!.email}";

    task = Firebaseapi.uploadfile(destination.toString(), file!);

    notifyListeners();

    if (task == null) return;
    final snapshot = await task!.whenComplete((() {}));
    final urlDownload = await snapshot.ref.getDownloadURL();
    url = urlDownload;
    notifyListeners();
    updateimage();
  }

//--------------take profile image in gallery--------------//

  takeGallery(context) async {
    notifyListeners();
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    file = File(image.path);

    notifyListeners();
    await uploadfile();
    Navigator.of(context).pop();
  }

//----------take profile image from camera-------------//
  takeCamera(context) async {
    notifyListeners();
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTempray = File(image.path);
    file = imageTempray;
    notifyListeners();
    await uploadfile();
    Navigator.of(context).pop();
  }

//-----------------                 ----------------------//
  updateimage() async {
    final doc = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email!)
        .doc(FirebaseAuth.instance.currentUser!.uid);
    await doc.update({"image": url.toString()});
    notifyListeners();
  }

// ----------logout function in firebase---------------------//

  Future<bool> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }


//----------------image get by profilemodel class------------//

  User? users = FirebaseAuth.instance.currentUser;
  Profilemodel profileuser = Profilemodel();

  Future usergetimagefunction() async {
    await FirebaseFirestore.instance
        .collection(user!.email.toString())
        .doc(user!.uid)
        .get()
        .then((value) {
      profileuser = Profilemodel.fromMap(value.data());
      url = profileuser.image;
      notifyListeners();
    });
  }
}
