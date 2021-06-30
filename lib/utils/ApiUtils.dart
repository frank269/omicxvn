// import 'dart:convert' as convert;
// import 'package:http/http.dart' as http;
// import 'package:my_app/models/loginResponse.dart';
// import 'package:my_app/models/script.dart';
// import 'package:my_app/models/user.dart';
// import 'package:my_app/models/voice.dart';

// class ApiUtils {
//   static final String root_api = "https://ai.metechvn.com";

//   static final String getTokenApi = root_api + "/token";
//   static final String audioUploadApi = root_api + "/audio/upload";
//   static final String audioCreateApi = root_api + "/audio/create";
//   static String audioPlayApi(String path) =>
//       root_api + "/audio/play?audio_path=" + path;
//   static final String getAudiosApi = root_api + "/audio/list";
//   static final String getTranscriptsApi = root_api + "/transcript/list";
//   static final String getUsersApi = root_api + "/users/list";
//   static final String approveAudioApi = root_api + "/audio/approve";
//   static final String totalTranscriptApi = root_api + "/transcript/count";
//   static final String totalUploadedApi = root_api + "/audio/countUploaded";
//   static final String totalRejectedApi = root_api + "/audio/countRejected";
//   static final String totalApprovedApi = root_api + "/audio/countApproved";
//   static final String listApprovedApi = root_api + "/audio/listApproved";
//   static final String listRejectedApi = root_api + "/audio/listRejected";

//   static LoginResponse? currentUser;

//   static var client = http.Client();

//   static isNormalUser() {
//     return currentUser?.role == "NORMAL";
//   }

//   static Future<http.Response> sendPostRequest(
//       String url, dynamic body, bool useToken) {
//     var headers = useToken
//         ? <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//             'Authorization': 'Bearer ${currentUser!.access_token}',
//           }
//         : <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//           };

//     return client.post(
//       Uri.parse(url),
//       headers: headers,
//       body: convert.jsonEncode(body),
//     );
//   }

//   static Login(String username, String password) async {
//     var response = await sendPostRequest(
//         getTokenApi, {"username": username, "password": password}, false);
//     if (response.statusCode == 200) {
//       currentUser =
//           LoginResponse.fromJson(convert.utf8.decode(response.bodyBytes));
//       return true;
//     } else {
//       // print(response.body);
//       return false;
//     }
//   }

//   static GetListUser() async {
//     var response = await sendPostRequest(getUsersApi, {}, true);
//     if (response.statusCode == 200) {
//       var body = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
//       if (body['success']) {
//         // print(body['data']);
//         return List.from(body['data'])
//             .map<User>((user) => User.fromMap(user))
//             .toList();
//       } else
//         // print(body['message']);
//         return List<User>.empty();
//     } else {
//       // print(response.body);
//       return List<User>.empty();
//     }
//   }

//   static GetListAudio(String userId, int skip, int take) async {
//     var response = await sendPostRequest(
//         getAudiosApi, {"user_id": userId, "skip": skip, "limit": take}, true);
//     if (response.statusCode == 200) {
//       var body = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
//       if (body['success']) {
//         // print(body['data']);
//         return List.from(body['data'])
//             .map<Voice>((audio) => Voice.fromMap(audio))
//             .toList();
//       } else
//         // print(body['message']);
//         return List<Voice>.empty();
//     } else {
//       // print(response.body);
//       return List<Voice>.empty();
//     }
//   }

//   static ApproveAudio(String audioId, bool isApprove) async {
//     var response = await sendPostRequest(
//         approveAudioApi, {"audio_id": audioId, "is_approve": isApprove}, true);
//     if (response.statusCode == 200) {
//       var body = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
//       if (body['success']) {
//         // print(body['data']);
//         return true;
//       } else {
//         // print(body['message']);
//         return false;
//       }
//     } else {
//       // print(response.body);
//       return false;
//     }
//   }

//   static GetListTranscript(int pageSize, int skip) async {
//     var response = await sendPostRequest(
//         getTranscriptsApi, {"page_size": pageSize, "skip": skip}, true);
//     if (response.statusCode == 200) {
//       var body = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
//       if (body['success']) {
//         // print(body['data']);
//         return List.from(body['data'])
//             .map<Script>((script) => Script.fromMap(script))
//             .toList();
//       } else
//         // print(body['message']);
//         return List<Script>.empty();
//     } else {
//       // print(response.body);
//       return List<Script>.empty();
//     }
//   }

//   static Future<bool> CreateAudio(
//       String audio_path, String script, String script_id) async {
//     var server_path = await UploadFile(audio_path);
//     if (server_path == null) {
//       return false;
//     }

//     var response = await sendPostRequest(
//         audioCreateApi,
//         {"file_path": server_path, "script": script, "script_id": script_id},
//         true);
//     if (response.statusCode == 200) {
//       var body = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
//       if (body['success']) {
//         print(body['data']);
//         return true;
//       } else
//         print(body['message']);
//       return false;
//     } else {
//       print(response.body);
//       return false;
//     }
//   }

//   static UploadFile(String file_path) async {
//     var request = http.MultipartRequest('POST', Uri.parse(audioUploadApi));
//     var headers = <String, String>{
//       'Authorization': 'Bearer ${currentUser!.access_token}',
//     };
//     request.headers.addAll(headers);
//     request.files
//         .add(await http.MultipartFile.fromPath('file_audio', file_path));
//     var response = await request.send();
//     if (response.statusCode == 200) {
//       var responseData = await response.stream.toBytes();
//       var body = convert.jsonDecode(convert.utf8.decode(responseData));
//       if (body['success']) {
//         // print(body['data']);
//         return body['data'];
//       } else
//         // print(body['message']);
//         return null;
//     } else {
//       return null;
//     }
//   }

//   static Future<int> countTotalTranscript() async {
//     var response = await sendPostRequest(totalTranscriptApi, {}, true);
//     if (response.statusCode == 200) {
//       var body = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
//       if (body['success']) {
//         // print(body['data']);
//         return body['data'];
//       } else {
//         // print(body['message']);
//         return 0;
//       }
//     } else {
//       // print(response.body);
//       return 0;
//     }
//   }

//   static Future<int> countUploaded() async {
//     var response = await sendPostRequest(totalUploadedApi, {}, true);
//     if (response.statusCode == 200) {
//       var body = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
//       if (body['success']) {
//         // print(body['data']);
//         return body['data'];
//       } else {
//         // print(body['message']);
//         return 0;
//       }
//     } else {
//       // print(response.body);
//       return 0;
//     }
//   }

//   static Future<int> countApproved() async {
//     var response = await sendPostRequest(totalApprovedApi, {}, true);
//     if (response.statusCode == 200) {
//       var body = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
//       if (body['success']) {
//         // print(body['data']);
//         return body['data'];
//       } else {
//         // print(body['message']);
//         return 0;
//       }
//     } else {
//       // print(response.body);
//       return 0;
//     }
//   }

//   static Future<int> countRejected() async {
//     var response = await sendPostRequest(totalRejectedApi, {}, true);
//     if (response.statusCode == 200) {
//       var body = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
//       if (body['success']) {
//         // print(body['data']);
//         return body['data'];
//       } else {
//         // print(body['message']);
//         return 0;
//       }
//     } else {
//       // print(response.body);
//       return 0;
//     }
//   }

//   static GetListAudioApproved(int skip, int take) async {
//     var response = await sendPostRequest(
//         listApprovedApi, {"skip": skip, "limit": take}, true);
//     if (response.statusCode == 200) {
//       var body = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
//       if (body['success']) {
//         // print(body['data']);
//         return List.from(body['data'])
//             .map<Voice>((audio) => Voice.fromMap(audio))
//             .toList();
//       } else
//         // print(body['message']);
//         return List<Voice>.empty();
//     } else {
//       // print(response.body);
//       return List<Voice>.empty();
//     }
//   }

//   static GetListAudioRejected(int skip, int take) async {
//     var response = await sendPostRequest(
//         listRejectedApi, {"skip": skip, "limit": take}, true);
//     if (response.statusCode == 200) {
//       var body = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
//       if (body['success']) {
//         // print(body['data']);
//         return List.from(body['data'])
//             .map<Voice>((audio) => Voice.fromMap(audio))
//             .toList();
//       } else
//         // print(body['message']);
//         return List<Voice>.empty();
//     } else {
//       // print(response.body);
//       return List<Voice>.empty();
//     }
//   }
// }
