import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_recipes/pages/bottom_nav_bar/view/bottom.dart';
import 'package:food_recipes/pages/profile/model/profilemodel.dart';
import 'package:food_recipes/pages/signup/model/signupmodel.dart';

class SignUpController with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confrompasswordController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  String? errorMessage;

  String? username(value) {
    RegExp regex = RegExp(r'^.{3,}$');
    if (value!.isEmpty) {
      return ("Enter The User Name");
    }
    if (!regex.hasMatch(value)) {
      return ("Enter Valid name(Min. 3 Character)");
    }
    return null;
  }

  String? email(value) {
    if (value!.isEmpty) {
      return ("Please Enter Your Email");
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return ("Please Enter a valid email");
    }
    return null;
  }

  String? password(value) {
    RegExp regex = RegExp(r'^.{6,}$');

    if (value!.isEmpty) {
      return ("Type Your Password");
    }
    if (!regex.hasMatch(value)) {
      return ("Enter Valid Password(Min. 6 Character)");
    }
    return null;
  }

  String? confirmpasswords(value) {
    if (value!.isEmpty) {
      return 'Type Your Password';
    }
    if (confrompasswordController.text.trim() !=
        passwordController.text.trim()) {
      return ("Password don't match");
    }
    return null;
  }

  void signUp(String email, String password, context) async {
    if (formkey.currentState!.validate()) {
      try {
        await auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore(context)})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException {
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }

  postDetailsToFirestore(context) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    Usermodel userModel = Usermodel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fullname = nameController.text;
    userModel.password = passwordController.text;
  

    await firebaseFirestore
        .collection(user.email.toString())
        .doc(user.uid.toString())
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const BottomNav()));
  }
}
