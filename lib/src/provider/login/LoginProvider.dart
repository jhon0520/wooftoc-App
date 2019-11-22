
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wooftoc/src/model/loginModel/LoginModel.dart';


export 'package:wooftoc/src/model/loginModel/LoginModel.dart';

class LoginProvider extends ChangeNotifier{

  LoginModel _loginModel;
  http.Response _response;

  get getLoginModel => _loginModel;

  set setLoginModel(LoginModel newLoginModel){
    _loginModel = newLoginModel;
    notifyListeners();
  }

  String url = 'http://157.230.83.235:3000/api/validateUser';

  Future<LoginModel> apiRequest (String email, String password) async{

    dynamic jsonRequest = {
	    "email": email,
	    "password": password,
    };

    _response = await http.post(url, body: jsonRequest);

    if(_response.statusCode != 200){
      if(_response.statusCode == 404){
        _loginModel = LoginModel(response: false, message: null);
        return _loginModel;
      }      
    }

    _loginModel = loginModelFromJson(_response.body);
    _loginModel.setResponse = true;
    return _loginModel;

  }

  String biciapp (String a, String b){
    return a + b;
  }
}