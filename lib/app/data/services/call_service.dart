import 'dart:async';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:omicxvn/app/core/core.dart';
import 'package:sip_ua/sip_ua.dart';

import '/app/modules/call_dialog/call_dialog.dart';

class CallService extends GetxService implements SipUaHelperListener {
  final SIPUAHelper _helper = SIPUAHelper();
  Map<String, String> _wsExtraHeaders = {
    'Origin': ' https://call.metechvn.com',
    'Host': 'call.metechvn.com:5090'
  };
  var settings = UaSettings();

  var registerState = RegistrationState(state: RegistrationStateEnum.NONE).obs;
  var callState = CallState(CallStateEnum.NONE).obs;
  var transportState = TransportState(TransportStateEnum.NONE);
  Call? curentCall;
  var message = ''.obs;
  var isOnCall = false.obs;

  @override
  void onInit() async {
    super.onInit();
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
    _helper.addSipUaHelperListener(this);
  }

  @override
  void onClose() {
    _helper.stop();
    _helper.removeSipUaHelperListener(this);
    super.onClose();
  }

  String registerStateName() {
    return EnumHelper.getName(registerState.value.state);
  }

  String callStateName() {
    return EnumHelper.getName(callState.value.state);
  }

  String direction() {
    return curentCall?.direction ?? '';
  }

  bool isCallingOut() {
    return curentCall?.direction == "OUTGOING";
  }

  isRegisted() {
    return registerState.value.state == RegistrationStateEnum.REGISTERED;
  }

  register(ext, pass, displayName, agentName) async {
    ext = '1112';
    pass = 'Metech#call@123';
    if (!isRegisted()) {
      settings.uri = 'sip:${ext}@call.metechvn.com';
      settings.authorizationUser = '${ext}';
      settings.password = '$pass';
      settings.displayName = displayName;
      settings.userAgent = agentName;
      settings.dtmfMode = DtmfMode.RFC2833;
      _helper.start(settings);
    }
  }

  logout() {
    _helper.stop();
  }

  call(String destination) {
    if (registerState.value.state != RegistrationStateEnum.REGISTERED) return;
    _helper.call(destination);
  }

  answer() {
    curentCall?.answer(_helper.buildCallOptions());
  }

  hangup() {
    curentCall?.hangup();
  }

  unmute() {
    curentCall?.unmute(true, true);
  }

  mute() {
    curentCall?.mute(true, true);
  }

  setSpeaker(isOn) {
    speakerIsOn.value = isOn;
    _localStream?.getAudioTracks()[0].enableSpeakerphone(isOn);
  }

  MediaStream? _localStream = null;
  MediaStream? _remoteStream = null;

  var audioMuted = false.obs;
  muteAudio() {
    if (audioMuted.value) {
      unmute();
    } else {
      mute();
    }
    audioMuted.value = !audioMuted.value;
  }

  var speakerIsOn = false.obs;
  void toggleSpeaker() {
    speakerIsOn.value = !speakerIsOn.value;
    setSpeaker(speakerIsOn.value);
  }

  void _handelStreams(CallState event) async {
    MediaStream stream = event.stream;
    if (event.originator == 'local') {}
    if (event.originator == 'remote') {
      _remoteStream = stream;
    }
    _localStream = stream;
    setSpeaker(false);
  }

  void dismissDialog() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  void showDialog() {
    if (Get.isDialogOpen ?? false) return;
    Get.dialog(
      CallDialog(),
      barrierDismissible: false,
    );
  }

  void minimizePopup() {
    dismissDialog();
  }

  Timer? _timer;
  void _stopTimer() {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer = null;
  }

  void _startTimer() {
    _stopTimer();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      Duration duration = Duration(seconds: timer.tick);
      message.value = [duration.inMinutes, duration.inSeconds]
          .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
          .join(':');
    });
  }

  var userName = 'Unknown';

  @override
  void callStateChanged(Call call, CallState state) {
    curentCall = call;
    switch (state.state) {
      case CallStateEnum.UNMUTED:
        audioMuted.value = false;
        break;

      case CallStateEnum.MUTED:
        audioMuted.value = true;
        break;

      case CallStateEnum.CONFIRMED:
        isOnCall.value = true;
        _startTimer();
        break;

      case CallStateEnum.STREAM:
        _handelStreams(callState.value);
        break;

      case CallStateEnum.CALL_INITIATION:
        showDialog();
        break;

      case CallStateEnum.FAILED:
      case CallStateEnum.ENDED:
        isOnCall.value = false;
        _stopTimer();
        dismissDialog();
        break;

      default:
        break;
    }
    callState.value = state;
    userName = curentCall?.remote_identity ?? 'Unknown';
    print('callStateChanged: ${callStateName()}');
  }

  @override
  void onNewMessage(SIPMessageRequest msg) {
    var msgBody = msg.request.body as String;
    message.value = msgBody;
    print('onNewMessage ${message}');
  }

  @override
  void registrationStateChanged(RegistrationState state) {
    registerState.value = state;
    print('registrationStateChanged: ${registerStateName()}');
  }

  @override
  void transportStateChanged(TransportState state) {
    transportState = state;
  }
}
