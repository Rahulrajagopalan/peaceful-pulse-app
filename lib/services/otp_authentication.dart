import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:peaceful_pulse/user/user_home.dart';

class PhoneOTPVerification extends StatefulWidget {
  const PhoneOTPVerification({Key? key}) : super(key: key);

  @override
  State<PhoneOTPVerification> createState() => _PhoneOTPVerificationState();
}

class _PhoneOTPVerificationState extends State<PhoneOTPVerification> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpConttroller = TextEditingController();
  bool visible = false;
  var temp;

  @override
  void dispose() {
    phoneNumber.dispose();
    otpConttroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Phone OTP Authentication"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputTextField("Contact Number", phoneNumber, context),
            visible ? inputTextField("OTP", otpConttroller, context) : SizedBox(),
            !visible ? SendOTPButton("Send OTP") : SubmitOTPButton("Submit"),
            // ElevatedButton(onPressed: (){
            //   FirebaseAuth.instance.signInWithPhoneNumber('+91${phoneNumber.text}').then((value){
            //     temp = value;
            //     ScaffoldMessenger(child: Text("OTP Sent"));
            //   });
            // }, child: Text("Send OTP")),
            // inputTextField("OTP", otpConttroller, context),
            // ElevatedButton(onPressed: (){
            //   temp.confirm(otpConttroller.text).then((user){
            //       log(user.user!.uid.toString());
            //       Navigator.push(context, MaterialPageRoute(builder: (context)=> UserHome()));
            //     });
            // }, child: Text("Submit OTP"))
          ],
        ),
      ),
    );
  }

  Widget SendOTPButton(String sendOtpText) => ElevatedButton(
        onPressed: () async {
          
          temp = await FirebaseAuthentication().sendOTP(phoneNumber.text);
          setState(() {
            visible = !visible;
          });
        },
        child: Text(sendOtpText),
      );

  Widget SubmitOTPButton(String subOtpText) => ElevatedButton(
        onPressed: () => FirebaseAuthentication().authenticate(temp, otpConttroller.text),
        child: Text(subOtpText),
      );

  Widget inputTextField(String labelText,
          TextEditingController textEditingController, BuildContext context) =>
      Padding(
        padding: EdgeInsets.all(10.00),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          child: TextFormField(
            obscureText: labelText == "OTP" ? true : false,
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: labelText,
              hintStyle: TextStyle(color: Colors.blue),
              filled: true,
              fillColor: Colors.blue[100],
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5),
              ),
            ),
          ),
        ),
      );
}

class FirebaseAuthentication {
  String phoneNumber = "";

  sendOTP(String phoneNumber) async {
    this.phoneNumber = phoneNumber;
    FirebaseAuth auth = FirebaseAuth.instance;
    ConfirmationResult result = await auth.signInWithPhoneNumber(
      '+91$phoneNumber',
    );
    printMessage("OTP Sent to +91 $phoneNumber");
    return result;
  }

  authenticate(ConfirmationResult confirmationResult, String otpConttroller) async {
    UserCredential userCredential = await confirmationResult.confirm(otpConttroller);
    userCredential.additionalUserInfo!.isNewUser
        ? printMessage("Authentication Successful")
        : printMessage("User already exists");
  }

  printMessage(String msg) {
    debugPrint(msg);
  }
}
