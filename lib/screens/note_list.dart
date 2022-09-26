import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/models/note.dart';
import 'package:untitled/screens/note_details.dart';
import 'package:untitled/utils/database_helper.dart';


class NoteList extends StatefulWidget {
 // const NoteList({Key? key}) : super(key: key);




  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note>? noteList;
  int count = 0;



  @override
  Widget build(BuildContext context) {

    if(noteList == null)
      {
        noteList =<Note>[];
        updateListView();
      }

    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(onPressed: ()
      {
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>NoteDetail("Add Notes")));
      },
      tooltip: "Add notes",
        child: Icon(Icons.add),
      ),
    );
  }


  getNoteListView() {

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context , int position)
        {
          return Card(
            child: ListTile(
              leading:  CircleAvatar(
                backgroundColor: getPriorityColor
                  (this.noteList![position].priority!.toInt()),
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text(this.noteList![position].title.toString()),
              subtitle: Text(this.noteList![position].date.toString()),
              trailing: InkWell(
                  child: Icon(Icons.delete),
                onTap: (){
                    _delete(context, noteList![position]);
                },
              ),
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>NoteDetail("Edit Notes")));

              },
            )
          );
        }

    );

  }


  //return priority color
Color getPriorityColor(int priority)
{
  switch (priority)
  {
    case 1:
      {
        return Colors.red;
        break;
      }
    case 2:
      {
        return Colors.yellow;
        break;
      }
    default:
      return Colors.yellow;
  }
}





//return the icons based on the priototy
Icon getPriotityIcon(int priority)
{
  switch (priority)
  {
    case 1:
      {
        return Icon(Icons.play_arrow);
        break;
      }

    case 2:
      {
        return Icon(Icons.keyboard_arrow_right);
        break;
      }
      default:
        return Icon(Icons.keyboard_arrow_right);
  }
}


void _delete(BuildContext context , Note note) async
{
  int result =await databaseHelper!.deleteNote(note.id!.toInt());
  if(result !=0 )
    {
      ScaffoldMessenger.of(context).
      showSnackBar(SnackBar(content: Text("Note deleted")));
    }
  updateListView();
}

  void updateListView()
  {
    final Future<Database> dbFuture = databaseHelper!.initializeDatabase();
    dbFuture.then((database)
    {
      Future<List<Note>> noteListFuture = databaseHelper!.getNoteList();

      noteListFuture.then((noteList)
      {
        setState(() {
          this.noteList= noteList;
          this.count= noteList.length;
        });

      });
    }
    );

  }











}

