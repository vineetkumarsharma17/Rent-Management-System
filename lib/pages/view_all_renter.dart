import 'package:flutter/material.dart';
import 'package:rent_management_system/pages/renter_db_helper.dart';
class ShowAllRenter extends StatefulWidget {
  List <RenterDetail>allRenter;
  ShowAllRenter(this.allRenter);
  @override
  _ShowAllRenterState createState() => _ShowAllRenterState(allRenter);
}

class _ShowAllRenterState extends State<ShowAllRenter> {
  _ShowAllRenterState(this.allRenter);
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
  // void initState()async{
  //   // emp=Employee.getUser();
  //   // allRenter=await db.viewAllRenter();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Renter Detail"),
      ),
      body: Column(
        children: [
          Expanded(child:tableBody(context) )
        ],
      ),

    );
  }
  SingleChildScrollView tableBody(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 10,
          decoration:BoxDecoration(
              border: Border.all(color: Colors.black)
          ) ,
          dataRowHeight: 40,
          dividerThickness: 3,
          columns: [
            DataColumn(label: Text("Name",style: TextStyle(
              color: Colors.orange,
              fontStyle: FontStyle.italic,
            ),),
              tooltip: "This is name",
            ),
            DataColumn(label: Text("Aadhar",style: TextStyle(
              color: Colors.orange,
              fontStyle: FontStyle.italic,
            ),),
              //tooltip: "This is email",
            ),
            DataColumn(label: Text("Mobile",style: TextStyle(
              color: Colors.orange,
              fontStyle: FontStyle.italic,
            ),),
              //tooltip: "This is first name",
            ),
            DataColumn(label: Text("Room no",style: TextStyle(
              color: Colors.orange,
              fontStyle: FontStyle.italic,
            ),),
            ),
            DataColumn(label: Text("Room Rent",style: TextStyle(
              color: Colors.orange,
              fontStyle: FontStyle.italic,
            ),),
            ),
            DataColumn(label: Text("Rent Date",style: TextStyle(
              color: Colors.orange,
              fontStyle: FontStyle.italic,
            ),),
              //tooltip: "This is email",
            ),
            DataColumn(label: Text("Delete",style: TextStyle(
              color: Colors.orange,
              fontStyle: FontStyle.italic,
            ),),
              //tooltip: "This is email",
            ),
          ],
          rows: allRenter.map((obj) => DataRow(
              cells: [
                DataCell(Text(obj.name)),
                DataCell(Text(obj.aadhar)),
                DataCell(Text(obj.mobile)),
                DataCell(Text(obj.room_no)),
                DataCell(Text(obj.rent)),
                DataCell(Text(obj.date)),
                DataCell(Icon(Icons.delete)),
              ]
          )).toList(),
        ),
      ),
    );
  }
}
