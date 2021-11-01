import 'package:codex/src/utilities/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';

class ReportesRecibidos extends StatefulWidget {
  const ReportesRecibidos({Key? key}) : super(key: key);
  @override
  _ReportesRecibidosState createState() => _ReportesRecibidosState();
}

class _ReportesRecibidosState extends State<ReportesRecibidos> {
  List lists = [];

  final _searcher = TextEditingController();
  String? validator(String? value) {
    return (value == null || value.isEmpty) ? 'Este campo es requerido' : null;
  }

  //Instancia de la base de datos
  // final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitDown,
    //   DeviceOrientation.portraitUp,
    // ]);

    //query reportes child in datbase
    final query = FirebaseDatabase.instance.reference().child('reporte');
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color(0xFFFFEBEE),
          leading: GestureDetector(
              onTap: () {
                /* Write listener code here */
              },
              child: Image.asset(
                'assets/idaip.png',
                // width: 200,
                // height: 200,
              )),
        ),
        endDrawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: const Color(0xFFFFEBEE),
          ),
          child: MyDrawer(),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    height: 30, width: MediaQuery.of(context).size.width * .65),
                child: TextFormField(
                  //controller: _searcher,
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.only(right: 10, left: 10),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Icon(Icons.search_outlined,
                          size: 24, color: Colors.red[300]),
                    ),
                    labelText: 'Buesqueda por problematica o ubicacion',
                    labelStyle: const TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 25.0),
                    ),
                  ),
                  validator: validator,
                ),
              ),
            ),
            Container(
               
                    child: StreamBuilder(
              stream: query.onValue,
              builder: (context, AsyncSnapshot<Event> snapshot) {
                if (snapshot.hasData) {
                  lists.clear();
                  DataSnapshot dataValues = snapshot.data!.snapshot;
                  Map<dynamic, dynamic> values = dataValues.value;
                  values.forEach((key, values) {
                    lists.add(values);
                  });
                  return ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: lists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.white,
                          elevation: 5,
                          child: Text(
                             'Folio: ${lists[index]['Folio']}',
                            style: TextStyle(
                              fontSize: 20,
                             
                              color: Colors.black,
                            ),
                          ),
                        )
                      ]);
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ))
          ],
        ));
  }
}
