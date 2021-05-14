import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpdesk/funcoes.dart';
import 'package:helpdesk/testegrid.dart';
import 'chamado.dart';
import 'testegrid.dart';
class update extends StatefulWidget {

  final Chamado produto;
  update(this.produto);

  @override
  _updateState createState() => _updateState();
}

class _updateState extends State<update> {

  GlobalKey <FormState> _formkey = GlobalKey<FormState>();

  TextEditingController chamadointerno = TextEditingController();
  TextEditingController chamadosi = TextEditingController();
  TextEditingController data_abertura = TextEditingController();
  TextEditingController numeroloja = TextEditingController();
  TextEditingController problema = TextEditingController();
  TextEditingController abriu = TextEditingController();
  TextEditingController hora = TextEditingController();
  TextEditingController status = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Grid(),));},
          child: Icon(Icons.event_note),
        ),
        appBar: apbar(),
        body: Form(
          key: _formkey,
          child: ListView(
            children: [
              Row(
                children: [
                  SizedBox(width: 350,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 20,
                        child: Container(
                          width: 1000,
                          height: 700,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16,right: 16,top: 15),
                            child: Column(
                              children: [
                                Text('Atualizar chamado',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
                                SizedBox(height: 30,),
                                Row(
                                  children: [
                                    textfild('numero chamado interno',chamadointerno),
                                    Spacer(),
                                    textfild('numero chamado si',chamadosi),
                                  ],
                                ),
                                Row(
                                  children: [
                                    textfild('data abertura',data_abertura),
                                    Spacer(),
                                    textfild('numero da loja',numeroloja),
                                  ],
                                ),
                                Row(
                                  children: [
                                    textfild('descreva o problema',problema),
                                    Spacer(),
                                    textfild('quem abriu o chamado',abriu),
                                  ],
                                ), Row(
                                  children: [
                                    textfild('hora da abertura ',hora),
                                    Spacer(),
                                    textfild('Status atual',status),
                                  ],
                                ),
                                SizedBox(width: 500,
                                  height: 80,
                                  child: ElevatedButton(
                                    child: Text('Salvar'),
                                    onPressed: (){
                                      FirebaseFirestore.instance.collection('chamados').doc(widget.produto.id).update({'status':status});
                                  },
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
        )
    );
  }
}
