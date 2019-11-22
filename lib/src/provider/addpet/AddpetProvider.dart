
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:wooftoc/src/model/loginModel/LoginModel.dart';
import 'package:wooftoc/src/provider/login/LoginProvider.dart';


export 'package:wooftoc/src/model/loginModel/LoginModel.dart';

class AddpetProvider extends ChangeNotifier{

  http.Response _response;
  // LoginModel _loginModel;

  String urlChangeUserParams = 'http://157.230.83.235:3000/api/changeUserParams';
  String urlCreatePet = 'http://157.230.83.235:3000/api/createPet';
  

  Future<String> apiRequestUploadPhoto (File image) async{

    final urlUploadPhoto = Uri.parse('https://api.cloudinary.com/v1_1/dxzqubouo/image/upload?upload_preset=ugom1ebm');
    final mimeType = mime(image.path).split('/');

    final imageUploadRequest = http.MultipartRequest(
      'POST',
      urlUploadPhoto,
    );

    final file = await http.MultipartFile.fromPath(
      'file',
      image.path,
      contentType: MediaType(mimeType[0], mimeType[1])
    );

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final response = await http.Response.fromStream(streamResponse);

    final responseData = json.decode(response.body);

    return responseData['url'];
  }

  Future<LoginModel> apiRequestAddPet (String email, String urlPhoto, String name, String size, String race, String age, String gender) async{

    final urlrequest = Uri.parse('http://157.230.83.235:3000/api/createPet');

    dynamic jsonRequest = {
      'email' : email,
      "urlPhoto": urlPhoto,
      "name" : name,
      "size" : size,
      "race" : race,
      "age" : age,
      "gender" : gender
    };

    _response = await http.post(urlrequest, body: jsonRequest);

    LoginProvider _loginModel = new LoginProvider();

    _loginModel.setLoginModel = loginModelFromJson(_response.body);
    
    return _loginModel.getLoginModel;


  }
  
}