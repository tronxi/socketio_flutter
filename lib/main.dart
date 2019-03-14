import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import  'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:socketio_flutter/socketIOManager/socket_io_manager.dart';
void main() => runApp(MaterialApp(
      home: MyApp(),
  )
);

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  Future<void> initPlatformState() async {
    SocketIO socketIO;
    socketIO = SocketIOManager().createSocketIO("http://192.168.0.5:8889", "/");
    socketIO.init();
    socketIO.connect();
    socketIO.sendMessage("connect", {});
  }
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("socket.io"),
      ),
      body:Container(
        child: Text("hola"),
      )
    );
  }

}
