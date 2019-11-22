import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

class RegisterModel {
    String id;
    String name;
    int phone;
    String email;
    int v;

    bool response;
    String message;

    set setResponse (bool newResponse){
      this.response = newResponse;
    }

    RegisterModel({
        this.id,
        this.name,
        this.phone,
        this.email,
        this.v,

        this.response,
        this.message
    });

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        id: json["_id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "__v": v,
    };
}
