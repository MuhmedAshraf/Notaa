import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  List notes = [
    {'note': "Doing Homework at 7 pm", 'image': 'assets/images/1.jpg'},
    {'note': "Doing Homework at 7 pm", 'image': 'assets/images/2.jpg'},
    {'note': "Doing Homework at 7 pm", 'image': 'assets/images/3.jpg'},
    {'note': "Doing Homework at 7 pm", 'image': 'assets/images/4.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        child: ListView.builder(
            itemBuilder: (context, i) => Dismissible(
              key: Key('$i'),
              child: ListNotes(
                    notes: notes[i],
                  ),
            ),
          itemCount: notes.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () { Navigator.pushNamed(context, 'addNote'); },child: Icon(Icons.add)),
    );
  }
}

class ListNotes extends StatelessWidget {
  final notes;

  ListNotes({required this.notes});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(child: Image.asset('${notes['image']}',fit: BoxFit.fill,),flex: 1,),
          Expanded(
            flex: 3,
            child: ListTile(
              title: Text('tittle'),
              subtitle: Text('${notes['note']}'),
              trailing: IconButton(icon: Icon(Icons.edit) ,onPressed: (){},),
            ),
          ),
        ],
      ),
    );
  }
}
