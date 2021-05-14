import 'dart:html';
import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpdesk/chamado.dart';
import 'package:helpdesk/dados.dart';
import 'package:helpdesk/testegrid.dart';
import 'package:helpdesk/update.dart';

apbar(){
  return AppBar(
    backgroundColor: Color(0xffff1100),
    leading:Row(children: [ SizedBox(width: 5,),Image.network('https://pbs.twimg.com/profile_images/1264981548643778560/KrtoA4i1.png',width: 50,fit: BoxFit.fill,),],),
    title: Text('controle de chamados na S&I'.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 20),),
    actions: [
      Align(alignment: Alignment.center,child: Text('pesquise o numero da os'.toUpperCase()),),
      SizedBox(width: 15,),
      Center(
        child: SizedBox(
          width: 200,
          child: TextField(
          ),
        ),
      ),
      IconButton(icon: Icon(Icons.search), onPressed: (){}),
      Align(alignment: Alignment.center,child: Text('pesquise o numero do chamado intero '.toUpperCase()),),
      SizedBox(width: 15,),
      Center(
        child: SizedBox(
          width: 200,
          child: TextField(
          ),
        ),
      ),
      IconButton(icon: Icon(Icons.search), onPressed: (){}),
      SizedBox(width: 50,),
    ],
  );
}

campo(String texto){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
            color: Colors.black,
            width: 2
        ),
        right: BorderSide(
          color: Colors.black,
          width: 2,
        ),left: BorderSide(
          color: Colors.black,
          width: 2,
        ),top: BorderSide(
          color: Colors.black,
          width: 2,
        ),
      ),
    ),
    height: 80,
    width: 230,
    child: Center(
      child: Text(texto,style: TextStyle(color: Colors.black,fontSize: 18),),
    ),
  );
}


campo2(){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
            color: Colors.black,
            width: 2
        ),
        right: BorderSide(
          color: Colors.black,
          width: 2,
        ),left: BorderSide(
        color: Colors.black,
        width: 2,
      ),top: BorderSide(
        color: Colors.black,
        width: 2,
      ),
      ),
    ),
    height: 150,
    width: 300,
    child: Center(
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    ),
  );
}


atri(String dado){
  return Container(
      height: 80,
      width: 220,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Colors.black,
              width: 2
          ),
          right: BorderSide(
            color: Colors.black,
            width: 2,
          ),left: BorderSide(
          color: Colors.black,
          width: 2,
        ),top: BorderSide(
          color: Colors.black,
          width: 2,
        ),
        ),
      ),
      child: Center(
        child: Text(dado),
      )
  );
}

lateral(){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        color: Color(0xffcc2727),
        height: 900,
        width: 50,
        child: Column(
          children: [
            IconButton(icon: Icon(Icons.home_filled,color: Colors.white,),hoverColor: Colors.white, onPressed:(){}),
            IconButton(icon: Icon(Icons.event_note,color: Colors.white,), onPressed:(){}),
            IconButton(icon: Icon(Icons.addchart_outlined,color: Colors.white,), onPressed:(){}),
            IconButton(icon: Icon(Icons.settings,color: Colors.white,), onPressed:(){}),
            Spacer(),
            Image.network('https://pbs.twimg.com/profile_images/1264981548643778560/KrtoA4i1.png')
          ],
        ),
      ),
    ],
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

estatus(String text, var controler){
  return SizedBox(
    width: 300,
    height: 50,
    child: TextFormField(
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,fontFamily:'Montserrat',),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                color: Colors.red,
                width: 5
            ),
        ),
      ),
      controller: controler,
    ),
  );
}


// funçoes que funcionam
void send(String problema,String abriu,String numero_loja,String chamadointerno, String chamadosi, String data_abertura,String status,String hora){
  FirebaseFirestore.instance.collection('chamados')..add({'chamado_interno': chamadointerno, 'chamado_si':chamadosi,'data':data_abertura,'numeroloja':numero_loja,'problema':problema,'quem abriu':abriu,'status':status,'hora':hora});
}
Stream<QuerySnapshot> mostrar(){
  return FirebaseFirestore.instance.collection('chamados').snapshots();
}
void deleta(BuildContext context,DocumentSnapshot doc, int position) async{
  FirebaseFirestore.instance.collection('chamados').doc(doc.id).delete();
}

void attstatus(DocumentSnapshot doc, String hora){
  FirebaseFirestore.instance.collection('chamados').doc(doc.id).update({'hora':hora});
}

// ---------------------------------


void att(String problema,String abriu,String numero_loja,String chamadointerno, String chamadosi, String data_abertura,String status,String hora){
  FirebaseFirestore.instance.collection('chamados').doc('a4aNnoED54cN9ENx7Aox').set({'chamado_interno': chamadointerno, 'chamado_si':chamadosi,'data':data_abertura,'numeroloja':numero_loja,'problema':problema,'quem abriu':abriu,'status':status,'hora':hora});
}




  void navegar( DocumentReference doc) {
    FirebaseFirestore.instance.collection('chamados').doc(doc.id);
    print(doc.id);
  }

