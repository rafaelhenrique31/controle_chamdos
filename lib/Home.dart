import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpdesk/cadastro.dart';
import 'package:helpdesk/testegrid.dart';
import 'funcoes.dart';
import 'cadastro.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  final auth = FirebaseAuth.instance;
  String senha, email;
  final Formkey = GlobalKey<FormState>();

  checkFilds(){
    final form = Formkey.currentState;
    if (form.validate()){
      return true;
    } else {
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apbar(),
      body: Form(
        key: Formkey,
        child: Center(
          child: Container(
            child: Card(
              elevation: 15,
              child: Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text('faça seu login'.toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 30,),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'digite seu e-mail'.toUpperCase(),labelStyle: TextStyle(color: Colors.black,fontSize: 15),
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value){
                          if(value.isEmpty){
                            return 'o campo nao pode ser vazio';
                          }
                          return null;
                        },
                        onChanged: (value){
                          this.email=value;
                        },

                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'digite sua senha'.toUpperCase(),labelStyle: TextStyle(color: Colors.black,fontSize: 15),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.security,),

                        ),
                        validator: (value){
                          if(value.isEmpty){
                            return 'o campo nao pode ser vazio';
                          }
                          return null;
                        },
                        onChanged: (value){
                          this.senha=value;
                        },
                      ),
                      SizedBox(height: 50,),
                      SizedBox(width: 500,
                      ),
                     SizedBox(width: 500,height: 40,
                     child: ElevatedButton(
                       child: Text('Fazer Login'),
                       onPressed: (){
                         auth.signInWithEmailAndPassword(email: email, password: senha).then((_){
                           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Grid()));
                         });
                       },
                     ),
                     ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 200,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Cadastro()));
                                },
                                child: Text('Nao tenho conta'),
                              ),
                            ),
                            Spacer(),
                            SizedBox(width: 200,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: (){},
                                child: Text('esqueci minha senha'),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ),
      ),
    );
  }
}
