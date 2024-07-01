import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

class UserHelp extends StatelessWidget {
  const UserHelp({super.key});

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
      ),
      body: Container(
        color: CustomColors.secondaryColor,
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: const [
                Row(
                  children: [
                    Icon(Icons.info_outline),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        SizedBox(width: 250, child: Text("You can always call our Office at this Number")),
                        Text("+91 67324*****", style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 40,),
                Row(
                  children: [
                    Icon(Icons.email_outlined),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        SizedBox(width: 250, child: Text("You can contact Us by mail by this mail")),
                        Text("info@peacefulpulse.com", style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    )
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
