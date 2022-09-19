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
    // GoogleSignIn googleSignIn = GoogleSignIn();
    final controller = context.read<LoginCntroller>();
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
              key: controller.formKey,
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
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.46,
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
                            controller: controller.emailController),
                        Textfields(
                            hint: 'Password',
                            validator: (value) => val.passwords(value),
                            icon: const Icon(
                              Icons.vpn_key,
                              color: Colors.white,
                            ),
                            controller: controller.passwordController),
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
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.signIn(
                                      controller.emailController.text,
                                      controller.passwordController.text,
                                      context);
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
                        const Text(
                          "Or",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            child: MaterialButton(
                                padding: const EdgeInsets.fromLTRB(20, 9, 30, 9),
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
                                      'Login With Google',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
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

// Future<bool?> signInWithGoogle() async {
//     try {
//       final googleSignInAccount = await _googleSignIn.signIn();
//       if (googleSignInAccount == null) {
//         throw SignInWithGoogleFailure();
//       }

//       final googleSignInAuth = await googleSignInAccount.authentication;

//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuth.accessToken,
//         idToken: googleSignInAuth.idToken,
//       );

//       final userCredential =
//           await _firebaseAuth.signInWithCredential(credential);

//       return userCredential.additionalUserInfo?.isNewUser;
//     } on FirebaseAuthException catch (_) {
//       throw SignInWithGoogleFailure();
//     }
//   }

//   Future<void> signOut() async {
//     try {
//       await Future.wait([
//         _firebaseAuth.signOut(),
//         _googleSignIn.signOut(),
//       ]);
//     } catch (_) {
//       throw SignOutFailure();
//     }
//   }
//    final AuthenticationRepository _authenticationRepository;

//   GoogleSignInController(this._authenticationRepository)
//       : super(GoogleSignInState.initial);

//   Future<void> signInWithGoogle() async {
//     state = GoogleSignInState.loading;

//     try {
//       final isNewUser = await _authenticationRepository.signInWithGoogle();

//       if (isNewUser != null && isNewUser) {
//         // white to database
//         // call cloud firestore repository
//       }

//       state = GoogleSignInState.success;
//     } on SignInWithGoogleFailure catch (_) {
//       state = GoogleSignInState.error;
//     }
//   }
}
