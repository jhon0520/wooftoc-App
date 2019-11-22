import 'package:flutter/material.dart';

class FrequentQuestionPage extends StatelessWidget {
  const FrequentQuestionPage({Key key}) : super(key: key);

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
            titleText(context, 'Nuestra cobertura:'),
            questionText(context, 'Actualmente manejamos todo la ciudad de Cali, no manejamos sectores menores a estrato 1 y 2 de la ciudad por la seguridad de nuestros trabajadores y porque es difícil llegar a algunas zonas de la ciudad.'),
            SizedBox(height: 20,),
            titleText(context, 'COMO PUEDO HACER PARA REALIZAR UNA QUEJA, PETICIÓN O RECLAMO.'),
            questionText(context, 'Fácil, déjanos tus datos personales en la parte de sugerencias y nosotros nos comunicaremos contigo en pocos días para aclarar dudas sobre nuestros servicios queremos brindarte siempre la mejor breevedad en nuestros servicios.'),
            SizedBox(height: 20,),
            titleText(context, '¿CUÁNTO TIEMPO DEMORARÍA QUE ME TRAIGAN ALGÚN PRODUCTO A MI DOMICILIO?'),
            questionText(context, 'La demora en el tiempo depende de la agenda que tengamos en ese momento, por lo general se entrega el mismo día con  un horario no mayor a 4 horas, pero cuando ocurre algún tipo de problema llamamos al cliente para comunicarle que su pedido de productos puede tardar un poco más de las 4 horas o pactar con el usuario para ser entregado el día siguiente.'),
          ],
        ),
      ),
    );
  }

  Widget titleText(BuildContext context, String titleText) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Text(
        titleText,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
  Widget questionText(BuildContext context, String questionText) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Text(
        questionText,
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}
