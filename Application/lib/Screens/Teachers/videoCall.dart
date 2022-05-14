import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

const appId = 'b4e3de36b9cd46dba42e15623d73b71b';
const token = '006b4e3de36b9cd46dba42e15623d73b71bIADuDIrHGMpwuDCfdqZiQdfI8ntVRg9Ag0LLKOyXuF6d61VYBroAAAAAEAAlZZC8B3SNYQEAAQAHdI1h';

class VideoCall extends StatefulWidget {
  final name;
  VideoCall({Key? key, required this.name}) : super(key: key);

  @override
  _VideoCallState createState() => _VideoCallState(name: name);
}

class _VideoCallState extends State<VideoCall> {
  final name;
  _VideoCallState({Key? key, required this.name});

  int? _remoteUid;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.create(appId);
    await _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("Пользователь $uid присоеденился");
        },
        userJoined: (int uid, int elapsed) {
          print("Пользователь $uid присоеденился");
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("Пользователь $uid вышел");
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );

    await _engine.joinChannel(null, "firstchannel", null, 0);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Видеоурок (BETA)'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.remove),
        backgroundColor: Colors.red,
        onPressed: () {},
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter + Alignment(0, .1),
            child: Container(
              width: size.width * 0.98,
              height: size.height * 0.06,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text("$name", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
          )),
          Center(
            child: _remoteVideo(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 100,
              height: 100,
              child: Center(
                child: RtcLocalView.SurfaceView(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(uid: _remoteUid!);
    } else {
      return Text(
        'Подождите, пока хотя бы один пользователь присоеденится',
        textAlign: TextAlign.center,
      );
    }
  }
}