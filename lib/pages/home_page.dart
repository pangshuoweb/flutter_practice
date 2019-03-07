import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController =TextEditingController();
  String showText = '欢迎来到美好生活大酒店';
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text('美好生活'),
         ),
         body: Container(
           child: Column(
             children: <Widget>[
               TextField(
                 controller: typeController,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.all(10.0),
                   labelText: '生活类型',
                   helperText: '请输入喜欢的生活',
                 ),
                 autofocus: false, //禁止手机键盘打开
               ),
               RaisedButton(
                 onPressed: (){
                   _choiceAction();
                 },
                 child: Text(
                   '选择完毕'
                 ),
               ),
                 Text(
                  showText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                 ),
             ],
           ),
         ),
       ),
    );
  }
  
  void _choiceAction(){
    print('开始选择你喜欢的类型。。。。');
    if(typeController.text.toString()==''){
      showDialog(
        context: context,
        builder: (context)=>AlertDialog(title: Text('选择类型不能为空'),)
      );
    }else{
      getHttp(typeController.text.toString()).then((val){
        setState(() {
          showText=val['data']['name'].toString();
        });
      });
    }
  }

  Future getHttp(String TypeText) async{
    try {
      Response response;
      var data = {'name':TypeText};
      response =await Dio().get('https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian',queryParameters:data);
      return response.data;  
    } catch (e) {
      return Response;
    }
  }
}
