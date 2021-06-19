import 'package:flutter/material.dart';
import 'package:helpdesk/funcoes.dart';

import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'testegrid.dart';
class encerrado extends StatefulWidget {

  final Map data;
  final DocumentReference ref;
  String probrema,quem,loja,chamado_interno,chamado_si,status,create;
  encerrado(this.data,this.ref,this.probrema,this.quem,this.loja,this.status,this.chamado_si,this.chamado_interno,this.create);

  @override
  _encerradoState createState() => _encerradoState();
}
class _encerradoState extends State<encerrado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.status),
          Text(widget.quem),
          Container(
            child:Text(widget.loja),
          )
  ]
    ));
  }
}
