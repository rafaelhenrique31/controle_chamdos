import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helpdesk/funcoes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpdesk/testegrid.dart';
import 'package:date_format/date_format.dart';
import 'package:helpdesk/Home.dart';

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

  //DateTime create ;



  String email;
  @override
  Widget build(BuildContext context) {
    var create ;


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
        appBar:  AppBar(
          backgroundColor: Color(0xffff1100),
          leading:Row(children: [ SizedBox(width: 5,),Image.network('https://pbs.twimg.com/profile_images/1264981548643778560/KrtoA4i1.png',width: 50,fit: BoxFit.fill,),],),
          title: Text('controle de chamados na S&I'.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 20),),
          actions: [
            Center(
                child: Row(
                  children: [
                    Text('usuario logado.:  ' + FirebaseAuth.instance.currentUser.email,),
                    IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){
                      FirebaseAuth.instance.signOut();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                    })
                  ],
                )
            )
          ],

        ),
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

