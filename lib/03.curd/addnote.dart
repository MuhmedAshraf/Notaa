import 'package:flutter/material.dart';
import 'package:notaa/02.home/homePage.dart';
import 'package:notaa/sdldb.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey<FormState>();
    TextEditingController tittle = TextEditingController();
    TextEditingController note = TextEditingController();
    TextEditingController color = TextEditingController();
    Sqldb sqldb = Sqldb();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Form(
              key: formState,
              child: Column(
                children: [
                  TextFormField(
                    maxLength: 30,
                    controller: tittle,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: Text('Tittle Note'),
                      prefixIcon: Icon(Icons.note),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: note,
                    maxLength: 200,
                    maxLines: 3,
                    minLines: 1,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: Text('Note'),
                      prefixIcon: Icon(Icons.note_add),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: color,
                    maxLength: 200,
                    maxLines: 3,
                    minLines: 1,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: Text('Color'),
                      prefixIcon: Icon(Icons.color_lens_outlined),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20, left: 30, right: 30, top: 20),
                    child: MaterialButton(
                      onPressed: () async {
                        // int response = await sqldb.insertData(
                        //     'INSERT INTO notes(tittle, note, color) VALUES("${tittle.text}", "${note.text}", "${color.text}")');
                        int response = await sqldb.insert("notes", {
                          "tittle": "${tittle.text}",
                          "note": "${note.text}",
                          "color": "${color.text}"
                        });
                        print("response===========================");
                        print(response);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                            (route) => false);
                      },
                      color: Colors.blue,
                      child: Text('Add Note'),
                    ),
                  ),
                  // ElevatedButton(onPressed: (){
                  //   sqldb.deleteAll();
                  // }, child: Text('delete Database')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Padding(
//   padding: const EdgeInsets.only(bottom: 20),
//   child: MaterialButton(
//     onPressed: () {},
//     child: Text('Add Photo'),
//     color: Colors.blue,
//   ),
// ),
