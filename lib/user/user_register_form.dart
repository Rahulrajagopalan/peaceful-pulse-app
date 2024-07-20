import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peaceful_pulse/constants/custom_colors.dart';
import 'package:peaceful_pulse/controller/validation.dart';
import 'package:peaceful_pulse/user/user_home.dart';
import 'package:peaceful_pulse/user/user_login_form.dart';
import 'package:random_string/random_string.dart';

import '../services/database_methods.dart';

class UserRegisterForm extends StatefulWidget {
  const UserRegisterForm({super.key});

  @override
  State<UserRegisterForm> createState() => _UserRegisterFormState();
}

class _UserRegisterFormState extends State<UserRegisterForm> {
  bool _isChecked = false;
  bool _isObscured = true;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: CustomColors.primaryColor),
            child: const Column(
              children: [
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: Text(
                    "PEACEFUL PULSE",
                    style: TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal,
                        color: CustomColors.secondaryColor),
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: CustomColors.secondaryColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                  right: 20,
                  left: 20,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Center(
                            child: Text(
                          "REGISTRATION",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.primaryColor),
                        )),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty){
                              return "Enter a Name";
                            }
                          },
                          controller: _nameController,
                          decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                  color: CustomColors.secondaryColor),
                              hintText: "Full Name",
                              filled: true,
                              fillColor: CustomColors.primaryColor,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          style: const TextStyle(
                              color: CustomColors.secondaryColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            bool val = Controller().isValidEmail(value!);
                            if (val == false || value.isEmpty) {
                              return "Enter a valid email";
                            }
                          },
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                  color: CustomColors.secondaryColor),
                              hintText: "Email Address",
                              filled: true,
                              fillColor: CustomColors.primaryColor,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          style: const TextStyle(
                              color: CustomColors.secondaryColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if(value!.length !=10){
                              return "Enter a valid phone number";
                            }
                          },
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                  color: CustomColors.secondaryColor),
                              hintText: "Phone Number",
                              filled: true,
                              fillColor: CustomColors.primaryColor,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          style: const TextStyle(
                              color: CustomColors.secondaryColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            return Controller().isValidPass(value);
                          },
                          controller: _passwordController,
                          obscureText: _isObscured,
                          enabled: true,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                },
                                icon: _isObscured
                                    ? const Icon(CupertinoIcons.eye_slash)
                                    : const Icon(CupertinoIcons.eye),
                                color: CustomColors.secondaryColor,
                              ),
                              hintStyle: const TextStyle(
                                  color: CustomColors.secondaryColor),
                              hintText: "Password",
                              filled: true,
                              fillColor: CustomColors.primaryColor,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          style: const TextStyle(
                              color: CustomColors.secondaryColor),
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                }),
                            const Text("Already Have an account?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const UserLoginForm()));
                                },
                                child: const Text("Login"))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    //   Register Logic
                                    if (_formKey.currentState!.validate()) {
                                      log(_emailController.text);
                                      FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text)
                                          .then((credential) async {
                                        String id = credential.user!.uid;
                                        Map<String, dynamic> userInfoMap = {
                                          "Name": _nameController.text,
                                          "Email": _emailController.text,
                                          "Phone Number": _phoneController.text,
                                          "id": id
                                        };
                                        await DataBaseMethods()
                                            .addUserDetails(userInfoMap, id);
                                      }).then((value) => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const UserHome())));
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      foregroundColor: Colors.white,
                                      backgroundColor:
                                          CustomColors.primaryColor),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                          color: CustomColors.secondaryColor),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("----------------OR------------------"),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(FontAwesomeIcons.google)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(FontAwesomeIcons.facebook)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(FontAwesomeIcons.twitter))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
