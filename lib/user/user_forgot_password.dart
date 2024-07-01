import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peaceful_pulse/constants/custom_colors.dart';

class UserForgotPassword extends StatefulWidget {
  const UserForgotPassword({super.key});

  @override
  State<UserForgotPassword> createState() => _UserForgotPasswordState();
}

class _UserForgotPasswordState extends State<UserForgotPassword> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: CustomColors.primaryColor,
            )),
        backgroundColor: CustomColors.secondaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Forgot Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              const SizedBox(
                height: 30,
              ),
              const Text(
                  "Please enter your email address to reset your password"),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintStyle:
                        const TextStyle(color: CustomColors.secondaryColor),
                    hintText: "Email Address",
                    filled: true,
                    fillColor: CustomColors.primaryColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
                style: const TextStyle(color: CustomColors.secondaryColor),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
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
                    hintStyle:
                        const TextStyle(color: CustomColors.secondaryColor),
                    hintText: "Password",
                    filled: true,
                    fillColor: CustomColors.primaryColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
                style: const TextStyle(color: CustomColors.secondaryColor),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
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
                    hintStyle:
                        const TextStyle(color: CustomColors.secondaryColor),
                    hintText: "Confirm Password",
                    filled: true,
                    fillColor: CustomColors.primaryColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
                style: const TextStyle(color: CustomColors.secondaryColor),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            foregroundColor: Colors.white,
                            backgroundColor: CustomColors.primaryColor),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Submit",
                            style: TextStyle(color: CustomColors.secondaryColor),
                          ),
                        )
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
