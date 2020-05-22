import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ys_teacher/page/call/index.dart';
import '../../widgets/common/skeleton.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final _channelController = TextEditingController();
  bool _validError = false;
  @override
void dispose(){
   _channelController.dispose();
        super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('agora bar')),
        body: Center(
            child: Container(
          child: Column(children: [
            Row(children: [
              Expanded(
                  child: TextField(
                    controller: _channelController,
                decoration: InputDecoration(
                    errorText: _validError?'name is empty':null,
                    border:
                        UnderlineInputBorder(borderSide: BorderSide(width: 1)),
                    hintText: 'channer name'),
              )),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Expanded(
                    child: RaisedButton(
                      onPressed: () => onJoin(),
                      child: Text('ok'),
                    ),
                  ))
            ])
          ]),
        )));
  }

  void onJoin() {
    setState(() {
       _channelController.text.isEmpty
              ? _validError = true
              : _validError = false;
    });
    if(_channelController.text.isNotEmpty){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CallPage(
        channelName:_channelController.text
      )));
    }
  }
}
