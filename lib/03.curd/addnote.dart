import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              maxLength: 30,
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
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: MaterialButton(onPressed: (){},child: Text('Add Photo'),color: Colors.blue,),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20,left: 30,right: 30,top: 20),
              child: MaterialButton(onPressed: (){},child: Text('Add Note'),color: Colors.blue,),
            )

          ],
        ),
      ),
    );
  }
}
