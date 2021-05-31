import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helpdesk/funcoes.dart';

class Redefinir extends StatefulWidget {
  @override
  _RedefinirState createState() => _RedefinirState();

}
final auth = FirebaseAuth.instance;
TextEditingController email=TextEditingController();
class _RedefinirState extends State<Redefinir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apbar(),
      body: Center(
        child: Card(
          elevation: 15,
          child: Container(
            width: 700,
            height: 500,
            child: Padding(
              padding: const EdgeInsets.only(top: 50,left: 16,right: 16),
              child: Column(
                children: [
                  Text('Redefinir senha'.toUpperCase(),style: TextStyle(fontSize: 30),),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email,color: Colors.blue,
                      ),
                      hintText: 'Digite o email para redefinir a senha',
                      hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 30,),
                  SizedBox(width: 450,
                  height: 50,
                    child: ElevatedButton(onPressed: (){
                  auth.sendPasswordResetEmail(email: email.text);
                      Navigator.pop(context);
                    }, child: Text('redefinir senha')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
