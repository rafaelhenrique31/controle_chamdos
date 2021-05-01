import 'package:flutter/material.dart';
import 'package:helpdesk/cadastro.dart';
import 'Home.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main(){
  final auth = FirebaseAuth.instance;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme : ThemeData (
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xfffa0c00)
          )
        )
    ),
    home: Cadastro(),
  ));
}

