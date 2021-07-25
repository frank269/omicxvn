import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/global_widgets/action_button.dart';
import '/app/core/core.dart';
import 'dialpad_controller.dart';

class DialpadScreen extends GetView<DialpadController> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text(
          'Metech Call',
          style: toolbarTextStyle,
        ),
        backgroundColor: toolbarColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextField(
                enabled: false,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                controller: _textController,
              ),
              Column(
                children: _buildNumPad(),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ActionButton(
                    icon: Icons.dialer_sip,
                    fillColor: Colors.green,
                    onPressed: _handleBackSpace,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildNumPad() {
    var lables = [
      [
        {'1': '.'},
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
        {'+': ''},
        {'0': ''},
        {'←': ''}
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

  void _handleBackSpace() {
    var text = _textController.text;
    if (text.isNotEmpty) {
      _textController.text = text.substring(0, text.length - 1);
    }
  }

  void _handleNum(String key) {
    if (key == '←') {
      if (_textController.text.isNotEmpty)
        _textController.text =
            _textController.text.substring(0, _textController.text.length - 1);
    } else
      _textController.text += key;
  }
}
