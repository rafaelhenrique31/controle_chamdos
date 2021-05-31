import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpdesk/funcoes.dart';
import 'package:helpdesk/testegrid.dart';
import 'chamado.dart';
import 'testegrid.dart';
class update extends StatefulWidget {
  final Map data;
  final DocumentReference ref;
  String numeroloja;
  String numerosi;
  String status;
  String problema;
  String chamado_interno;
  update(this.data, this.ref,this.numeroloja,this.numerosi,this.problema,this.status,this.chamado_interno);

  @override
  _updateState createState() => _updateState();
}

class _updateState extends State<update> {

  GlobalKey <FormState> _formkey = GlobalKey<FormState>();

  TextEditingController chamadointerno = TextEditingController();
  TextEditingController chamadosi = TextEditingController();
  TextEditingController data_abertura = TextEditingController();
  TextEditingController numero_loja = TextEditingController();
  TextEditingController problema = TextEditingController();
  TextEditingController abriu = TextEditingController();
  TextEditingController hora = TextEditingController();
  TextEditingController status = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String ts='agua';
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Grid(),));},
          child: Icon(Icons.event_note),
        ),
        appBar: apbar(),
        // appBar: apbarlogado(),
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
                                    Column(
                                      children: [
                                        Text('numero chamado interno'.toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                                        textfild(widget.numeroloja,chamadointerno),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Text('numero chamado si'.toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                                        textfild(widget.numerosi,chamadosi),
                                      ],
                                    )
                                 ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text('problema'.toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                                        textfild(widget.problema,problema),

                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Text('numero loja'.toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                                        textfild(widget.chamado_interno,numero_loja),
                                     ],
                                    ),

                                  ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text('status'.toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                                        textfild(widget.status,status),
                                      ],
                                    ),

                                  ],
                                ),
                                SizedBox(width: 500,
                                  height: 80,
                                  child: ElevatedButton(
                                    child: Text('Salvar'),
                                    onPressed: (){
                                      if(status.text.isNotEmpty && problema.text.isNotEmpty && numero_loja.text.isNotEmpty && chamadointerno.text.isNotEmpty && chamadosi.text.isNotEmpty){
                                        FirebaseFirestore.instance.collection('chamados').doc(widget.ref.id).update({'status':status.text,'chamado_si':problema.text,'chamado_interno':numero_loja.text,'numeroloja':chamadosi.text,'problema':chamadointerno.text});
                                        Navigator.pop(context);
                                      } else if(status.text.isNotEmpty&&problema.text.isNotEmpty && numero_loja.text.isNotEmpty && chamadointerno.text.isNotEmpty && chamadosi.text.isEmpty){
                                        FirebaseFirestore.instance.collection('chamados').doc(widget.ref.id).update({'status':status.text,'chamado_si':problema.text,'chamado_interno':numero_loja.text,'numero_loja':chamadosi.text});
                                        Navigator.pop(context);
                                      } else if(status.text.isNotEmpty&&problema.text.isNotEmpty && numero_loja.text.isNotEmpty && chamadointerno.text.isEmpty && chamadosi.text.isEmpty){
                                        FirebaseFirestore.instance.collection('chamados').doc(widget.ref.id).update({'status':status.text,'chamado_si':problema.text,'chamado_interno':numero_loja.text});
                                        Navigator.pop(context);
                                      } else if(status.text.isNotEmpty&&problema.text.isNotEmpty && numero_loja.text.isEmpty && chamadointerno.text.isEmpty && chamadosi.text.isEmpty){
                                        FirebaseFirestore.instance.collection('chamados').doc(widget.ref.id).update({'status':status.text,'chamado_si':problema.text});
                                        Navigator.pop(context);
                                      } else if(status.text.isNotEmpty&&problema.text.isEmpty && numero_loja.text.isEmpty && chamadointerno.text.isEmpty && chamadosi.text.isEmpty){
                                        FirebaseFirestore.instance.collection('chamados').doc(widget.ref.id).update({'status':status.text});
                                        Navigator.pop(context);
                                      } else if(status.text.isEmpty&&problema.text.isNotEmpty && numero_loja.text.isEmpty && chamadointerno.text.isEmpty && chamadosi.text.isEmpty){
                                        FirebaseFirestore.instance.collection('chamados').doc(widget.ref.id).update({'chamado_si':problema.text});
                                        Navigator.pop(context);
                                      } else if(status.text.isEmpty&&problema.text.isEmpty && numero_loja.text.isNotEmpty && chamadointerno.text.isEmpty && chamadosi.text.isEmpty){
                                        FirebaseFirestore.instance.collection('chamados').doc(widget.ref.id).update({'chamado_interno':numero_loja.text});
                                        Navigator.pop(context);
                                      } else if(status.text.isEmpty&&problema.text.isEmpty && numero_loja.text.isEmpty && chamadointerno.text.isNotEmpty && chamadosi.text.isEmpty){
                                        FirebaseFirestore.instance.collection('chamados').doc(widget.ref.id).update({'problema':chamadointerno.text});
                                        Navigator.pop(context);
                                      } else if(status.text.isEmpty&&problema.text.isEmpty && numero_loja.text.isEmpty && chamadointerno.text.isEmpty && chamadosi.text.isNotEmpty){
                                        FirebaseFirestore.instance.collection('chamados').doc(widget.ref.id).update({'numeroloja':chamadosi.text});
                                        Navigator.pop(context);
                                      } else if(status.text.isNotEmpty&&problema.text.isEmpty && numero_loja.text.isEmpty && chamadointerno.text.isEmpty && chamadosi.text.isNotEmpty){
                                        FirebaseFirestore.instance.collection('chamados').doc(widget.ref.id).update({'status':status.text,'numeroloja':chamadosi.text});
                                        Navigator.pop(context);
                                      }
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


