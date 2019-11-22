import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wooftoc/src/provider/register/registerProvider.dart';
import 'package:wooftoc/src/utils/alert.dart';

String name, email, password1, password2;
int phoneNumber;

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    RegisterProvider registerProvider = Provider.of<RegisterProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(224, 118, 39, 1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SafeArea(
            child: Container(),
          ),
            SizedBox(height: 40.0),
            Text('Woof Toc', style: TextStyle(fontSize: 40, color: Colors.white),),
            SizedBox(height: 20.0),
            _basicInformationText(),
            _nameTextField(),
            _phoneField(),
            SizedBox(height: 20.0),
            _privateInformationText(),
            _emailTextField(),
            _password1TextField(),
            _password2TextField(),
            SizedBox(height: 20.0),
            _registerButton(context, registerProvider),

          ],
        ),
      ),
    );
  }
}

  Widget _basicInformationText() {
  return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          SizedBox(width: 20.0),
          Text('Información básica', 
          style: TextStyle(fontSize: 20, color: Colors.white),)
        ],
      )
    );
}

  Widget _privateInformationText() {
  return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          SizedBox(width: 20.0),
          Text('Información privada', 
          style: TextStyle(fontSize: 20, color: Colors.white),)
        ],
      )
    );
}

  Widget _nameTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.text,
        onChanged: (value) => name=value,
        // cursorColor: ,
        style: TextStyle(
            color: Colors.white),
        decoration: InputDecoration(
          
          hintText: 'Carlos Andres Zuñiga',
          labelText: 'Nombre Completo',
          counterText: 'Nombre Completo',
          counterStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white, fontSize: 15),
          hintStyle: TextStyle(color: Colors.white),

          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _phoneField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (value) => phoneNumber = int.parse(value),
        // cursorColor: ,
        style: TextStyle(
            color: Colors.white),
        decoration: InputDecoration(
          hintText: '3175489675',
          labelText: 'Número de Teléfono',
          counterText: 'Número de Teléfono',
          counterStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white, fontSize: 15),
          hintStyle: TextStyle(color: Colors.white),

          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => email = value,
        // cursorColor: ,
        style: TextStyle(
            color: Colors.white),
        decoration: InputDecoration(
          hintText: 'carlosandres@wooftoc.com',
          labelText: 'Correo electrónico',
          counterText: 'Correo electrónico',
          counterStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white, fontSize: 15),
          hintStyle: TextStyle(color: Colors.white),

          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _password1TextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        onChanged: (value) => password1 = value,
        // cursorColor: ,
        style: TextStyle(
            color: Colors.white),
        decoration: InputDecoration(
          hintText: '******',
          labelText: 'Contraseña',
          counterText: 'Contraseña',
          counterStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white, fontSize: 15),
          hintStyle: TextStyle(color: Colors.white),

          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _password2TextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        onChanged: (value) => password2 = value,
        // cursorColor: ,
        style: TextStyle(
            color: Colors.white),
        decoration: InputDecoration(
          hintText: '******',
          labelText: 'Repetir contraseña',
          counterText: 'Repetir contraseña',
          counterStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white, fontSize: 15),
          hintStyle: TextStyle(color: Colors.white),

          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _registerButton(BuildContext context, RegisterProvider registerProvider) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(218, 90, 36, 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 50.0,),
        onPressed: ()async {
          Navigator.of(context, rootNavigator: true).pop('login');

          try {

            if(password1 == password2){
              
              RegisterModel response = await registerProvider.apiRequest(name, phoneNumber, email, password1);
              
              if(response.response){
               Navigator.pushReplacementNamed(context, 'principal');
              }else{
                showAlert(context, 'Registro', 'Credenciales ingresadas incorrectas');
              }
            }else{
              showAlert(context, 'Registro', 'Contraseñas incorrectas');
            }

          } catch (e) {
            showAlert(context, 'Registro', 'En estos momentos presentamos problemas con la red.');
          }
        },
        child: Text('Registrate',
              style: TextStyle(color: Colors.white,
              fontSize: 20)
        ),
      ),
    );
  }

