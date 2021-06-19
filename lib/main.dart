import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helpdesk/cadastro.dart';
import 'package:helpdesk/chamado_encerrado.dart';
import 'package:helpdesk/inseir_chamados.dart';
import 'package:helpdesk/redefinir_senha.dart';
import 'package:helpdesk/update.dart';
import 'Home.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpdesk/testegrid.dart';
void main() async{
  initializeDateFormatting();
  Intl.defaultLocale = 'pt_BR';
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
    home: FirebaseAuth.instance.currentUser == null ? Home() : Grid(),
  ));
}

