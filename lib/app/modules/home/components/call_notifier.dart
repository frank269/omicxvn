import 'package:flutter/foundation.dart';
import 'package:sip_ua/sip_ua.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class CallNotifier with ChangeNotifier implements SipUaHelperListener {
  SIPUAHelper _helper = SIPUAHelper();
  // Map<String, String> _wsExtraHeaders = {
  //   'Origin': ' https://tryit.jssip.net',
  //   'Host': 'tryit.jssip.net:7443'
  // };
  Map<String, String> _wsExtraHeaders = {
    'Origin': ' https://call.metechvn.com',
    'Host': 'call.metechvn.com:5090'
  };
  var registerState = RegistrationState(state: RegistrationStateEnum.NONE);
  var callState = CallState(CallStateEnum.NONE);
  var transportState = TransportState(TransportStateEnum.NONE);
  Call? curentCall;
  String message = '';

  CallNotifier() {
    _helper.addSipUaHelperListener(this);
    // register();
  }

  String registerStateName() {
    return EnumHelper.getName(registerState.state);
  }

  String callStateName() {
    return EnumHelper.getName(callState.state);
  }

  String direction() {
    return curentCall?.direction ?? '';
  }

  register() async {
    if (registerState.state != RegistrationStateEnum.REGISTERED) {
      var settings = UaSettings();

      // settings.webSocketUrl = 'wss://tryit.jssip.net:10443';
      settings.webSocketUrl = 'wss://call.metechvn.com:7443';
      settings.webSocketSettings.extraHeaders = _wsExtraHeaders;
      settings.webSocketSettings.allowBadCertificate = true;
      settings.iceServers = [
        {
          'urls': 'turn:call.metechvn.com:3478?transport=udp',
          'username': 'metech',
          'credential': 'metech'
        }
      ];
      //settings.webSocketSettings.userAgent = 'Dart/2.8 (dart:io) for OpenSIPS.';
      // settings.uri = 'tien@tryit.jssip.net';
      // settings.authorizationUser = 'tien';
      // settings.password = '123456';

      settings.uri = 'sip:1116@call.metechvn.com';
      settings.authorizationUser = '1116';
      settings.password = 'Metech#call@123';
      settings.displayName = 'metech call';
      settings.userAgent = 'metech app';
      settings.dtmfMode = DtmfMode.RFC2833;

      _helper.start(settings);
    }
  }

  call(String destination, bool voiceonly) {
    _helper.call(destination, false);
  }

  answer() {
    curentCall?.answer(_helper.buildCallOptions());
  }

  hangup() {
    curentCall?.hangup();
  }

  unmute() {
    curentCall?.unmute(true, false);
  }

  mute() {
    curentCall?.mute(true, false);
  }

  speakerOn() {
    _localStream?.getAudioTracks()[0].enableSpeakerphone(true);
  }

  speakerOff() {
    _localStream?.getAudioTracks()[0].enableSpeakerphone(false);
  }

  MediaStream? _localStream = null;
  MediaStream? _remoteStream = null;

  var audioMuted = false;
  muteAudio() {
    if (audioMuted) {
      unmute();
    } else {
      mute();
    }
    audioMuted = !audioMuted;
    notifyListeners();
  }

  var speakerIsOn = false;
  void toggleSpeaker() {
    if (speakerIsOn) {
      speakerOff();
    } else {
      speakerOn();
    }
    speakerIsOn = !speakerIsOn;
    notifyListeners();
  }

  void _handelStreams(CallState event) async {
    MediaStream stream = event.stream;
    if (event.originator == 'local') {
      _localStream = stream;
      speakerOff();
      speakerIsOn = false;
      notifyListeners();
    }
    if (event.originator == 'remote') {
      _remoteStream = stream;
    }
  }

  @override
  void callStateChanged(Call call, CallState state) {
    print(state.state);
    curentCall = call;
    callState = state;
    if (state.state == CallStateEnum.STREAM) _handelStreams(callState);
    notifyListeners();
  }

  @override
  void onNewMessage(SIPMessageRequest msg) {
    var msgBody = msg.request.body as String;
    message = msgBody;
    print(message);
    notifyListeners();
  }

  @override
  void registrationStateChanged(RegistrationState state) {
    print(state.state);
    registerState = state;
    notifyListeners();
  }

  @override
  void transportStateChanged(TransportState state) {
    transportState = state;
    notifyListeners();
  }
}
