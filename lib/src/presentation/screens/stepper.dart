import 'package:codex/src/utilities/drawer.dart';
import 'package:flutter/material.dart';


class StepperPart extends StatefulWidget {
  StepperPart() : super();

  final String title = "Stepper Demo";

  @override
  StepperPartState createState() => StepperPartState();
}

class StepperPartState extends State<StepperPart> {

  var _index = 0;
  

    Widget _builderStep() => Container(
        margin: const EdgeInsets.only(top: 10),
        
        child: Stepper(
          steps: const [
            Step(
              title: Text("Enviado", style: TextStyle(color: Colors.black, fontSize: 20), ),
              content: Text("Reporte enviado."),
              isActive: true,
              state: StepState.complete,
            ),
            Step(
              title: Text("Recibido"),
              content: Text("Status: En espera."),
            ),
            Step(
              title: Text("En revision"),
              content: Text("Status: En espera."),
            ),
            Step(
              title: Text("Resolucion"),
              content: Text("Status: En espera."),
            ),
          ],
          currentStep: _index,
          onStepTapped: (index) {
            setState(() {
              _index = index;
            });
          },
          controlsBuilder: (BuildContext context,
                  { 
                    onStepContinue, 
                    onStepCancel
                    }) => Container(),
        ),
      );


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Appbar
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


      // SideMenu
       endDrawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xFFFFEBEE),
        ),
        child: MyDrawer(),
      ),


      // Body
      body: Column(
      children: [
      SizedBox(height: 20),
      Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.topLeft,
        child: Text("Folio: MnDKVJAfum01x7P-koL",textAlign: TextAlign.left, style: TextStyle(fontSize: 20,  color: Colors.black),),
      ),
      Container(
        padding: const EdgeInsets.only(left:48),
        child: Theme(
          data: ThemeData(
           colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF00BFA5),
            ),
          ),
          
        
          child:  Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _builderStep(),
          ],
        ),
        )
       
       
        ),
      ],
      ),
      
    );
    
  }

  
}

