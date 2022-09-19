import 'package:flutter/material.dart';
import 'package:food_recipes/pages/fields.dart';
import 'package:food_recipes/pages/signup/controller/signupcontroller.dart';
import 'package:provider/provider.dart';

class Fields extends StatelessWidget {
 const  Fields({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SignUpController>();
    return Consumer<SignUpController>(
      builder: (context, val, child) {
        return Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Textfields(
              hint: 'Full Name',
              validator: (value) => val.username(value),
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              controller: controller.nameController),
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
              validator: (value) => val.password(value),
              icon: const Icon(
                Icons.vpn_key,
                color: Colors.white,
              ),
              controller: controller.passwordController),
          Textfields(
              hint: 'Conform Password',
              validator: (value) => val.confirmpasswords(value),
              icon: const Icon(
                Icons.lock,
                color: Colors.white,
              ),
              controller: controller.confrompasswordController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        ]);
      },
    );
  }
}
