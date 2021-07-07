import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sayphi/features/agora_streaming/view/boradcastPage.dart';

class AgoraStreaming extends StatefulWidget {
  @override
  _AgoraStreamingState createState() => _AgoraStreamingState();
}

class _AgoraStreamingState extends State<AgoraStreaming> {
  String check = '';

  Future<void> onJoin({required bool isBroadcaster}) async {
    await [Permission.camera, Permission.microphone].request();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () => onJoin(isBroadcaster: false),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Just Watch  ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      Icons.remove_red_eye,
                    )
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.pink,
                ),
                onPressed: () => onJoin(isBroadcaster: true),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Broadcast    ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(Icons.live_tv)
                  ],
                ),
              ),
              Text(
                check,
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ));
  }
}
