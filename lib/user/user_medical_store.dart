import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peaceful_pulse/constants/custom_colors.dart';
import 'package:peaceful_pulse/services/database_methods.dart';
import 'package:peaceful_pulse/user/user_medicine_info.dart';

class UserMedicalStore extends StatefulWidget {
  const UserMedicalStore({super.key});

  @override
  State<UserMedicalStore> createState() => _UserMedicalStoreState();
}

class _UserMedicalStoreState extends State<UserMedicalStore> {

  Stream? medicineStream;
  getOnLoad()async{
    medicineStream= await DataBaseMethods().getMedicineDetails();
    setState(() {});
  }
  @override
  void initState() {
    getOnLoad();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Medicines",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Text(
                "Categories",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Fever"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Suger"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Pressure"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Painkiller"),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height/1.5,
            child: StreamBuilder(
              stream: medicineStream,
              builder: (context, snapshot) {
                return snapshot.hasData? GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot ds = snapshot.data.docs[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserMedicineInfo(ds: ds,)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(ds["Image"]))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(ds["Name"], style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ): Container();
              }
            ),
          ),
          // SizedBox(
          //     height: MediaQuery.of(context).size.height / 1.5,
          //     child: GridView.count(
          //       mainAxisSpacing: 5,
          //       crossAxisSpacing: 5,
          //       padding: EdgeInsets.all(10),
          //       crossAxisCount: 2,
          //       children: [
          //         InkWell(
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => const UserMedicineInfo()));
          //           },
          //           child: Container(
          //             padding: const EdgeInsets.all(8),
          //             color: Colors.grey,
          //             child: const Text("Paracetamol"),
          //           ),
          //         ),
          //       ],
          //     ))
        ],
      ),
    );
  }
}
