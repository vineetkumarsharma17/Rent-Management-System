import 'package:flutter/material.dart';
class ForgatePassword extends StatefulWidget {

  @override
  _ForgatePasswordState createState() => _ForgatePasswordState();
}

class _ForgatePasswordState extends State<ForgatePassword> {
  TextEditingController name=TextEditingController();
  TextEditingController mobile=TextEditingController();
  TextEditingController user_name=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Password"),

      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.yellow,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30,right: 30,top: 50,bottom: 30),
              child: Text("Forgot Password",style: TextStyle(
                color: Colors.red,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 1),
                borderRadius: BorderRadius.only(topLeft:Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30,right: 30,top: 20),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  border: InputBorder.none,
                  labelText: "Name",
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 1),
                borderRadius: BorderRadius.only(topLeft:Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30,right: 30,top: 20),
              child: TextField(
                controller: mobile,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  border: InputBorder.none,
                  labelText: "Mobile",
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 1),
                borderRadius: BorderRadius.only(topLeft:Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30,right: 30,top: 20),
              child: TextField(
                controller: user_name,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  border: InputBorder.none,
                  labelText: "User Name",
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 1),
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.blue
                ),
                padding: EdgeInsets.only(left: 20,right: 20),
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 100,right: 100,top: 40),
                child: ElevatedButton(
                  onPressed: (){

                  },
                  child: Text("Get PassWord"),
                  style:ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      minimumSize: MaterialStateProperty.all(Size(300, 50))
                  ),
                )
            ),


          ],
        ),
      ),
    );
  }
}
