import 'package:flutter/material.dart';

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(224, 118, 39, 1),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(224, 118, 39, 1),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: <Widget>[
              CustomListTile(Icons.home, 'inicio', () => {},
                  colors: Colors.blue),
              CustomListTile(Icons.pets, 'Mascotas',
                  () => Navigator.pushReplacementNamed(context, 'pets')),
              CustomListTile(Icons.account_circle, 'Mi cuenta', () => {}),
              CustomListTile(Icons.replay, 'Historial', () => {}),
              CustomListTile(Icons.phone_in_talk, 'Llamadas', () => {}),
              CustomListTile(Icons.message, 'Chat', () => {}),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(),
            ),
            _cardContent(context,
                'assets/img/productos.png',
                'Preguntas frecuentes',
                'Visita nuestras preguntas frecuentes si tienes alguna duda que pueda ser resuelta por este medio.',
                'ver',
                'frequentquestion'),
            _cardContent(context,
                'assets/img/servicios.png',
                'Servicios',
                'Veterinarios, baños y estetica y más en la puerta de tu casa.',
                'Continuar',
                ''),
            _cardContent(context,
                'assets/img/suscripcion.jpg',
                'Experiencia',
                'Mira algunos de los comentarios de nuestros usuarios.',
                'ver',
                'experiences'),
          ],
        ),
      ),
    );
  }

  Widget _cardContent(
      BuildContext context,  String imageAssetDirection, String cardTitle, String cardSubTitle, String buttonText, String pageName) {
    return Container(
        child: Card(
      child: Container(
        child: Stack(
          children: <Widget>[
            Image.asset(imageAssetDirection),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(
                    cardTitle,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  subtitle: Text(
                    cardSubTitle,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text(buttonText,
                        style: TextStyle(color: Colors.white, fontSize: 25),),
                        onPressed: () {
                          Navigator.pushNamed(context, pageName);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;
  MaterialColor colors;

  CustomListTile(this.icon, this.text, this.onTap, {this.colors});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Icon(
            icon,
            color: (colors != null ? colors : Colors.white),
            size: 60,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
