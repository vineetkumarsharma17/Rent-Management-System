import 'package:flutter/material.dart';
import 'package:rent_management_system/pages/add_renter.dart';
class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
       // leading: Icon(Icons.admin_panel_settings),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              padding: EdgeInsets.all(60),
              decoration: BoxDecoration(
                color: Colors.blue,
               shape: BoxShape.circle,
              ),
              child: TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddRenter()));
                },
                child: Text("Add Renter",style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),),
              ),

            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              //alignment: Alignment.center,
              padding: EdgeInsets.all(60),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Text("Submit Rent",style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
