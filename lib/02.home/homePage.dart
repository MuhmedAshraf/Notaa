import 'package:flutter/material.dart';
import 'package:notaa/sdldb.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  // List notes = [
  //   {'note': "Doing Homework at 7 pm", 'image': 'assets/images/1.jpg'},
  //   {'note': "Doing Homework at 7 pm", 'image': 'assets/images/2.jpg'},
  //   {'note': "Doing Homework at 7 pm", 'image': 'assets/images/3.jpg'},
  //   {'note': "Doing Homework at 7 pm", 'image': 'assets/images/4.jpg'},
  // ];

  Sqldb sqldb = Sqldb();

  Future<List<Map>> readData() async {
    List<Map> response = await sqldb.readData('''SELECT * FROM ('notes')''');
    return response;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
          child: ListView(
            children: [
              FutureBuilder(
                  future: readData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                          itemBuilder:(context,i){
                        return Card(
                          child: ListTile(
                            title: Text('${snapshot.data[i]['tittle']}'),
                            subtitle: Text('${snapshot.data[i]['note']}'),
                            trailing: Text('${snapshot.data[i]['color']}'),
                          ),
                        );
                      },
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      );

                    }
                    else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, 'addNote');
      }, child: Icon(Icons.add)),
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
