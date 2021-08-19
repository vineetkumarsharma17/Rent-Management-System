import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
class AddRenter extends StatefulWidget {

  @override
  _AddRenterState createState() => _AddRenterState();
}

class _AddRenterState extends State<AddRenter> {
  TextEditingController name=TextEditingController();
  TextEditingController f_name=TextEditingController();
  TextEditingController aadhar=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController contact_no=TextEditingController();
  TextEditingController contact_no2=TextEditingController();
  TextEditingController room_no=TextEditingController();
  TextEditingController rent_amount=TextEditingController();
  DateTime currentDate = DateTime.now();
  String rent_date='';
   // DateFormat formatter = DateFormat('yyyy-MM-dd');
   // String rent_date=formatter.format(currentDate);
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        rent_date=pickedDate.day.toString()+"/"+pickedDate.month.toString()+"/"+pickedDate.year.toString();
        currentDate = pickedDate;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Renter"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.zero,
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
              ),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
              ),
              child: TextField(
                controller: f_name,
                decoration: InputDecoration(
                  labelText: "Father's name",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
              ),
              child: TextField(
                controller: aadhar,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Aadhar No",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
              ),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: contact_no,
                decoration: InputDecoration(
                  labelText: "Contact number",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: contact_no2,
                decoration: InputDecoration(
                  labelText: "Alternate number",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
              ),
              child: TextField(
                controller: room_no,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Room number",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: rent_amount,
                decoration: InputDecoration(
                  labelText: "Rent",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(rent_date),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent[200]),

                    ),
                    onPressed: ()=>_selectDate(context),
                    child: Text("Select Date",style: TextStyle(color: Colors.black),),
                  ),
                ],
              )
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: (){
              },
              child: Text("Add renter"),
            ),
          ],
        ),
      ),
    );
  }
}
