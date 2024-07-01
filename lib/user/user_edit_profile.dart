import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';
import '../services/database_methods.dart';

class UserEditProfile extends StatefulWidget {
  const UserEditProfile({super.key});

  @override
  State<UserEditProfile> createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  String user = FirebaseAuth.instance.currentUser!.uid;

  DocumentSnapshot? userDoc;

  getOnTheLoad() async {
    userDoc =
        await FirebaseFirestore.instance.collection('Users').doc(user).get();
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: CustomColors.secondaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(CupertinoIcons.back)),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: getOnTheLoad(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              const Text(
                                "Edit Profile",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 30,
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Personal",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintStyle: const TextStyle(
                                        color: CustomColors.secondaryColor),
                                    labelText: userDoc!["Name"],
                                    labelStyle: TextStyle(color: Colors.white),
                                    filled: true,
                                    fillColor: CustomColors.primaryColor,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                style: const TextStyle(
                                    color: CustomColors.secondaryColor),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    hintStyle: const TextStyle(
                                        color: CustomColors.secondaryColor),
                                    labelText: userDoc!["Email"],
                                    labelStyle: TextStyle(color: Colors.white),
                                    filled: true,
                                    fillColor: CustomColors.primaryColor,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                style: const TextStyle(
                                    color: CustomColors.secondaryColor),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: phoneController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    hintStyle: const TextStyle(
                                        color: CustomColors.secondaryColor),
                                    labelText: userDoc!["Phone Number"],
                                    labelStyle: TextStyle(color: Colors.white),
                                    filled: true,
                                    fillColor: CustomColors.primaryColor,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                style: const TextStyle(
                                    color: CustomColors.secondaryColor),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextButton(
                                  onPressed: () async {
                                    String id =
                                        FirebaseAuth.instance.currentUser!.uid;
                                    Map<String, dynamic> userEditMap = {
                                      "Name": nameController.text,
                                      "Email": emailController.text,
                                      "Phone Number": phoneController.text,
                                      "id": id
                                    };
                                    print(userEditMap);
                                    await DataBaseMethods()
                                        .updateUser(userEditMap, id)
                                        .then(
                                            (value) => Navigator.pop(context));
                                  },
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      foregroundColor: Colors.white,
                                      backgroundColor:
                                          CustomColors.primaryColor),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Text(
                                      "Save",
                                      style: TextStyle(
                                          color: CustomColors.secondaryColor),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
}
