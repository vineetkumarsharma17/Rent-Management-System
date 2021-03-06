import 'package:flutter/material.dart';
import 'package:rent_management_system/pages/admin_db_helper.dart';

class SignUpPage extends StatefulWidget {

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController name=TextEditingController();
  TextEditingController mobile=TextEditingController();
  TextEditingController user_name=TextEditingController();
  TextEditingController password=TextEditingController();
  final db = DatabaseHelper.instance;
  List<userName> allRows;
  String status="Sign Up";
  void viewRecord() async {
    allRows = await db.vieweAllUsers();
    bool flag=true;
    allRows.forEach((obj) {
      if (obj.user_name == 'admin') {
        print(obj.user_name);
        print(obj.password);
        flag = false;
      }
    });
    if(flag==true)
      print('not found');
    // print(allRows[1].user_name);
  }
  void deleteRecord(String user)async{
    db.deleteUser(user);
    print('deleted vk');
  }
  void saveRecord()
  {
    userName obj=userName(
      name: name.text,
      mobile: mobile.text,
      user_name: user_name.text,
      password: password.text,
    );
    db.insertUser(obj);
    SavedAlert(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),

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
              child: Text(status,style: TextStyle(
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
              ),
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30,right: 30,top: 20),
              child: TextField(
                controller: password,
                //keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  border: InputBorder.none,
                  labelText: "Password",
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
                    saveRecord();
                    setState(() {
                      status="Record saved";
                    });
                  },
                  child: Text("Sign Up"),
                  style:ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      minimumSize: MaterialStateProperty.all(Size(300, 50))
                  ),
                )
            ),
            ElevatedButton(
                onPressed: (){
                  viewRecord();
                },
                child: Text("Show All")),
            ElevatedButton(
                onPressed: (){
                  deleteRecord("vkwilson");
                },
                child: Text("delete")),

          ],
        ),
      ),
    );
  }
  void SavedAlert(BuildContext context){
    Widget okButton=TextButton(
        onPressed: (){
          Navigator.of(context).pop();
          setState(() {
            user_name.clear();
            password.clear();
            mobile.clear();
            name.clear();
          });
        },
        child: Text("Ok")
    );
    AlertDialog savealert=AlertDialog(
      title: Text("Saved!"),
      content: Text("User added."),
      actions: [okButton],
    );
    showDialog(context: context, builder: (BuildContext context){
      return savealert;
    });
  }
}
