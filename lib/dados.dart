import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'funcoes.dart';

class Dados extends StatefulWidget {
  @override
  _DadosState createState() => _DadosState();
}

class _DadosState extends State<Dados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apbar(),
      body:
      Column(
        children: [
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: mostrar(),
            builder: (context, snapshot){
              switch (snapshot.connectionState){
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  List<DocumentSnapshot> documentos= snapshot.data.docs;
                 return ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: documentos.length,
                   itemBuilder: (context,index){
                     return Container(
                       color: Colors.red,
                       child: Column(
                         children: [
                           Container(
                             color: Colors.blue,
                             child: Row(
                               children: [
                             Container(
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
                         height: 200,
                         width: 350,
                         child: Center(
                             child: Column(
                               children: [
                                 Text('abertura chamado :'+documentos[index].data()['numeroloja']),
                                 Spacer(),
                                 Text('numero loja :'+documentos[index].data()['chamado_interno']),
                                 Spacer(),
                                 Text('chamado interno :'+documentos[index].data()['problema']),
                                 Spacer(),
                                 Text('chamado si :'+documentos[index].data()['quem abriu']),
                                 Spacer(),
                                 Text('quem abriu :'+documentos[index].data()['data']),
                                 Spacer(),
                                 Text('descreva o problema :'+documentos[index].data()['chamado_si']),
                               ],
                             )
                         ),
                       ),
                               ],
                             ),
                           )
                         ],
                       ),
                     );
                   },
                 );
              }
            },
          ),
        ),
        ],
      )
        ,);
  }
}
