import 'package:flutter/material.dart';
// import '../libmanagement/CRUDFeatures/addStudentPage.dart';
import 'package:libmanagement/firestoreupdate/CRUDFeatures/addStudentPage.dart';
import 'package:libmanagement/firestoreupdate/CRUDFeatures/listStudentPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Flutter FireStore CRUD'),
            ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                      context,MaterialPageRoute(builder: (context) => AddStudentPage(),)
                  ),
            }, child: Text('Add', style: TextStyle(fontSize: 20.0),),
            style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
            )
          ],
        ),
      ),
      body: ListStudentPage(),
    );
  }
}
