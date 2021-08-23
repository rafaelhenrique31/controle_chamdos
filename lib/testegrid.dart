import 'dart:async';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:helpdesk/Home.dart';
import 'package:helpdesk/chamado_encerrado.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpdesk/update.dart';
import 'inseir_chamados.dart';
import 'update.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Grid extends StatefulWidget {
  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {

 TextEditingController status = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
   return Form(child:
    Scaffold(
      key: formKey,
        floatingActionButton: SpeedDial(
          icon: Icons.menu,
          activeIcon: Icons.menu,
          buttonSize: 56.0,
          visible: true,
          closeManually: false,
          renderOverlay: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.2,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 8.0,
          children: [
            SpeedDialChild(
              child: IconButton(icon :(Icon(Icons.add)),onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Inserir(),));
              }),
              backgroundColor: Colors.red,
              label: 'Inserir Chamado',
              labelStyle: TextStyle(fontSize: 18.0),
            ),
            SpeedDialChild(
              child: IconButton(icon:(Icon(Icons.close)), onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => encerrado(),));
              },),
              backgroundColor: Colors.blue,
              label: 'Vetificar chamados encerrados',
              labelStyle: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      appBar: AppBar(
              backgroundColor: Color(0xffff1100),
              leading:Row(children: [ SizedBox(width: 5,),Image.network('https://pbs.twimg.com/profile_images/1264981548643778560/KrtoA4i1.png',width: 50,fit: BoxFit.fill,),],),
              title: Text('controle de chamados na S&I'.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 20),),
              actions: [
                Center(
                    child: Row(
                      children: [
                        Text('usuario logado:  ' + FirebaseAuth.instance.currentUser.email,),
                        SizedBox(width: 20,),
                        IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){
                          FirebaseAuth.instance.signOut();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                        })
                      ],
                    )
                )
              ],
        ),
        body:
       Container(
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('chamados em aberto'.toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 30),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 800,
                    child: StreamBuilder<QuerySnapshot>(
                      stream:FirebaseFirestore.instance.collection('chamados').where('stExcluido',isEqualTo: 0).orderBy('create',descending: true).snapshots(),
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
                                  crossAxisCount: 2,
                                  mainAxisExtent: 400,
                                ),
                                itemCount: documentos.length,
                                itemBuilder:(context , index) {
                                  Map data = snapshot.data.docs[index].data();
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
                                                  padding: const EdgeInsets.all(15),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        height: 70,
                                                        width: 400,
                                                        child: Image.asset('imagens/rede.png'),
                                                      ),
                                                      SizedBox(height: 5,),
                                                      Text('Numero Da Loja : '+documentos[index].data()['chamado_interno'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                      Spacer(),
                                                      Text('Chamado Interno : '+documentos[index].data()['problema'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                      Spacer(),
                                                      Text('Numero da OS : '+documentos[index].data()['numeroloja'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                      Spacer(),
                                                      Text('Descreva o Problema : '+documentos[index].data()['chamado_si'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                      Spacer(),
                                                      Text('Status Atual: '+documentos[index].data()['status'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,),),
                                                      Spacer(),
                                                      Text('Data e Hora abertura: '+documentos[index].data()['create'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,),),
                                                      Spacer(),
                                                      Text('Previsao de atendimento: '+documentos[index].data()['duracao'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,),),
                                                      Spacer(),
                                                      Text('E-mail abertura chamado: '+documentos[index].data()['email'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,),),
                                                      SizedBox(height: 15,),
                                                     Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                IconButton(icon: Icon(Icons.drive_file_rename_outline), onPressed: (){
                                                            Navigator.push(context, MaterialPageRoute(builder: (context) => update(data, snapshot.data.docs[index].reference,documentos[index].data()['problema'],documentos[index].data()['numeroloja'],documentos[index].data()['chamado_si'],documentos[index].data()['status'],documentos[index].data()['chamado_interno'],documentos[index].data()['create']), ));
                                                          }),
                                                          SizedBox(width: 15,),
                                                          IconButton(icon: Icon(Icons.delete,color: Colors.red,), onPressed: (){
                                                            Navigator.push(context, MaterialPageRoute(builder: (context) => encerrado(),));
                                                            var teste =snapshot.data.docs[index].reference.update({'stExcluido':1});
                                                          }),
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
              ],
            ),
          ),

        )
    );
  }
}

