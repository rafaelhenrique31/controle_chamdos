import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duration/duration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpdesk/Home.dart';
import 'package:helpdesk/chamado.dart';
import 'package:helpdesk/testegrid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:helpdesk/update.dart';


apbar(){
  return AppBar(
    backgroundColor: Color(0xffff1100),
    leading:Row(children: [ SizedBox(width: 5,),Image.network('https://pbs.twimg.com/profile_images/1264981548643778560/KrtoA4i1.png',width: 50,fit: BoxFit.fill,),],),
    title: Text('controle de chamados na S&I'.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 20),),
  );
}

textfild(String text, var controler){
  return SizedBox(
    width: 300,
    height: 100,
    child: TextFormField(
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
            )
        ),
      ),
      controller: controler,
      validator: (value){
        if(value.isEmpty){
          return 'o campo nao pode ser vazio';
        }
        return null;
      },
    ),
  );
}
textfildatt(String text, var controler,String label){
  return SizedBox(
    width: 300,
    height: 100,
    child: TextFormField(
      decoration: InputDecoration(
        hintText: text,
        labelText: label ,
        hintStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
            )
        ),
      ),
      controller: controler,
      validator: (value){
        if(value.isEmpty){
          return 'o campo nao pode ser vazio';
        }
        return null;
      },
    ),
  );
}
// var now=DateTime.now();
//   var sixtyDaysFromNow = now.add(const Duration(minutes: 1));
// funçoes que funcionam
void send(String problema,String numero_loja,String chamadointerno, String chamadosi,String status,DateTime create, String email, DateTime duracao){
  FirebaseFirestore.instance.collection('chamados')..add({'chamado_interno': chamadointerno, 'chamado_si':chamadosi,'numeroloja':numero_loja,
    'problema':problema,
    'status':status,'create': DateFormat.yMMMMEEEEd().add_jm().format(DateTime.now()).toString(), 'email': FirebaseAuth.instance.currentUser.email, 'duracao':DateFormat.yMMMMEEEEd().add_jm().format(DateTime.now().add(hours(8)))});
}
Stream<QuerySnapshot> mostrar(){
  return FirebaseFirestore.instance.collection('chamados').orderBy('create',descending: true).snapshots();
}
void deleta(BuildContext context,DocumentSnapshot doc, int position) async{
  FirebaseFirestore.instance.collection('chamados').doc(doc.id).delete();
}

Stream<QuerySnapshot> mostrar_encerrado(){
  return FirebaseFirestore.instance.collection('chamados').orderBy('create',descending: true).snapshots();
}

// ---------------------------------

void chamado_encerrado(DocumentReference ref){
  FirebaseFirestore.instance.collection('chamados_encerrado').doc(ref.id).set({});
}


void teste(DocumentReference doc){
  FirebaseFirestore.instance.collection('chamados').doc(doc.id).collection('encerrado');
}
