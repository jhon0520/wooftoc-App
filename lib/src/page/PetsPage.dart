import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wooftoc/src/provider/login/LoginProvider.dart';

class PetsPage extends StatelessWidget {
  const PetsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    LoginModel userModel = loginProvider.getLoginModel;

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
              CustomListTile(Icons.home,'inicio',()=>Navigator.pushReplacementNamed(context, 'principal')),
              CustomListTile(Icons.pets,'Mascotas',()=>{}, colors: Colors.blue),
              CustomListTile(Icons.account_circle,'Mi cuenta',()=>{}),
              CustomListTile(Icons.replay,'Historial',()=>{}),
              CustomListTile(Icons.phone_in_talk,'Llamadas',()=>{}),
              CustomListTile(Icons.message,'Chat',()=>{}),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: (userModel.pets.length != 0) ? havePets(userModel) : nullPets(context),
        ),
      ),
    );
  }
}

List<Widget> nullPets(BuildContext context) {
  return <Widget>[
            SafeArea(
            child: Container(),
          ),
          
          SizedBox(height: 100,),
          Container(child: Center(child: Image.asset('assets/img/pets.png', height: 150,))),
          SizedBox(height: 100,),
          Text('¡Ouch!', style: TextStyle(color: Colors.brown[900], fontSize: 20)),
          
          SizedBox(height: 20,),
          Text('Aún no has agregado nada aquí', style: TextStyle(color: Colors.brown[900], fontSize: 20)),
          SizedBox(height: 20,),
          _registerPetButton(context)
          ];
}

List<Widget> havePets(LoginModel userModel) {
  return <Widget>[
            SafeArea(
            child: Container(),
          ),
          
          Card(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Image.asset('assets/img/pets.png', height: 150,),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          title: Text('Crear suscripción', style: TextStyle(color: Colors.white, fontSize: 30),),
                          subtitle: Text('te hacemos la vida más fácil, escoge los productos, la frecuencia de entreha u despreocúpate.',
                                    style: TextStyle(color: Colors.white, fontSize: 15),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ];
}


class CustomListTile extends StatelessWidget{

  IconData icon;
  String text;
  Function onTap;
  MaterialColor colors;

  CustomListTile(this.icon, this.text, this.onTap,{this.colors});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20,),
          Icon(icon, color: (colors!=null? colors:Colors.white), size: 60,),
          Text(text, style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}

Widget _registerPetButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(218, 90, 36, 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 50.0,),
        onPressed: (){
          Navigator.pushNamed(context, 'newpet');
        },
        child: Text('Agregar mascota',
              style: TextStyle(color: Colors.white,
              fontSize: 20)
        ),
      ),
    );
  }