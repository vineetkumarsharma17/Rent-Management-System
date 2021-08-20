import 'package:flutter/material.dart';
import 'package:rent_management_system/pages/admin_db_helper.dart';
import 'package:rent_management_system/pages/admin_panel.dart';
import 'package:rent_management_system/pages/sign_up.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:AdminPanel() ,
      //color: Colors.white,
    );
  }
}
class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final db = DatabaseHelper.instance;
  bool flag=false;
  TextEditingController user_name=TextEditingController();
  TextEditingController password=TextEditingController();
  List<userName>allUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Room Management System"),
        leading: Icon(Icons.business),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.yellow,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30,right: 30,top: 50),
              child: Text("Log In",style: TextStyle(
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
              margin: EdgeInsets.only(left: 30,right: 30,top: 50),
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
              margin: EdgeInsets.only(left: 30,right: 30,top: 50),
              child: TextField(
                controller: password,
                //keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  isDense: false,
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
              margin: EdgeInsets.only(left: 60,right: 60,top: 50),
              child: ElevatedButton(
                onPressed: logIn,
                child: Text("Log In"),
                style:ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  minimumSize: MaterialStateProperty.all(Size(300, 50))
                ),
              )
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New User"),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SignUpPage();
                  }));
                },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text("Sign Up",style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),)),
              ],
            )

          ],
        ),
      ),
    );
  }
  void logIn(){
    if(user_name.text==''||password.text==''){
      showAlert(context);
    }
    else{
      searchUser(user_name.text, password.text);
        // showLogInAlert(context);
    }
  }
  void showAlert(BuildContext context){
    Widget okButton=TextButton(
        onPressed: (){
      Navigator.of(context).pop();
      setState(() {
        user_name.clear();
        password.clear();
      });
        },
        child: Text("Ok")
    );
    AlertDialog emptyalert=AlertDialog(
      title: Text("Error!"),
      content: Text("Username or Password can't be empty."),
      actions: [okButton],
    );
    showDialog(context: context, builder: (BuildContext context){
      return emptyalert;
    });
  }
   searchUser(String userName,String pass) async{
    allUser= await db.vieweAllUsers();
    allUser.forEach((obj) {
      if(obj.user_name==userName) {
        if (obj.password == pass) {
          flag = true;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminPanel())
          ).then((value) => flag = false);
        }
      }
    });
    if(flag==false)
      showLogInAlert(context);
  }
  void showLogInAlert(BuildContext context){
    Widget okButton=TextButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: Text("Ok")
    );
    AlertDialog loginalert=AlertDialog(
      title: Text("Error!"),
      content: Text("Username or Password Incorrect"),
      actions: [okButton],
    );
    showDialog(context: context, builder: (BuildContext context){
      return loginalert;
    });
  }

}

