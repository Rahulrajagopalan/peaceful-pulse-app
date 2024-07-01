import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peaceful_pulse/constants/custom_colors.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.secondaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.back)),
        title: Text("Settings", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [Icon(CupertinoIcons.gear_alt_fill)],
      ),
      body: Container(
        color: CustomColors.secondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: const [
              Row(
                children: [
                  Icon(Icons.edit),
                  SizedBox(width: 5,),
                  Text("Account settings")
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(CupertinoIcons.bell),
                  SizedBox(width: 5,),
                  Text("Notification Preference")
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(Icons.translate),
                  SizedBox(width: 5,),
                  Text("Languages")
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(Icons.dark_mode),
                  SizedBox(width: 5,),
                  Text("Theme preference")
                ],
              ),
              SizedBox(height: 20,),
            ],
          )
        ),
      ),
    );
  }
}
