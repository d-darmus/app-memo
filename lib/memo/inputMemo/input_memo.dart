import 'package:flutter/material.dart';

class InputMemo extends StatefulWidget{
  const InputMemo({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState(){
    return _InputMemo();
  }

}

class _InputMemo extends State<InputMemo>{
  final TextEditingController _input = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text('編集'),
      ),
      floatingActionButton:FloatingActionButton(
        child:const Text('保存'),
        onPressed: (){},
      ),
      body:TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        minLines: 25,
        controller: _input,
        decoration:InputDecoration(
          fillColor:Colors.yellow[200],
          filled:true,
        ),
      ),
    );
  }
}