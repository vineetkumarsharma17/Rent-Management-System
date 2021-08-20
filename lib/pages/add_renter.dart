import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rent_management_system/pages/renter_db_helper.dart';
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
  final db=DatabaseHelperRenter.instance;
  List <RenterDetail>allRenter;
  void viewRenter()async{
    allRenter=await db.viewAllRenter();
    allRenter.forEach((obj) {
      print("name:${obj.name}");
      print('aadhar:${obj.aadhar}');
      print("date:${obj.date}");
      print("===================================");
    });

  }
  void saverRenter()async{
    RenterDetail obj=RenterDetail(
      name: name.text,
      father_name: f_name.text,
      aadhar: aadhar.text,
      email: email.text,
      mobile: contact_no.text,
      mobile2: contact_no2.text,
      room_no: room_no.text,
      rent: rent_amount.text,
      date: rent_date,
    );
    db.insertRenter(obj);
    print("Datasaved");
    viewRenter();
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
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
                controller: name,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  //hintText: "Name",
                  hintText: "Name",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.green,
                    offset: Offset(3,3),
                    blurRadius: 9,
                    spreadRadius: 1,
                  ),
                ]
              ),
              child: TextField(
                controller: f_name,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Father's name",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.white,
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
                controller: aadhar,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Icon(Icons.inventory),
                  hintText: "Aadhar No",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.white,
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
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "Email",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.green,
                      offset: Offset(3,3),
                      blurRadius: 7,
                      spreadRadius: 1,
                    ),
                  ],
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: contact_no,
                decoration: InputDecoration(
                  icon: Icon(Icons.phone_android),
                  hintText: "Contact number",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.white,
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
                keyboardType: TextInputType.number,
                controller: contact_no2,
                decoration: InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: "Alternate number",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.white,
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
                controller: room_no,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Icon(Icons.house),
                  hintText: "Room number",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.white,
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
                keyboardType: TextInputType.number,
                controller: rent_amount,
                decoration: InputDecoration(
                  icon: Icon(CupertinoIcons.money_dollar_circle_fill),
                  hintText: "Rent",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              height: 40,
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.white,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.date_range),
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
              onPressed: saverRenter,
              child: Text("Add renter"),
            ),
            ElevatedButton(onPressed: viewRenter, child: Text("ShowAll")),
          ],
        ),
      ),
    );
  }
}
