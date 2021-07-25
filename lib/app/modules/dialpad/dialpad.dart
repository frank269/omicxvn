import 'package:flutter/material.dart';
import '/app/global_widgets/action_button.dart';
import '../home/components/call_notifier.dart';
import 'package:sip_ua/sip_ua.dart';

class DialPad extends StatelessWidget {
  static const String routeName = '/dialpad';
  final TextEditingController _textController = TextEditingController();
  String receivedMsg = '';

  CallStateEnum currentCallState = CallStateEnum.NONE;
  List<Widget> _buildNumPad() {
    var lables = [
      [
        {'1': ''},
        {'2': 'abc'},
        {'3': 'def'}
      ],
      [
        {'4': 'ghi'},
        {'5': 'jkl'},
        {'6': 'mno'}
      ],
      [
        {'7': 'pqrs'},
        {'8': 'tuv'},
        {'9': 'wxyz'}
      ],
      [
        {'*': ''},
        {'0': '+'},
        {'#': ''}
      ],
    ];

    return lables
        .map((row) => Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: row
                    .map((label) => ActionButton(
                          title: '${label.keys.first}',
                          subTitle: '${label.values.first}',
                          onPressed: () => _handleNum(label.keys.first),
                          number: true,
                        ))
                    .toList())))
        .toList();
  }

  List<Widget> _buildDialPad(CallNotifier callNotifier, bool isNumpad) {
    return [
      Container(
          width: 360,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 360,
                    child: TextField(
                      enabled: false,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, color: Colors.black54),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: _textController,
                    )),
              ])),
      Container(
          width: 300,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildNumPad())),
      isNumpad
          ? Container(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // ActionButton(
                    //   icon: Icons.videocam,
                    //   onPressed: () => _handleCall(context),
                    // ),
                    ActionButton(
                      icon: Icons.dialer_sip,
                      fillColor: Colors.green,
                      onPressed: () => _handleCall(null, true),
                    ),
                    ActionButton(
                      icon: Icons.keyboard_arrow_left,
                      onPressed: _handleBackSpace,
                      onLongPress: () => _handleBackSpace(true),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              width: 300,
              child: 'INCOMING' == 'INCOMING'
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ActionButton(
                            icon: Icons.phone,
                            fillColor: Colors.green,
                            onPressed: () => _handleAccept(null),
                          ),
                          ActionButton(
                            icon: Icons.call_end,
                            fillColor: Colors.red,
                            onPressed: () => _handleHangup(null),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ActionButton(
                            title: callNotifier.audioMuted ? 'unmute' : 'mute',
                            icon: callNotifier.audioMuted
                                ? Icons.mic_off
                                : Icons.mic,
                            checked: callNotifier.audioMuted,
                            onPressed: () => callNotifier.muteAudio(),
                          ),
                          ActionButton(
                            icon: Icons.call_end,
                            fillColor: Colors.red,
                            onPressed: () => _handleHangup(null),
                          ),
                          ActionButton(
                            title: callNotifier.speakerIsOn
                                ? 'speaker off'
                                : 'speaker on',
                            icon: callNotifier.speakerIsOn
                                ? Icons.volume_off
                                : Icons.volume_up,
                            checked: callNotifier.speakerIsOn,
                            onPressed: () => callNotifier.toggleSpeaker(),
                          ),
                        ],
                      ),
                    ),
            ),
    ];
  }

  Widget? _handleCall(BuildContext? context, [bool voiceonly = false]) {
    var dest = _textController.text;
    if (dest == null || dest.isEmpty) {
      showDialog<Null>(
        context: context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Target is empty.'),
            content: Text('Please enter a SIP URI or username!'),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return null;
    }
    return null;
  }

  void _handleAccept(context) {}

  void _handleHangup(context) {}

  void _handleBackSpace([bool deleteAll = false]) {
    var text = _textController.text;
    if (text.isNotEmpty) {
      // this.setState(() {
      text = deleteAll ? '' : text.substring(0, text.length - 1);
      _textController.text = text;
      // });
    }
  }

  void _handleNum(String number) {
    // this.setState(() {
    _textController.text += number;
    // });
  }

  Widget _dialView(callNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Center(
            child: Text(
              'Registration: ${callNotifier.registerStateName()}',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
        ),
        Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildDialPad(callNotifier, true),
        )),
      ],
    );
  }

  Widget _callView(callNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Center(
            child: Text(
              'Call Status: ${callNotifier.callStateName()}',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Center(
            child: Text(
              'Received message: ${callNotifier.message}',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
        ),
        Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildDialPad(callNotifier, false),
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Metech call"),
      ),
      body: SingleChildScrollView(
        child: isCallView(null) ? _callView(null) : _dialView(null),
      ),
    );
  }

  bool isCallView(callState) {
    currentCallState = callState.state;
    switch (callState.state) {
      case CallStateEnum.NONE:
      case CallStateEnum.ENDED:
      case CallStateEnum.FAILED:
        return false;

      case CallStateEnum.STREAM:
      case CallStateEnum.UNMUTED:
      case CallStateEnum.MUTED:
      case CallStateEnum.CONNECTING:
      case CallStateEnum.PROGRESS:
      case CallStateEnum.ACCEPTED:
      case CallStateEnum.CONFIRMED:
      case CallStateEnum.HOLD:
      case CallStateEnum.UNHOLD:
      case CallStateEnum.CALL_INITIATION:
      case CallStateEnum.REFER:
      default:
        return true;
    }
  }
}
