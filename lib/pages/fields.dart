import 'package:flutter/material.dart';

class Textfields extends StatelessWidget {
  const Textfields({
    Key? key,
    required this.hint,
    required this.icon,
    this.validator,
    required this.controller,
  }) : super(key: key);

  final String hint;
  final Icon icon;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 19, left: 19,),
      child: SizedBox(
        height: 78,
        child: TextFormField(
          autofocus: false,
          validator: validator,
          controller: controller,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 106, 232, 222),
            filled: true,
            errorStyle: const TextStyle(color: Color.fromARGB(255, 255, 17, 0)),
            hintStyle: const TextStyle(color: Colors.black),
            prefixIcon: icon,
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
            hintText: hint,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
    );
  }
}
