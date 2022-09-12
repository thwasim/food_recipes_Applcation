import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/pages/login/view/login_page.dart';
import 'package:food_recipes/pages/signup/controller/signupcontroller.dart';
import 'package:food_recipes/pages/signup/view/fields.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
 const SignUp({Key? key}) : super(key: key);
 


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/b2.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Form(
            key: context.read<SignUpController>().formkey,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Row(
                  children: [
                    Text("  SignUp\n  page".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.53,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      children: [
                        const Fields(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                           child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(50),
                            color: const Color.fromARGB(255, 106, 232, 222),
                            child: MaterialButton(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 15, 30, 15),
                              minWidth: MediaQuery.of(context).size.width * 0.8,
                              onPressed: () {
                                if (context.read<SignUpController>().formkey.currentState!.validate()) {
                                    context.read<SignUpController>().signUp(
                                      context.read<SignUpController>().emailController.text,
                                     context.read<SignUpController>().passwordController.text, context);
                                }
                              },
                              child: const Text('Sign Up',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                RichText(
                  text: TextSpan(
                      text: 'I have an account?',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Login',
                            style: const TextStyle(
                                color: Colors.blueAccent, fontSize: 20),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (ctx) =>const LoginScreen()));
                              })
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
