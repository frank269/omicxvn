import 'package:flutter/material.dart';
import 'package:omicxvn/components/common/action_button.dart';
import 'package:omicxvn/components/common/conditional_builder.dart';
import 'package:omicxvn/notifiers/call_notifier.dart';
import 'package:omicxvn/widgets/drawer.dart';
import 'package:provider/provider.dart';
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
      ConditionalBuilder(
        condition: isNumpad,
        builder: (context) => Container(
            width: 300,
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ActionButton(
                      icon: Icons.videocam,
                      onPressed: () => _handleCall(context),
                    ),
                    ActionButton(
                      icon: Icons.dialer_sip,
                      fillColor: Colors.green,
                      onPressed: () => _handleCall(context, true),
                    ),
                    ActionButton(
                      icon: Icons.keyboard_arrow_left,
                      onPressed: _handleBackSpace,
                      onLongPress: () => _handleBackSpace(true),
                    ),
                  ],
                ))),
        fallback: (context) => Container(
          width: 300,
          child: ConditionalBuilder(
            condition: callNotifier.direction() == 'INCOMING',
            builder: (context) => Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ActionButton(
                    icon: Icons.phone,
                    fillColor: Colors.green,
                    onPressed: () => _handleAccept(context),
                  ),
                  ActionButton(
                    icon: Icons.call_end,
                    fillColor: Colors.red,
                    onPressed: () => _handleHangup(context),
                  ),
                ],
              ),
            ),
            fallback: (context) => Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ActionButton(
                    icon: Icons.call_end,
                    fillColor: Colors.red,
                    onPressed: () => _handleHangup(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    ];
  }

  Widget? _handleCall(BuildContext context, [bool voiceonly = false]) {
    var dest = _textController.text;
    if (dest == null || dest.isEmpty) {
      showDialog<Null>(
        context: context,
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
    Provider.of<CallNotifier>(context, listen: false).call(dest, voiceonly);
    return null;
  }

  void _handleAccept(context) {
    Provider.of<CallNotifier>(context, listen: false).answer();
  }

  void _handleHangup(context) {
    Provider.of<CallNotifier>(context, listen: false).hangup();
  }

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
            child: ConditionalBuilder(
              condition: callNotifier.message.isNotEmpty,
              builder: (context) => Text(
                'Received message: ${callNotifier.message}',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              fallback: (context) => Container(),
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
        child: Consumer<CallNotifier>(
          builder: (context, callNotifier, child) => ConditionalBuilder(
            condition: isCallView(callNotifier.callState),
            builder: (context) => _callView(callNotifier),
            fallback: (context) => _dialView(callNotifier),
          ),
        ),
      ),
      drawer: MyDrawer(),
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
