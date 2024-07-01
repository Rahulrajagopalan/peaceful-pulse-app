import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peaceful_pulse/constants/custom_colors.dart';
import 'package:peaceful_pulse/officials_login_form.dart';
import 'package:peaceful_pulse/user/user_register_form.dart';

class UserSelect extends StatefulWidget {
  const UserSelect(
      {super.key});

  @override
  State<UserSelect> createState() => _UserSelectState();
}

class _UserSelectState extends State<UserSelect> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserRegisterForm()));
                  },
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(5)),
                      foregroundColor: Colors.white,
                      backgroundColor:
                      CustomColors.primaryColor),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                    child: Text(
                      "User",
                      style: TextStyle(
                          color: CustomColors.secondaryColor),
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const OfficialsLoginForm()));
                  },
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(5)),
                      foregroundColor: Colors.white,
                      backgroundColor:
                      CustomColors.primaryColor),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                    child: Text(
                      "Officials",
                      style: TextStyle(
                          color: CustomColors.secondaryColor),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
