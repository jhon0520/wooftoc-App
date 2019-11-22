import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(224, 118, 39, 1),
        title:
            Text('Preguntas Frecuentes', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Color.fromRGBO(224, 118, 39, 1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(),
            ),
            Image.asset('assets/experiences/Experience1.jpeg', height: 500),
            Text('Después del baño, recomiendo el servicio.',
            style: TextStyle( color: Colors.white,
            fontSize: 20)),
            SizedBox(height: 20,),

            Image.asset('assets/experiences/Experience3.jpeg', height: 400),
            Text('Quedó muy bien aseado y su pelo bien cuidado. Excelente servicio',
            style: TextStyle( color: Colors.white,
            fontSize: 20)),
            SizedBox(height: 20,),

            Image.asset('assets/experiences/Experience4.jpeg', height: 400,
            width: 350,),
            Text('Gracias por bañar a Azucar, quedó muy bien, muchas gracias.',
            style: TextStyle( color: Colors.white,
            fontSize: 20)),
            SizedBox(height: 20,),

            Image.asset('assets/experiences/Experience2.jpeg', height: 400,
            width: 350,),
            Text('Alaska bien bañadita, definitivamente recomendado tomar el baño a domicilio.',
            style: TextStyle( color: Colors.white,
            fontSize: 20)),
            SizedBox(height: 20,),



            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}