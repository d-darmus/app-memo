import 'package:flutter/material.dart';
import 'package:app_memo/memo/db/db_memo.dart';

class InputMemo extends StatefulWidget{
  const InputMemo({Key? key,required this.recId}) : super(key: key);
  final int recId;
  @override
  State<StatefulWidget> createState(){
    return _InputMemo();
  }
}

class _InputMemo extends State<InputMemo>{
  final TextEditingController _input = TextEditingController();
  @override
  void initState(){
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text('編集'),
      ),
      floatingActionButton:FloatingActionButton(
        child:const Text('保存'),
        onPressed:(){
          0 == widget.recId ? regist() : update();
          Navigator.pop(context);
        },
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

  /// データ登録
  void regist() async{
    Memo memo = Memo(recId: 0, content:_input.text);
    await Memo.insertData(memo);
  }
  /// データ更新
  void update() async{
    Memo memo = Memo(recId:0,content:_input.text);
    Memo.update(widget.recId,memo);
  }
  /// データ取得
  void getData() async{
    List<Memo> memo = await Memo.getData(widget.recId);
    setState((){
      _input.text = memo.isNotEmpty ? memo[0].content : "";
    });
  }
}