import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';

class CallPage extends StatefulWidget {
  final String channelName;
  CallPage({Key key, this.channelName}) : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final String _appid='ff472bd52620471f9faa710327b85ec9';
  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() {
    _initAgoraRtcEngine();
    _addAgoraEventHandlers();
//     _addRenderView(0, (viewId) {
// // local view setup & preview
//     AgoraRtcEngine.setupLocalVideo(viewId, 1);
//     AgoraRtcEngine.startPreview();
//  // state can access widget directly
//     AgoraRtcEngine.joinChannel(null, widget.channelName, null, 0);
// });

  }
//  void _addRenderView(int uid , Function (int viewId) finished){
//     Widget view =AgoraRtcEngine.createNativeView(uid,(viewId) {
//       setState(() {
//         _getVideoSession(uid).viewId = viewId;
//         if(finished!=null){
//          finished(viewId);
//         }
//       });
//     });
//     VideoSession session = VideoSession(uid, view);
//         _sessions.add(session);
//  }
  void _initAgoraRtcEngine() {
    AgoraRtcEngine.create(_appid);
    AgoraRtcEngine.enableVideo();
  }

  /// Add agora event handlers
  void _addAgoraEventHandlers() {
    AgoraRtcEngine.onError = (dynamic code) {
// sdk error
    };
    AgoraRtcEngine.onJoinChannelSuccess =
        (String channel, int uid, int elapsed) {
// join channel success
    };
    AgoraRtcEngine.onUserJoined = (int uid, int elapsed) {
// there's a new user joining this channel
    };
    AgoraRtcEngine.onUserOffline = (int uid, int reason) {
// there's an existing user leaving this channel
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.channelName)),
      backgroundColor: Colors.black,
      body: Center(child: Stack(children: [])),
    );
  }
}
