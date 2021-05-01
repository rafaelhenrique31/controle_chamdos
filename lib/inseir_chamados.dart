import 'package:flutter/material.dart';
import 'package:helpdesk/funcoes.dart';
import 'package:helpdesk/tela_principal.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Inserir extends StatefulWidget {
  @override
  _InserirState createState() => _InserirState();
}

class _InserirState extends State<Inserir> {
  final auth = FirebaseAuth.instance;
  GlobalKey <FormState> _formkey = GlobalKey<FormState>();

  TextEditingController data = TextEditingController();
  TextEditingController numerosi = TextEditingController();
  TextEditingController chamadointerno = TextEditingController();
  TextEditingController numeroloja = TextEditingController();
  TextEditingController quemabriu = TextEditingController();
  TextEditingController problema = TextEditingController();

  DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apbar(),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.green,
                  height: 900,
                  width: 50,
                  child: Column(
                    children: [
                      IconButton(icon: Icon(Icons.home_filled,color: Colors.white,),hoverColor: Colors.white, onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Principal()));},),
                      IconButton(icon: Icon(Icons.event_note,color: Colors.white,), onPressed:(){}),
                      IconButton(icon: Icon(Icons.addchart_outlined,color: Colors.white,), onPressed:(){}),
                      IconButton(icon: Icon(Icons.settings,color: Colors.white,), onPressed:(){}),
                      Spacer(),
                      Image.network('https://pbs.twimg.com/profile_images/1264981548643778560/KrtoA4i1.png')
                    ],
                  ),
                ),
                SizedBox(width: 350,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.end,
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
                              Text('Salvar novo chamado',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
                              SizedBox(height: 30,),
                              Row(
                                children: [
                                  textfild('data abertura',data),
                                 IconButton(icon: Icon(Icons.event_note), onPressed: (){
                                   showDatePicker(context: context,
                                       initialDate: DateTime.now(),
                                       firstDate: DateTime(2021),
                                       lastDate: DateTime(2050)
                                   ).then((date){
                                     setState(() {
                                       _dateTime=date;
                                     });
                                   });

                                 }),

                                  Spacer(),
                                  textfild('numero chamado interno',chamadointerno),
                                ],
                              ),
                              Row(
                                children: [
                                  textfild('numero chamado si',numerosi),
                                  Spacer(),
                                  textfild('numero da loja',numeroloja),
                                ],
                              ),
                              Row(
                                children: [
                                  textfild('quem abriu o chamado',quemabriu),
                                  Spacer(),
                                  textfild('descreva o problema',problema),
                                ],
                              ),
                              SizedBox(width: 500,
                                height: 80,
                                child: ElevatedButton(
                                  onPressed: (){
                                    if(_formkey.currentState.validate()){
                                      FocusScope.of(context).requestFocus(FocusNode());
                                    }
                                  },
                                  child: Text('Salvar'),
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
