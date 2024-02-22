import 'package:flutter/material.dart';

import '../02.home/homePage.dart';
import '../sdldb.dart';

class EditNote extends StatefulWidget {
  final note;
  final tittle;
  final color;
  final id;

  const EditNote({Key? key, this.note, this.tittle, this.color, this.id})
      : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController tittle = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController color = TextEditingController();
  Sqldb sqldb = Sqldb();

  @override
  void initState() {
    note.text = widget.note;
    tittle.text = widget.tittle;
    color.text = widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        //     int response = await sqldb.updateData('''
                        // UPDATE notes SET note = "${note.text}", tittle = "${tittle.text}", color = "${color.text}"  WHERE id = ${widget.id}''');
                        int response = await sqldb.update(
                            "notes",
                            {
                              "note": "${note.text}",
                              "tittle": "${tittle.text}",
                              "color": "${color.text}"
                            },
                            "id = ${widget.id}");
                        if (response > 0) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                              (route) => false);
                        }
                      },
                      color: Colors.blue,
                      child: Text('Edit Note'),
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
