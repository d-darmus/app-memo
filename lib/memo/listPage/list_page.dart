import 'package:flutter/material.dart';
import 'package:app_memo/memo/inputMemo/input_memo.dart';
import 'package:app_memo/memo/db/db_memo.dart';

class ListPage extends StatefulWidget{
  const ListPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState(){
    return _ListPage();
  }
}

class _ListPage extends State<ListPage>{
  late List<Memo> memoList = [];

  @override
  Widget build(BuildContext context){
    getDatas(); // データ取得
    return Scaffold(
      appBar:AppBar(
        title:const Text('一覧'),
      ),
      floatingActionButton:FloatingActionButton(
        child:const Text('追加'),
        onPressed:(){
          Navigator.push(context,MaterialPageRoute(
            builder:(context) =>  const InputMemo(recId: 0)
          ));
        },
      ),
      body: Column(
        children:[
          Flexible(
            child:ListView.builder(
              itemCount: memoList.length,
              itemBuilder: (BuildContext context,int index){
                return dataRow(context,index,memoList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// データ
  static Widget dataRow(BuildContext context,int index,Memo memo){
    return TextButton(
      child:Container(decoration:const BoxDecoration(border:Border(bottom:BorderSide(color:Colors.white))),child:Row(
        children:[
          Container(alignment:Alignment.topLeft,height:70,width:20,margin:const EdgeInsets.only(right:5),color:Colors.yellow[800]),
          Text(memo.content,style:const TextStyle(color:Colors.black54)),
        ]
      ),height:70),
      style:TextButton.styleFrom(
        backgroundColor: Colors.yellow[200],
        padding:const EdgeInsets.all(0),
      ),
      onPressed:(){
        Navigator.push(context,MaterialPageRoute(
          builder:(context) =>  InputMemo(recId: memo.recId)
        ));
      },
      onLongPress:(){
        dialog(context,memo.recId);
      },
    );
  }

  /// データ取得
  void getDatas() async{
    List<Memo> list = await Memo.getDatas();
    setState(() {
      memoList = list;
    });
  }

  /// ダイアログ
  static void dialog(BuildContext context,int recId) async{
    var _res = await showDialog<int>(
      context:context,
      barrierDismissible:false,
      builder:(BuildContext context){
        return AlertDialog(
          title:const Text('確認'),
          content:const Text('削除します。よろしいですか？'),
          actions:<Widget>[
            TextButton(
              child:const Text('OK'),
              onPressed:() => Navigator.of(context).pop(1),
            ),
            TextButton(
              child:const Text('CANCEL'),
              onPressed:() => Navigator.of(context).pop(0),
            )
          ]
        );
      }
    );
    if(1 == _res){
      Memo.deleteData(recId);
    }
  }
}