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
    final controller = context.read<SignUpController>();
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/b2.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.formkey,
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
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.66,
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
                              padding:const EdgeInsets.fromLTRB(30, 15, 30, 15),
                              minWidth: MediaQuery.of(context).size.width * 0.8,
                              onPressed: () {
                                if (controller.formkey.currentState!
                                    .validate()) {
                                  controller.signUp(
                                      controller.emailController.text,
                                      controller.passwordController.text,
                                      context);
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
                       const Text("Or",style: TextStyle(fontSize:17,fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(50),
                            color: const Color.fromARGB(255, 106, 232, 222),
                            child: MaterialButton(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 9, 30, 9),
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.8,
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: Image.network(
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2048px-Google_%22G%22_Logo.svg.png'),
                                    ),
                                    const Text(
                                      'Sign Up With Google',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
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
                                        builder: (ctx) => const LoginScreen()));
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
