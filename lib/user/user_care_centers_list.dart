import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peaceful_pulse/services/database_methods.dart';
import 'package:peaceful_pulse/user/user_care_center_details.dart';

import '../constants/custom_colors.dart';

class UserCareCentersList extends StatefulWidget {
  const UserCareCentersList({super.key});

  @override
  State<UserCareCentersList> createState() => _UserCareCentersListState();
}

class _UserCareCentersListState extends State<UserCareCentersList> {
  double _rateValue = 0;

  Stream? centerStream;

  getOnLoad() async{
    centerStream = await DataBaseMethods().getCenterDetails();
    setState(() {});
  }

  @override
  void initState() {
    getOnLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.secondaryColor,
        title: const Text(
          "Palliative Centers",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.black,
            )),
      ),
      body: Container(
        color: CustomColors.secondaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: StreamBuilder(
                stream: centerStream,
                builder: (BuildContext context,AsyncSnapshot snapshot) {
                  return snapshot.hasData? ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data.docs[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UseCareCenterDetails(ds: ds,)));
                          },
                          child: SizedBox(
                            height: 120,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        width: 100,
                                        height: 70,
                                        child: ds.exists
                                            ? Image.network(ds["Image"],)
                                            : const Center(child: Text("Photo")),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "$_rateValue",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(ds["Name"],
                                        style: TextStyle(
                                            color: CustomColors.primaryColor),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                          width: 150,
                                          child: Text(
                                            ds["Email"],
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }): Container();
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
