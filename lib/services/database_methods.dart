import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaceful_pulse/models/user_model.dart';

class DataBaseMethods {
  final storeUser = FirebaseFirestore.instance.collection("Users");
  final storeDoctor = FirebaseFirestore.instance.collection("Doctors");
  
  Future addUserDetails(UserModel userInfoMap, String id) async {
    return await storeUser
        .doc(id)
        .set(userInfoMap.toMap());
  }

  Future<Stream<QuerySnapshot>>getUserDetails()async{
    return await FirebaseFirestore.instance.collection("Users").snapshots();
  }
  
  getUserFirst(){
    FirebaseFirestore.instance.collection("Users").where('First Name', isEqualTo: 'james').snapshots();
  }

  Future updateUser(Map<String, dynamic> doctorInfoMap, String id) async{
    return await FirebaseFirestore.instance.collection("Users").doc(id).update(doctorInfoMap);
  }

  Future<Stream<QuerySnapshot>>getDoctorDetails()async{
    return await FirebaseFirestore.instance.collection("Doctors").snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>>getDoctor()async{
    return await FirebaseFirestore.instance.collection("Doctors").get();
  }

  Future<Stream<QuerySnapshot>>getAmbulanceDetails()async{
    return await FirebaseFirestore.instance.collection("Ambulance").snapshots();
  }

  Future updateDoctor(Map<String, dynamic> doctorInfoMap, String id) async{
    return await FirebaseFirestore.instance.collection("Doctors").doc(id).update(doctorInfoMap);
  }

  Future<Stream<QuerySnapshot>>getCenterDetails()async{
    return await FirebaseFirestore.instance.collection("Centers").snapshots();
  }

  Future<Stream<QuerySnapshot>>getMedicineDetails()async{
    return await FirebaseFirestore.instance.collection("Medicine").snapshots();
  }

  Future campBooking(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Booking")
        .doc(id)
        .set(userInfoMap);
  }

  Future doctorBooking(Map<String, dynamic> docUserInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Doctor Booking")
        .doc(id)
        .set(docUserInfoMap);
  }

}
