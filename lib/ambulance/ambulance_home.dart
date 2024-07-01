import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peaceful_pulse/ambulance/ambulance_appointments.dart';
import 'package:peaceful_pulse/ambulance/ambulance_notification.dart';
import 'package:peaceful_pulse/constants/custom_colors.dart';

class AmbulanceHome extends StatelessWidget {
  const AmbulanceHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.back),
        backgroundColor: CustomColors.secondaryColor,
        title: Text(
          "Palliative Care",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AmbulanceNotification()));
              },
              icon: const Icon(Icons.notifications_none))
        ],
      ),
      body: Container(
        color: CustomColors.secondaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 250,
                  child: Image.network(
                      'https://s3-alpha-sig.figma.com/img/1e96/d836/c7d9a8cf1a419d0d397909f2932c4704?Expires=1714348800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=V4rF~AUi3wVx9CtyQIZlTe6gwaxPlMm06bIw6AV79J8bFWujSzPhPhMnTCc8hW3VBPW4mGa6uSyNM-tjHfqnXZkEchGFkmsbH2rp-ZfPzORxjqgdcbV3JgUtctBy0DWVn8bx~-6vksDx5rQAE2EISYOBAX1HVcnAmHbQAH~CWXLPDTnwF-pBW6DN~yPP3O4KzL7F1HhlTqVWH1fO3MqrMZbocf525eGRa4Iweg6~FZ4xJ1W8UrZfkFwREDZeL1QcFLCnHG~MY-n8c7owoCN~uxi1FSC5rLN2kYSiUrzrX~xsTqK9kbWKJpzKJFA1Ocp2IvH2uEK0OOLX5JHwAOU3dw__'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AmbulanceAppointments()));
                  },
                  style: TextButton.styleFrom(
                      minimumSize: const Size(300, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      foregroundColor: Colors.white,
                      backgroundColor: CustomColors.primaryColor),
                  child: Text(
                    "Appointments",
                    style: TextStyle(color: CustomColors.secondaryColor),
                  )),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> const AmbulanceHome()));
                  },
                  style: TextButton.styleFrom(
                      minimumSize: const Size(300, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      foregroundColor: Colors.white,
                      backgroundColor: CustomColors.primaryColor),
                  child: Text(
                    "Messages",
                    style: TextStyle(color: CustomColors.secondaryColor),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
