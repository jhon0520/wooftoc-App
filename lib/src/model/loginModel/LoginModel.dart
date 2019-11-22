// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    List<Pet> pets;
    String id;
    String name;
    int phone;
    String email;
    String password;
    int v;

    bool response;
    String message;

    set setResponse (bool newResponse){
      this.response = newResponse;
    }

    LoginModel({
        this.pets,
        this.id,
        this.name,
        this.phone,
        this.email,
        this.password,
        this.v,

        this.response,
        this.message
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        pets: List<Pet>.from(json["pets"].map((x) => Pet.fromJson(x))),
        id: json["_id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "pets": List<dynamic>.from(pets.map((x) => x.toJson())),
        "_id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "__v": v,
    };
}

class Pet {
    String id;
    String urlPhoto;
    String name;
    String size;
    String race;
    String age;
    String gender;
    int v;

    Pet({
        this.id,
        this.urlPhoto,
        this.name,
        this.size,
        this.race,
        this.age,
        this.gender,
        this.v,
    });

    factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["_id"],
        urlPhoto: json["urlPhoto"],
        name: json["name"],
        size: json["size"],
        race: json["race"],
        age: json["age"],
        gender: json["gender"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "urlPhoto": urlPhoto,
        "name": name,
        "size": size,
        "race": race,
        "age": age,
        "gender": gender,
        "__v": v,
    };
}
