import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wooftoc/src/provider/addpet/AddpetProvider.dart';
import 'package:wooftoc/src/provider/login/LoginProvider.dart';
import 'dart:io';
import 'package:wooftoc/src/utils/alert.dart';

  String petName, petSize, petRace, petAge, petGender;
  String dropdownSize = 'Tamaño';
  String dropdownRace = 'Raza';
  String dropdownAge = 'Edad';
  String dropdownGender = 'Genero';
  File photo;

class NewpetPage extends StatefulWidget {
  const NewpetPage({Key key}) : super(key: key);

  @override
  _NewpetPageState createState() => _NewpetPageState();
}

class _NewpetPageState extends State<NewpetPage> {
  @override
  Widget build(BuildContext context) {

    AddpetProvider addpetProvider = Provider.of<AddpetProvider>(context);
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    LoginModel userModel = loginProvider.getLoginModel;

    return Scaffold(
      backgroundColor: Color.fromRGBO(224, 118, 39, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(224, 118, 39, 1),
        title: Text('Agregar mascota'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SafeArea(
            child: Container(),
          ),
          SizedBox(height: 10,),
          Container(child: Center(child: Image.asset('assets/img/petimage.png', height: 150,))),
          SizedBox(height: 20,),
          Text('Agregar foto', style: TextStyle(color: Colors.white, fontSize: 20)),
          SizedBox(height: 20,),
          _selectImageButton(context),
          _petNameTextField(),
          _petSizeDropDown(),
          _petRaceDropDown(),
          _petAgeDropDown(),
          _petGenderDropDown(),
          _addPetButton(context, addpetProvider, userModel),
          ],
        ),
      ),
    );
  }

  Widget _selectImageButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(218, 90, 36, 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 50.0,),
        onPressed: ()async{
          photo = await ImagePicker.pickImage(
            source: ImageSource.gallery
          );
        },
        child: Text('Seleccionar Imagen',
              style: TextStyle(color: Colors.white,
              fontSize: 20)
        ),
      ),
    );
  }

  Widget _addPetButton(BuildContext context, AddpetProvider addpetProvider, LoginModel userModel) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(218, 90, 36, 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 50.0,),
        onPressed: ()async {

          try {

            if(photo != null){
              final url =  await addpetProvider.apiRequestUploadPhoto(photo);

              addpetProvider.apiRequestAddPet(userModel.email  ,url, petName, petSize, petRace, petAge, petGender);
            }
            

          } catch (e) {
            print(e);
            showAlert(context, 'Agregar Mascota', 'En estos momentos presentamos problemas con la red.');
          }
        },
        child: Text('Agregar Mascota',
              style: TextStyle(color: Colors.white,
              fontSize: 20)
        ),
      ),
    );
  }

  Widget _petNameTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => petName=value,
        // cursorColor: ,
        style: TextStyle(
            color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Paco',
          labelText: 'Nombre',
          counterText: 'Nombre',
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

  Widget _petSizeDropDown(){
  Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width*0.90,
    child: DropdownButton<String>(
          value: dropdownSize,
          elevation: 16,
          style: TextStyle(color: Colors.brown[900]),
          underline: Container(
            height: 2,
            color: Colors.white,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownSize = newValue;
              petSize = newValue;
            });
          },
          items: <String>['Tamaño', 'Pequeño', 'Mediano', 'Grande']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
  );
}

  Widget _petRaceDropDown(){
  Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width*0.90,
    child: DropdownButton<String>(
          value: dropdownRace,
          elevation: 16,
          style: TextStyle(color: Colors.brown[900]),
          underline: Container(
            height: 2,
            color: Colors.white,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownRace = newValue;
              petRace = newValue;
            });
          },
          items: <String>['Raza', 'Otra', 'Criollo', 'Affenpinscher', 'Alano espáñol', 'American Hairless terrier', 'American Staffordshire Terrier', 'AntiguoPerro Pastor Inglés', 'Bóxer', 'Beagle', 'Bulldog Inglés',]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
  );
}

  Widget _petAgeDropDown(){
  Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width*0.90,
    child: DropdownButton<String>(
          value: dropdownAge,
          elevation: 16,
          style: TextStyle(color: Colors.brown[900]),
          underline: Container(
            height: 2,
            color: Colors.white,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownAge = newValue;
              petAge = newValue;
            });
          },
          items: <String>['Edad', 'Cachorro', 'Adulto', 'Edad madura']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
  );
}

  Widget _petGenderDropDown(){
  Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width*0.90,
    child: DropdownButton<String>(
          value: dropdownGender,
          elevation: 16,
          style: TextStyle(color: Colors.brown[900]),
          underline: Container(
            height: 2,
            color: Colors.white,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownGender = newValue;
              petGender = newValue;
            });
          },
          items: <String>['Genero', 'Macho', 'Hembra']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
  );
}
}