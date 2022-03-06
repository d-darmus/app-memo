import 'package:flutter/material.dart';
import 'package:app_basis/memo/inputMemo/input_memo.dart';

class ListPage extends StatelessWidget{
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text('一覧'),
      ),
      body: Column(
        children:[
          TextButton(child:
            Row(
              children:[
                Container(alignment:Alignment.topLeft,height:70,width:20,margin:const EdgeInsets.only(right:5),color:Colors.yellow[800]),
              ]
            ),
            style:TextButton.styleFrom(
              backgroundColor: Colors.yellow[200],
              padding:const EdgeInsets.all(0),
            ),
            onPressed:(){
            Navigator.push(context,MaterialPageRoute(
              builder:(context) =>  const InputMemo()
            ));
          }),
        ],
      ),
    );
  }
}