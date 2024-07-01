import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

class UserEventSchedule extends StatefulWidget {
  const UserEventSchedule({super.key});

  @override
  State<UserEventSchedule> createState() => _UserEventScheduleState();
}

class _UserEventScheduleState extends State<UserEventSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Text(
                "Medical Camp Events",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            const Divider(color: Colors.black45,),
            SizedBox(height: 40,),
            Text(
              "Free Medical Camp at Perinthalmanna, Muncipality",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text("on 30-08-2024"),
                SizedBox(
                  width: 10,
                ),
                TextButton(onPressed: () {}, child: Text("See more", style: TextStyle(color: Colors.lightBlue),))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Free Medical Camp at Thirurkad, viva auditorium",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text("on 20-08-2024"),
                SizedBox(
                  width: 10,
                ),
                TextButton(onPressed: () {}, child: Text("See more", style: TextStyle(color: Colors.lightBlue),))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Free Medical Camp at Muthukad Tribal Colony",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text("on 15-06-2024"),
                SizedBox(
                  width: 10,
                ),
                TextButton(onPressed: () {}, child: Text("See more", style: TextStyle(color: Colors.lightBlue),))
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
