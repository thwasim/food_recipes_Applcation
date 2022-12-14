import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/pages/fields.dart';
import 'package:provider/provider.dart';
import '../../signup/view/signup_page.dart';
import '../controller/logincontroller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerread = context.read<LoginCntroller>();
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/bea.jpg"), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Consumer<LoginCntroller>(builder: (context, val, child) {
          return SingleChildScrollView(
            child: Form(
              key: controllerread.formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Row(
                    children: [
                      Text("  login\n     page".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Textfields(
                            hint: 'Email',
                            validator: (value) => val.email(value),
                            icon: const Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            controller: controllerread.emailController),
                        Textfields(
                            hint: 'Password',
                            validator: (value) => val.passwords(value),
                            icon: const Icon(
                              Icons.vpn_key,
                              color: Colors.white,
                            ),
                            controller: controllerread.passwordController),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.amber,
                            child: MaterialButton(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 15, 30, 15),
                              minWidth: MediaQuery.of(context).size.width * 0.8,
                              onPressed: () {
                                if (controllerread.formKey.currentState!
                                    .validate()) {
                                  controllerread.signIn(
                                      controllerread.emailController.text,
                                      controllerread.passwordController.text,
                                      context);
                                  controllerread
                                      .showProgressWithoutMsg(context);
                                }
                              },
                              child: const Text('Login',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.17,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account?',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign up',
                              style: const TextStyle(
                                  color: Colors.blueAccent, fontSize: 20),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (ctx) => const SignUp()));
                                })
                        ]),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
