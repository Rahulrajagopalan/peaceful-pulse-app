import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peaceful_pulse/constants/custom_colors.dart';

import '../services/database_methods.dart';

class UserAmbulanceCall extends StatefulWidget {
  const UserAmbulanceCall({super.key});

  @override
  State<UserAmbulanceCall> createState() => _UserAmbulanceCallState();
}

class _UserAmbulanceCallState extends State<UserAmbulanceCall> {

  Stream? ambulanceStream;

  getOnTheLoad() async{
    ambulanceStream = await DataBaseMethods().getAmbulanceDetails();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        color: CustomColors.secondaryColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            CupertinoIcons.search,
                            color: CustomColors.primaryColor,
                          ),
                          hintText: 'Search location',
                          hintStyle: TextStyle(color: CustomColors.primaryColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder(
                      stream: ambulanceStream,
                      builder: (context, snapshot) {
                        return snapshot.hasData? ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              DocumentSnapshot ds = snapshot.data.docs[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5),
                                child: Container(
                                  height: 150,
                                  decoration: const BoxDecoration(
                                    color: Colors.teal,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(8)),
                                          width: 100,
                                          height: 100,
                                          child: ds.exists
                                              ? Image.network(ds["Image"],)
                                              : const Center(child: Text("Photo")),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              ds["Name"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                                width: 150,
                                                child: Text(
                                                  "Angadippuram",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w400, color: Colors.white),
                                                )),
                                            TextButton(
                                              onPressed: () {
                                                FlutterPhoneDirectCaller.callNumber(ds["Phone"]);
                                              },
                                              style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(5)),
                                                  foregroundColor: Colors.white,
                                                  backgroundColor:
                                                  Colors.redAccent),
                                              child: const Text("Call"),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }):Container();
                      }
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}
