import 'package:codex/src/presentation/screens/reportes_recibidos.dart';
import 'package:codex/src/presentation/screens/seguimiento_reporte.dart';
import 'package:codex/src/utilities/button.dart';
import 'package:codex/src/utilities/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
        body: Center(
            child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'IDAIP\nPor tu derecho a saber',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ])),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  const Text('Recursos',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26, color: Colors.black)),
                  const SizedBox(height: 20),
                  ButtonCustomized(
                    text: 'Realizar un reporte',
                    // imagePath: 'assets/google.png',
                    color: const Color(0XFFFF8A65),
                    textColor: Colors.black,
                    onTap: () => null,
                  ),
                  const SizedBox(height: 30),
                  ButtonCustomized(
                    text: 'Seguimiento reporte',
                    // imagePath: 'assets/google.png',
                    color: const Color(0XFFFF8A65),
                    textColor: Colors.black,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Seguimiento()),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ButtonCustomized(
                    text: 'Reportes recibidos',
                    // imagePath: 'assets/google.png',
                    color: const Color(0XFFFF8A65),
                    textColor: Colors.black,
                    onTap: () => 
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ReportesRecibidos()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}

