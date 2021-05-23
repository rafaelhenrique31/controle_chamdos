import 'package:flutter/material.dart';
import 'funcoes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class encerrado extends StatefulWidget {

  final Map data;
  final DocumentReference ref;
  String probrema,quem,loja,chamado_interno,chamado_si,status;
  encerrado(this.data, this.ref,this.probrema,this.quem,this.loja,this.status,this.chamado_si,this.chamado_interno);



  @override
  _encerradoState createState() => _encerradoState();
}

class _encerradoState extends State<encerrado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apbar(),
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.black,
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: (){},
      ),
      body: Container(
     child: Column(
       children: [
         Container(
           height: 50,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('chamados encerrados'.toUpperCase(),style: TextStyle(fontSize: 30,color: Colors.black),)
             ],
           ),
         ),
         Container(
           height: 800,
           child: StreamBuilder<QuerySnapshot>(
             stream: chamado_encerrado(),
             builder: (context,snapshot){
               switch(snapshot.connectionState){
                 case ConnectionState.none:
                 case ConnectionState.waiting:
                   return Center(
                     child: CircularProgressIndicator(),
                   );
                 default:List<DocumentSnapshot> documentos= snapshot.data.docs;
                 return GridView.builder(
                   reverse: false,
                   gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 3,
                     mainAxisExtent: 400,
                   ),
                   itemCount: documentos.length,
                   itemBuilder: (context,index){
                     Map data = snapshot.data.docs[index].data();
                     return Column(
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
                                   width: 500,
                                   child: Padding(
                                     padding: const EdgeInsets.all(16),
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         //Text('numero loja : '+documentos[index].data()['numeroloja'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                         Text("${widget.data['problema']}",),
                                         Text("${widget.data['chamado_si']}",),
                                         Text("${widget.data['loja']}",),
                                         Text("${widget.data['chamado_interno']}",),
                                         Text("${widget.data['create']}",),
                                         Text("${widget.data['status']}",),
                                         Text("${widget.data['quem abriu']}",),
                                         Spacer(),
                                         //Text('chamado interno : '+documentos[index].data()['loja'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                         Spacer(),
                                         //Text('chamado si : '+documentos[index].data()['quem abriu'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                         Spacer(),
                                         //Text('descreva o problema : '+documentos[index].data()['chamado_interno'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                         Spacer(),
                                         // Text('quem abriu :'+documentos[index].data()['status'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                         Spacer(),
                                         // Text('statuts: '+documentos[index].data()['chamado_si'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,),),
                                         Spacer(),
                                         // Text('data e hora abertura: '+documentos[index].data()['create'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,),),
                                         SizedBox(height: 15,),
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.end,
                                           children: [
                                             IconButton(icon: Icon(Icons.drive_file_rename_outline), onPressed: (){}),
                                             SizedBox(width: 15,),
                                             IconButton(icon: Icon(Icons.delete,color: Colors.red,), onPressed: (){}),
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
                   },
                 );
               }
             },
           ),
         )

       ],
     )
      )
    );
  }
  Stream<QuerySnapshot> chamado_encerrado(){
    return FirebaseFirestore.instance.collection('chamados_encerrado').orderBy('create',descending: true).snapshots();
  }
}
