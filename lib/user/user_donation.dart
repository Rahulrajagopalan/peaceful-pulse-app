import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peaceful_pulse/constants/custom_colors.dart';

class UserDonation extends StatefulWidget {
  const UserDonation({super.key});

  @override
  State<UserDonation> createState() => _UserDonationState();
}

class _UserDonationState extends State<UserDonation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop((context));
            },
            icon: const Icon(CupertinoIcons.back)),
        title: Text("Donations", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: CustomColors.secondaryColor,
      ),
      body: Container(
        color: CustomColors.secondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: CustomColors.primaryColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Make your First Donation",
                        style: TextStyle(
                            color: CustomColors.secondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 250,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple)
                          ),
                        ),
                      ),
                      Text(
                        "Help the indonations our surrounding patients for better life,Each donation can help save more than one life. ",
                        style: TextStyle(
                            color: CustomColors.secondaryColor,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Donation Goals", style: TextStyle(fontWeight: FontWeight.bold, ),)
                ],
              ),
              const Row(
                children: [
                  Text("Progress Bar"),
                  SizedBox(width: 10,),
                  Text("12/30 Days"),
                ],
              ),
              SizedBox(height: 30,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Participants", style: TextStyle(fontWeight: FontWeight.bold, ),)
                ],
              ),
              Row(
                children: [
                  CircleAvatar(radius: 20, backgroundColor: Colors.grey,),
                  CircleAvatar(radius: 20, backgroundColor: Colors.grey,),
                  CircleAvatar(radius: 20, backgroundColor: Colors.grey,),
                  CircleAvatar(radius: 20, backgroundColor: Colors.grey,),
                  SizedBox(width: 10,),
                  TextButton(onPressed: (){}, child: Text("See all"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
