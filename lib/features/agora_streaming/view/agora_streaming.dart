import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/util/env.dart';

class AgoraStreaming extends StatefulWidget {
  @override
  _AgoraStreamingState createState() => _AgoraStreamingState();
}

class _AgoraStreamingState extends State<AgoraStreaming> {
  final AgoraClient client = AgoraClient(

    agoraConnectionData: AgoraConnectionData(
      channelName: 'test',
      appId: Env.agoraID,
    ),
    enabledPermission: [
      Permission.microphone,
      Permission.camera,
    ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AgoraVideoViewer(
            client: client,
            layoutType: Layout.floating,
          ),
          AgoraVideoButtons(client: client)
        ],
      ),
    );
  }
}
