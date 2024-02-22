import 'package:flutter/material.dart';
import 'package:notaa/03.curd/editnote.dart';
import 'package:notaa/sdldb.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List notes = [
  Sqldb sqldb = Sqldb();

  List notes = [];

  bool isLooding = true;

  Future readData() async {
    //List<Map> response = await sqldb.readData('''SELECT * FROM ('notes')''');
    List<Map> response = await sqldb.read("notes");
    notes.addAll(response);
    if (this.mounted) {
      setState(() {});
    }
    isLooding = false;
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: isLooding
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: ListView(
              children: [
                ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        title: Text('${notes[i]['tittle']}'),
                        subtitle: Text('${notes[i]['note']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () async {
                                // int response = await sqldb.deleteData(
                                //     "DELETE FROM notes WHERE id = ${notes[i]['id']}");
                                int response = await sqldb.delete("notes", "id = ${notes[i]['id']} ");
                                if (response > 0) {
                                  notes.removeWhere(
                                      (element) => element['id'] == notes[i]['id']);
                                  setState(() {});
                                }
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                              onPressed: ()  {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> EditNote(
                                  note:  '${notes[i]['note']}',
                                  tittle:'${notes[i]['tittle']}' ,
                                  color: '${notes[i]['color']}',
                                  id: '${notes[i]['id']}',
                                )));

                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                )
              ],
            )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'addNote');
          },
          child: Icon(Icons.add)),
    );
  }
}

// class ListNotes extends StatelessWidget {
//   final notes;
//
//   ListNotes({required this.notes});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Row(
//         children: [
//           Expanded(child: Image.asset('${notes['image']}', fit: BoxFit.fill,),
//             flex: 1,),
//           Expanded(
//             flex: 3,
//             child: ListTile(
//               title: Text('tittle'),
//               subtitle: Text('${notes['note']}'),
//               trailing: IconButton(icon: Icon(Icons.edit), onPressed: () {},),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
