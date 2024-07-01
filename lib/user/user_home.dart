import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peaceful_pulse/constants/custom_colors.dart';
import 'package:peaceful_pulse/user/user_ambulance_call.dart';
import 'package:peaceful_pulse/user/user_event_schedule.dart';
import 'package:peaceful_pulse/user/user_home_details.dart';
import 'package:peaceful_pulse/user/user_medical_store.dart';
import 'package:peaceful_pulse/user/user_profile.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {

  int _selectedItem = 0;

  final List _widgetOptions = <Widget>[
    const UserHomeDetails(),
    const UserMedicalStore(),
    const UserEventSchedule(),
    const UserAmbulanceCall(),
    const UserProfile()
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedItem = index ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          color: CustomColors.primaryColor,
          child: _widgetOptions.elementAt(_selectedItem),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CustomColors.secondaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.house,), label: ''),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.capsules,), label: ''),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.calendar,), label: ''),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.truckMedical,), label: ''),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user,), label: '')
        ],
        iconSize: 23,
        onTap: _onItemTapped,
        currentIndex: _selectedItem,
        selectedItemColor: CustomColors.primaryColor,
        unselectedItemColor: CustomColors.secondaryColor,
        showSelectedLabels: false,
      ),
    );
  }
}
