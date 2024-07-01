import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peaceful_pulse/constants/custom_colors.dart';
import 'package:peaceful_pulse/services/database_methods.dart';
import 'package:peaceful_pulse/user/user_care_centers_list.dart';
import 'package:peaceful_pulse/user/user_doctor_booking.dart';
import 'package:peaceful_pulse/user/user_donation.dart';

class UserHomeDetails extends StatefulWidget {
  const UserHomeDetails({super.key});

  @override
  State<UserHomeDetails> createState() => _UserHomeDetailsState();
}

class _UserHomeDetailsState extends State<UserHomeDetails> {
  double _rateValue = 0;

  Stream? doctorStream;

  getOnTheLoad() async{
    doctorStream = await DataBaseMethods().getDoctorDetails();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        color: CustomColors.secondaryColor,
                      ),
                      hintText: 'Nearest Location',
                      hintStyle: TextStyle(color: CustomColors.secondaryColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              // IconButton(
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const UserDonation()));
              //     },
              //     icon: const Icon(
              //       FontAwesomeIcons.handHoldingHeart,
              //       color: CustomColors.secondaryColor,
              //     )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserCareCentersList()));
                  },
                  icon: Icon(
                    Icons.menu,
                    color: CustomColors.secondaryColor,
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 250,
          child: Image(image: AssetImage('assets/images/home_image.png')),),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: doctorStream,
                  builder: (BuildContext context,AsyncSnapshot snapshot) {
                    return snapshot.hasData? ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          DocumentSnapshot ds = snapshot.data.docs[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5),
                            child: Container(
                              height: 200,
                              decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: CupertinoColors.darkBackgroundGray,
                                        spreadRadius: 1,
                                        blurRadius: 3)
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
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
                                          height: 100,
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
                                        Text(
                                          ds["Name"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                            width: 150,
                                            child: Text(
                                              ds["Designation"],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            )),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> UserDoctorBooking(ds: ds)));
                                          },
                                          style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              foregroundColor: Colors.white,
                                              backgroundColor:
                                                  CustomColors.primaryColor),
                                          child: const Text("Book"),
                                        )
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
              ),
            ],
          ),
        )
      ],
    );
  }
}
