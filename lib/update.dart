
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpdesk/funcoes.dart';
import 'package:helpdesk/testegrid.dart';
import 'chamado.dart';
import 'testegrid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpdesk/Home.dart';
class update extends StatefulWidget {
  final DocumentReference ref;
  String numeroloja;
  String numerosi;
  String status;
  String problema;
  String chamado_interno;
  String email;
  var create;
  var duracao;
  update(this.ref,this.numeroloja,this.numerosi,this.status,this.problema,this.chamado_interno,this.email);

  @override
  _updateState createState() => _updateState();
}

class _updateState extends State<update> {

  GlobalKey <FormState> _formkey = GlobalKey<FormState>();



  var slu = const Duration(hours: 8, minutes: 0, seconds: 0);
  var slu2 = const Duration(hours: 5, minutes: 0, seconds: 0);
  @override
  Widget build(BuildContext context) {
    TextEditingController chamadointerno = TextEditingController(text: widget.chamado_interno);
    TextEditingController chamadosi = TextEditingController(text: widget.numerosi);
    TextEditingController numero_loja = TextEditingController(text: widget.numeroloja);
    TextEditingController problema = TextEditingController(text: widget.problema);
    TextEditingController status = TextEditingController(text: widget.status);
    TextEditingController email = TextEditingController(text: widget.email);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Grid(),));},
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Card(
                          elevation: 20,
                          child: Container(
                            width: 900,
                            height: 700,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16,right: 16,top: 15),
                              child: Column(
                                children: [
                                  Text('Atualizar chamado',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
                                  SizedBox(height: 30,),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text('numero chamado interno'.toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                                          textfildatt(chamadointerno),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: [
                                          Text('numero chamado si'.toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                                          textfildatt(chamadosi),
                                        ],
                                      )
                                   ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text('problema'.toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                                          textfildatt(problema),

                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: [
                                          Text('numero da loja'.toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                                          textfildatt(numero_loja),
                                       ],
                                      ),

                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text('status'.toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                                          textfildatt(status),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 500,
                                    height: 80,
                                    child: ElevatedButton(
                                      child: Text('Salvar'),
                                      onPressed: (){
                                          FirebaseFirestore.instance.collection('chamados').doc(widget.ref.id).update({'numeroloja': numero_loja.text, 'problema':problema.text,
                                            'email': email.text, 'chamado_si':chamadosi.text, 'chamado_interno':chamadointerno.text, 'stExcluido':0, 'status':status.text,
                                            });
                                          Navigator.pop(context);
                                        }
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
            ],
          ),
        )
    );
  }
}


