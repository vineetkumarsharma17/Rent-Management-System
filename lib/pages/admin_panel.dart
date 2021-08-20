import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_management_system/pages/add_renter.dart';
import 'package:rent_management_system/pages/sign_up.dart';
class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  final List _pages=<Widget>[
    AddRenter(),
    SignUpPage(),
    AddRenter(),
  ];

  int _currentState=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentState,
        onTap: (index){
          setState(() {
            _currentState=index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.add),label: "Add Renter"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.money_dollar),label: "Submit Rent"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.delete),label: "Delete Renter"),
        ],

      ),
      body:_pages[_currentState],
    );
  }
}
