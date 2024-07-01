import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

class AmbulanceAppointments extends StatelessWidget {
  const AmbulanceAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);} ,icon: Icon(CupertinoIcons.back)),
        backgroundColor: CustomColors.secondaryColor,
        title: Text("Palliative Care", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        color: CustomColors.secondaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  color: CustomColors.primaryColor,
                  height: 250,
                  child: Column(
                    children: [
                      Table(
                        children: const [
                          TableRow(
                            children: [
                              Center(child: Text("Name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                              Center(child: Text("Place", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                              Center(child: Text("Time", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                              Center(child: Text("Phone", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))
                            ]
                          ),
                        ],
                      )
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
