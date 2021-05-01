import 'package:flutter/material.dart';
import 'package:helpdesk/Home.dart';
import 'funcoes.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}
final auth = FirebaseAuth.instance;
class _CadastroState extends State<Cadastro> {
  

  GlobalKey <FormState> _formkey = GlobalKey<FormState>();
  String NomeCadastro, emailCadastro, senhaCadastro;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: apbar(),
      body: Form(
        key: _formkey,
        child: Center(
          child: Card(
            elevation: 15,

            child: Container(
              width: 800,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('Crie sua conta',style: TextStyle(color: Colors.white,fontSize: 30),),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'digite seu nome'.toUpperCase(),labelStyle: TextStyle(color: Colors.black,fontSize: 15),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.drive_file_rename_outline,),

                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return 'o campo nao pode ser vazio';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15,),
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
                        setState(() {
                          emailCadastro = value.trim();
                        });
                      },

                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'digite sua senha'.toUpperCase(),labelStyle: TextStyle(color: Colors.black,fontSize: 15),
                        prefixIcon: Icon(Icons.security),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return 'o campo nao pode ser vazio';
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() {
                          senhaCadastro = value.trim();
                        });
                      },

                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirme sua senha'.toUpperCase(),labelStyle: TextStyle(color: Colors.black,fontSize: 15),
                        prefixIcon: Icon(Icons.security),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return 'o campo nao pode ser vazio';
                        }
                        return null;
                      },
                      onChanged: (value){
                        setState(() {
                          senhaCadastro = value.trim();
                        });
                      },

                    ),
                    SizedBox(height: 15,),
                    SizedBox(
                      width: 650,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: (){
                            auth.createUserWithEmailAndPassword(email: emailCadastro, password: senhaCadastro).then((_){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
                            });
                          }, child: Text('SALVAR CADASTRO',style: TextStyle(fontSize: 20),)),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}
