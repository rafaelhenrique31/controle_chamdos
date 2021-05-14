import 'dart:async';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpdesk/funcoes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpdesk/update.dart';
import 'inseir_chamados.dart';
import 'update.dart';
import 'chamado.dart';
class Grid extends StatefulWidget {


  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  TextEditingController status = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<Chamado> items;
  clearAll(){
    status.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Form(child:
    Scaffold(
      key: formKey,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.menu),
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Inserir(),));},
        ),
        appBar: apbar(),
        body:
        Padding(
          padding: const EdgeInsets.only(right: 16,left: 16,top: 8),
          child: Container(
            child: StreamBuilder<QuerySnapshot>(
              stream: mostrar(),
              builder: (context , snapshot){
                switch (snapshot.connectionState){
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    List<DocumentSnapshot> documentos= snapshot.data.docs;
                    return GridView.builder(
                        reverse: false,
                        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: 400,
                        ),
                        itemCount: documentos.length,
                        itemBuilder:(context , index) {
                          return  Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Card(
                                      elevation: 15,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                        ),
                                        height: 350,
                                        width: 450,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('abertura chamado :  ' +documentos[index].data()['numeroloja'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                              Spacer(),
                                              Text('numero loja : '+documentos[index].data()['chamado_interno'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                              Spacer(),
                                              Text('chamado interno : '+documentos[index].data()['problema'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                              Spacer(),
                                              Text('chamado si : '+documentos[index].data()['quem abriu'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                              Spacer(),
                                              Text('quem abriu : '+documentos[index].data()['data'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                              Spacer(),
                                              Text('descreva o problema : '+documentos[index].data()['chamado_si'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                              Spacer(),
                                              Text('hora :'+documentos[index].data()['status'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                              Spacer(),
                                              Text('status: '+documentos[index].data()['hora'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,),),
                                              SizedBox(height: 15,),
                                              SizedBox(
                                                width: 300,
                                                height: 50,
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    hintText: 'atualize o status',
                                                    hintStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,fontFamily:'Montserrat',),
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(5),
                                                      borderSide: BorderSide(
                                                          color: Colors.red,
                                                          width: 5
                                                      ),
                                                    ),
                                                  ),
                                                  controller: status,
                                                  onFieldSubmitted: clearAll(),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  IconButton(icon: Icon(Icons.drive_file_rename_outline), onPressed: (){
                                                    attstatus(documentos[index],status.text);
                                                  }),
                                                  SizedBox(width: 15,),
                                                  IconButton(icon: Icon(Icons.delete,color: Colors.red,), onPressed: (){deleta(context,documentos[index],index);}),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                    );
                }
              },
            ),
          ),
        )
    )
    );
  }
}

