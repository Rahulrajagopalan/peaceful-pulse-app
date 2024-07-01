import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peaceful_pulse/ambulance/ambulance_forgot_password.dart';
import 'package:peaceful_pulse/ambulance/ambulance_home.dart';

import 'constants/custom_colors.dart';

class OfficialsLoginForm extends StatefulWidget {
  const OfficialsLoginForm({super.key});

  @override
  State<OfficialsLoginForm> createState() => _OfficialsLoginFormState();
}

class _OfficialsLoginFormState extends State<OfficialsLoginForm> {
  @override
  Widget build(BuildContext context) {
    bool isObscured = true;

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
                    child: Column(
                      children: [
                        const Center(
                            child: Text(
                          "LOGIN",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.primaryColor),
                        )),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
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
                          obscureText: isObscured,
                          enabled: true,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscured = !isObscured;
                                  });
                                },
                                icon: isObscured
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AmbulanceForgotPassword()));
                                },
                                child: const Text(
                                  "Forgot Password",
                                  style: TextStyle(color: Colors.black),
                                )),
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AmbulanceHome()));
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
                                      "Login",
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
