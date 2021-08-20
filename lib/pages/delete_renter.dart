import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:rent_management_system/pages/renter_db_helper.dart';
class DeleteRenter extends StatefulWidget {

  @override
  _DeleteRenterState createState() => _DeleteRenterState();
}

class _DeleteRenterState extends State<DeleteRenter> {
  TextEditingController aadhar_no=TextEditingController();
  final db=DatabaseHelperRenter.instance;
  List <RenterDetail>allRenter;
  bool flag=false;
  void delete_renter_detail()async{
    allRenter=await db.viewAllRenter();
    allRenter.forEach((element) {
      if(element.aadhar==aadhar_no.text){
        flag=true;
        db.deleteRenter(aadhar_no.text);
      }
    });
    deletedAlert(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Renter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 50,
            margin: EdgeInsets.only(left: 20,right: 20,top: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.green,
                    offset: Offset(3,3),
                    blurRadius: 7,
                    spreadRadius: 1,
                  ),
                ]
            ),
            child: TextField(
              controller: aadhar_no,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                //hintText: "Name",
                hintText: "Aadhar No",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 70,),
          ElevatedButton(
              onPressed: (){
                delete_renter_detail();
              },
    child: Text("Delete Renter")),

        ],
      ),

    );
  }
  void deletedAlert(BuildContext context){
    Widget okButton=TextButton(
        onPressed: (){
          Navigator.of(context).pop();
          setState(() {
          });
        },
        child: Text("Ok")
    );
    AlertDialog savealert=AlertDialog(
      title: (flag==false)?Text("Error!"):Text("Deleted!"),
      content: (flag==false)?Text("Renter Not Found."):Text("Renter Deleted"),
      actions: [okButton],
    );
    showDialog(context: context, builder: (BuildContext context){
      return savealert;
    });
  }
}
