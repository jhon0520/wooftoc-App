
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wooftoc/src/model/registerModel/RegisterModel.dart';

export 'package:wooftoc/src/model/registerModel/RegisterModel.dart';

class RegisterProvider extends ChangeNotifier{

  RegisterModel _registerModel;
  http.Response _response;

  String url = 'http://157.230.83.235:3000/api/createUser';

  Future<RegisterModel> apiRequest (String name, int phone, String email, String password) async{

    dynamic jsonRequest = {
      "name": name,
	    "phone": phone.toString(),
	    "email": email,
	    "password": password,
    };

    _response = await http.post(url, body: jsonRequest);
    //print(_response.statusCode);
    //print(_response.body);
    if(_response.statusCode != 200){
      if(_response.statusCode == 404){
        _registerModel = RegisterModel(response: false, message: null);
        return _registerModel;
      }      
    }

    _registerModel = registerModelFromJson(_response.body);
    _registerModel.setResponse = true;
    // UserModel(response: true);
    return _registerModel;

  }

  String biciapp (String a, String b){
    return a + b;
  }
}