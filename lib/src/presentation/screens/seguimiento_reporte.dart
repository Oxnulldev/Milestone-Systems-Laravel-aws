import 'package:codex/src/presentation/screens/stepper.dart';
import 'package:codex/src/utilities/drawer.dart';
import 'package:flutter/material.dart';

class Seguimiento extends StatefulWidget {
  const Seguimiento({Key? key}) : super(key: key);
  @override
  _SeguimientoState createState() => _SeguimientoState();
}

class _SeguimientoState extends State<Seguimiento> {
  final _emailController = TextEditingController();
  String? validator(String? value) {
    return (value == null || value.isEmpty) ? 'Este campo es requerido' : null;
  }

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
              // height: 200,Container
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Puedes dar seguimiento\na tu reporte',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 45,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  width: MediaQuery.of(context).size.width * .85),
              child: TextFormField(
                controller: _emailController,
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
                        size: 34, color: Colors.red[300]),
                  ),
                  labelText: 'Buesqueda por Folio de reporte',
                  labelStyle: const TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 15.0),
                  ),
                ),
                validator: validator,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0XFFFF8A65),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  StepperPart()),
                  );
                },
                child: const Text(
                  'Consultar',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
