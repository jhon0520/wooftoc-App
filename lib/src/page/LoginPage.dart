import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wooftoc/src/provider/login/LoginProvider.dart';
import 'package:wooftoc/src/utils/alert.dart';

String userName;
String passWord;

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(224, 118, 39, 1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SafeArea(
            child: Container(),
          ),
            _imageLogin(size),
            // SizedBox(height: 40.0),
            Text('Woof Toc', style: TextStyle(fontSize: 40, color: Colors.white),),
            SizedBox(height: 20.0),
            _userTextField(),
            SizedBox(height: 20.0),
            _passwordTextField(),
            SizedBox(height: 20.0),
            _loginButton(context, loginProvider),
            SizedBox(height: 20.0),
            _registerText(context),
          ],
        ),
      ),
    );
  }

  Widget _imageLogin(Size size){
    return Container(
      child: Image.asset('assets/img/wooftoclogin.png', 	
      height: size.height/4,
      width: size.width/2,
      )
    );
  }

  Widget _userTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => userName=value,
        // cursorColor: ,
        style: TextStyle(
            color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(Icons.account_circle,
              color: Colors.white,
              size: 50.0),
          hintText: 'ejemplo@correo.com',
          labelText: 'Usuario',
          counterText: 'Usuario',
          counterStyle: TextStyle(
              color: Colors.white),
          labelStyle: TextStyle(
              color: Colors.white),
          hintStyle: TextStyle(
              color: Colors.white),

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

  Widget _passwordTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        onChanged: (value) => passWord=value,
        // cursorColor: ,
        style: TextStyle(
            color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(Icons.lock_outline,
              color: Colors.white,
              size: 50.0),
          hintText: '******',
          labelText: 'Contraseña',
          counterText: 'Contraseña',
          counterStyle: TextStyle(
              color: Colors.white),
          labelStyle: TextStyle(
              color: Colors.white),
          hintStyle: TextStyle(
              color: Colors.white),

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

  Widget _loginButton(BuildContext context, LoginProvider loginProvider) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(218, 90, 36, 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 50.0,),
        onPressed: ()async {

          try {
            LoginModel response = await loginProvider.apiRequest(userName, passWord);

              if(response.response){
               Navigator.pushReplacementNamed(context, 'principal');
              }else{
                 showAlert(context, 'Login', 'Credenciales ingresadas incorrectas');
              }

          } catch (e) {
            print(e);
            showAlert(context, 'Login', 'En estos momentos presentamos problemas con la red.');
          }
        },
        child: Text('Ingresar',
              style: TextStyle(color: Colors.white,
              fontSize: 20)
        ),
      ),
    );
  }

  Widget _registerText(BuildContext context){
    return Container(
      child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('No tienes cuenta?',
                style: TextStyle(
                  color: Colors.white
                )),
            FlatButton(
              color: Colors.transparent,
              textColor: Colors.white,
              child: Text('Registrate'),
              onPressed: () {
              Navigator.pushNamed(context, 'register');
              },
            ),
          ],
        ),
      ],
      )
    );
  }

}