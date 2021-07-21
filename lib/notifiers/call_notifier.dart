import 'package:flutter/foundation.dart';
import 'package:sip_ua/sip_ua.dart';

class CallNotifier with ChangeNotifier implements SipUaHelperListener {
  SIPUAHelper _helper = SIPUAHelper();
  Map<String, String> _wsExtraHeaders = {
    'Origin': ' call.metechvn.com:7443',
    'Host': 'call.metechvn.com:7443'
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

      settings.webSocketUrl = 'wss://call.metechvn.com:7443';
      settings.webSocketSettings.extraHeaders = _wsExtraHeaders;
      settings.webSocketSettings.allowBadCertificate = true;
      settings.webSocketSettings.userAgent = 'diemlt';
      settings.iceServers = [
        {
          'urls': 'turn:call.metechvn.com:3478?transport=udp',
          'username': 'metech',
          'credential': 'metech'
        }
      ];
      //settings.webSocketSettings.userAgent = 'Dart/2.8 (dart:io) for OpenSIPS.';

      settings.uri = 'sip:1112@call.metechvn.com:5090';
      settings.authorizationUser = '1112';
      settings.password = 'Metech#call@123';
      settings.displayName = 'metech call';
      settings.userAgent = 'metech app';
      settings.dtmfMode = DtmfMode.RFC2833;
      _helper.start(settings);
    }
  }

  call(String destination, bool voiceonly) {
    _helper.call(destination, voiceonly);
  }

  answer() {
    curentCall?.answer(_helper.buildCallOptions());
  }

  hangup() {
    curentCall?.hangup();
  }

  logout() {
    _helper.stop();
  }

  @override
  void callStateChanged(Call call, CallState state) {
    print(state.state);
    curentCall = call;
    callState = state;
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
    if (registerState.state == RegistrationStateEnum.REGISTERED) {
      call('1113', true);
      Future.delayed(const Duration(seconds: 5), hangup);
    }
  }

  @override
  void transportStateChanged(TransportState state) {
    transportState = state;
    notifyListeners();
  }
}
