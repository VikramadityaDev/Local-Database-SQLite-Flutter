import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
 /// const NoteDetail({Key? key}) : super(key: key);

   String appBarTitle;
  NoteDetail(this.appBarTitle);


  @override
  State<NoteDetail> createState() => _NoteDetailState(this.appBarTitle);
}

class _NoteDetailState extends State<NoteDetail> {
 String? appBarTitle;
  static var _priorities = ["Hight" , "Low"];
  var data= "Low";
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  _NoteDetailState(String? appBarTitle);
  //NoteDetailState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text(appBarTitle.toString()),
     ),
      body: Padding(
        padding: EdgeInsets.only(top: 15,left: 10,right: 10),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDownStringItem)
                {
                  return DropdownMenuItem<String>
                  (
                        value:dropDownStringItem,
                  child: Text(dropDownStringItem));
                      }

                ).toList(),
                value: data,
                onChanged: (valueSelectedByUser){
                  setState(() {
data=valueSelectedByUser.toString();
                  });
                },
              ),
            ),

            TextField(
              controller: title,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                )
              ),

            ),

            TextField(
              controller: title,
              decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),

            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: (){}, child: Text("Save")),



                ElevatedButton(onPressed: (){}, child: Text("Delete")),
              ],
            )

          ],
        ),
      ),
    );
  }
}
