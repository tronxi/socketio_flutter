import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:socket_flutter_plugin/socket_flutter_plugin.dart';

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
      SocketFlutterPlugin myIO = new SocketFlutterPlugin();
      //myIO.socket("http://192.168.0.5/webchat_server_node_socket");
      myIO.socket("http://192.168.0.5:8889");
      //myIO.socket("http://192.168.0.5/webchat_server_node_app");
      myIO.connect();
      myIO.emit("connect", {});
  }
  @override
  void initState() {
    super.initState();
    print('hago esto');
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
