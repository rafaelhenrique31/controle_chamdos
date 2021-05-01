import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'inseir_chamados.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'funcoes.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:apbar(),
      body: ListView(
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.green,
                  height: 900,
                  width: 50,
                  child: Column(
                    children: [
                      IconButton(icon: Icon(Icons.home_filled,color: Colors.white,),hoverColor: Colors.white, onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Principal()));},),
                      IconButton(icon: Icon(Icons.event_note,color: Colors.white,), onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Inserir()));},),
                      IconButton(icon: Icon(Icons.addchart_outlined,color: Colors.white,), onPressed:(){}),
                      IconButton(icon: Icon(Icons.settings,color: Colors.white,), onPressed:(){}),
                      Spacer(),
                      Image.network('https://pbs.twimg.com/profile_images/1264981548643778560/KrtoA4i1.png')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            campo('data abertuda do chamado'),
                            campo('numero chamado interno'),
                            campo('numero do chamado na s&i'),
                            campo('numero da loja'),
                            campo('previsão de atendimento'),
                            campo('descreva o problema'),
                            campo('quem abriu o chamado'),
                            campo('SLA'),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            campo('20/04/2021'),
                            campo('156156'),
                            campo('15151'),
                            campo('50'),
                            campo('22/04/2021'),
                            campo('pdv nao liga'),
                            campo('Rafael'),
                            campo('50%'),
                          ],
                        ),
                      ),Container(
                        child: Row(
                          children: [
                            campo('20/04/2021'),
                            campo('156156'),
                            campo('15151'),
                            campo('50'),
                            campo('22/04/2021'),
                            campo('pdv nao liga'),
                            campo('Rafael'),
                            campo('50%'),
                          ],
                        ),

                      ),

                    ],
                  ),
                ),
              ],
            ),

        ],
      ),
    );
  }
}
