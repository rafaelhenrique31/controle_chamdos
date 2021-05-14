import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helpdesk/cadastro.dart';
import 'package:helpdesk/dados.dart';
import 'package:helpdesk/inseir_chamados.dart';
import 'package:helpdesk/update.dart';
import 'Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpdesk/testegrid.dart';
import 'firestore.dart';


void main() async{



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
    home: Grid(),
  ));
}

