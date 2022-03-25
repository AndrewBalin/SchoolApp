import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:schoolapp/data/Profile.dart';

class OnlineLesson extends StatefulWidget {
  final name;
  OnlineLesson({Key? key, required this.name}) : super(key: key);

  @override
  _OnlineLessonState createState() => _OnlineLessonState(name: name);
}

class _OnlineLessonState extends State<OnlineLesson> {
  final name;
  final _localRenderer = new RTCVideoRenderer();
  final _remoteRenderer = new RTCVideoRenderer();
  late RTCPeerConnection _peerConnection;
  late MediaStream _localStream;
  _OnlineLessonState({Key? key, required this.name});



  @override
  dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    initRenderers();
    _createPeerConnecion().then((pc) {
      _peerConnection = pc;
    });
    super.initState();

  }

  initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }

  _getUserMedia() async {
    final Map<String, dynamic> mediaConstraints = {
      'audio': false,
      'video': {
        'facingMode': 'user',

      },
    };

    MediaStream stream = await navigator.getUserMedia(mediaConstraints);

    _localRenderer.srcObject = stream;
  }

  _createPeerConnecion() async {
    Map<String, dynamic> configuration = {
          "iceServers": [
            {"url": "stun:stun.l.google.com:19302"}
          ]
        };
    final Map<String, dynamic> offerSdpConstraints = {
      "mandatory": {
        "OfferToReciveAudio": true,
        "OfferToReciveVideo": true,
      },
      "optional": []

    };

    _localStream = await _getUserMedia();

    RTCPeerConnection pc =
        await createPeerConnection(configuration, offerSdpConstraints);

    pc.addStream(_localStream);

    pc.onIceCandidate = (e) {
      if (e.candidate != null) {
        print(json.encode({
          'candidate': e.candidate.toString(),
        'sdpMid': e.sdpMid.toString(),
        'sdpMlineIndex': e.sdpMLineIndex.toString(),
        }));
      }
    };

    pc.onConnectionState = (e) {
      print(e);
    };
    pc.onAddStream = (stream) {
      print("addStream " + stream.id);
      _remoteRenderer.srcObject = stream;
    };

    return pc;

  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Информатика 10Б'),
        ),
        body: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0.0,
                  right: 0.0,
                  height: size.height * 0.2,
                  width: size.width * 0.5,
                  child: Container(
                    child: RTCVideoView(_localRenderer, mirror: true,),
                  )
              ),
              Positioned(
                  top: 0.0,
                  right: 0.0,
                  height: 0.0,
                  width: 0.0,
                  child: Container(
                    child: RTCVideoView(_remoteRenderer),
                  )
              ),
            ],
          ),

        )

    );
  }
}
