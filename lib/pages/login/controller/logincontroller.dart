import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_recipes/pages/bottom_nav_bar/view/bottom.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';

class LoginCntroller with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  String? email(value) {
    if (value!.isEmpty) {
      return ("Please Enter Your Email");
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return ("Please Enter a Valid Eamil");
    }
    return null;
  }

  String? passwords(value) {
    RegExp regex = RegExp(r'^.{6,}$');
    if (value!.isEmpty) {
      return ("Password is Required For Login");
    }
    if (!regex.hasMatch(value)) {
      return ("Enter Valid Password(Min. 6 Character");
    }
    return null;
  }

  void signIn(String email, String password, BuildContext context) async {
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              Fluttertoast.showToast(msg: "Login Successful"),
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => const BottomNav())),
            })
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.meassge);
    });
  }

  Future getFuture(context) {
    return Future(() async {
      await Future.delayed(const Duration(seconds: 5));
      return Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const BottomNav()));
    });
  }

  Future<void> showProgressWithoutMsg(context) async {
    showDialog(
        context: context,
        builder: (context) => FutureProgressDialog(getFuture(context)));
  }
}
