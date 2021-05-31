import 'dart:html';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helpdesk/funcoes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpdesk/testegrid.dart';


class Inserir extends StatefulWidget {
  @override
  _InserirState createState() => _InserirState();
}

class _InserirState extends State<Inserir> {
  final auth = FirebaseAuth.instance;

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController chamadointerno = TextEditingController();
  TextEditingController chamadosi = TextEditingController();
  TextEditingController data_abertura = TextEditingController();
  TextEditingController numeroloja = TextEditingController();
  TextEditingController problema = TextEditingController();
  TextEditingController abriu = TextEditingController();
  TextEditingController hora = TextEditingController();
  TextEditingController status = TextEditingController();

  Timestamp create;
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Grid(),
                ));
          },
          child: Icon(Icons.event_note),
        ),
        appBar: apbarlogado(),
        body: Form(
          key: _formkey,
          child: ListView(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 350,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Card(
                        elevation: 20,
                        child: Container(
                          width: 1000,
                          height: 700,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 15),
                            child: Column(
                              children: [
                                Text(
                                  'Salvar novo chamado',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    textfild('numero chamado interno',
                                        chamadointerno),
                                    Spacer(),
                                    textfild('numero chamado si', chamadosi),
                                  ],
                                ),
                                Row(
                                  children: [
                                    textfild('descreva o problema', problema),
                                    Spacer(),
                                    textfild('numero da loja', numeroloja),
                                  ],
                                ),
                                Row(
                                  children: [
                                    textfild('Status atual', status),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  width: 500,
                                  height: 80,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formkey.currentState.validate()) {
                                        send(
                                            chamadointerno.text,
                                            chamadosi.text,
                                            numeroloja.text,
                                            problema.text,
                                            status.text,
                                            create,
                                            email);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Grid()));
                                      }
                                    },
                                    child: Text('Salvar'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
