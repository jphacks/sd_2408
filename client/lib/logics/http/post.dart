import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> postUser(
    String name,
    String email,
    int birthday,
    String password,
    String place,
    String githubURL,
    String selfIntro,
    String preference,
    List<int> groupIDs,
    String iconPath) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('http://localhost:1323/post/user'),
  );

  request.fields['name'] = name;
  request.fields['email'] = email;
  request.fields['birthday'] = birthday.toString();
  request.fields['password'] = password;
  request.fields['place'] = place;
  request.fields['githubURL'] = githubURL;
  request.fields['selfIntro'] = selfIntro;
  request.fields['preference'] = preference;
  request.fields['groupIDs'] = groupIDs.join(',');

  if (iconPath.isNotEmpty) {
    final iconFile = await http.MultipartFile.fromPath('icon', iconPath);
    request.files.add(iconFile);
  }

  final response = await http.Response.fromStream(await request.send());

  if (response.statusCode == 200) {
    return response;
  } else {
        throw Exception("Failed postUser /home/segnities007/Projects/sd_2408/client/lib/logics/http/post.dart 40");
  }
}

Future<http.Response> postGroup(String name, int userID) async {
  var response = await http.post(
    Uri.parse('http://localhost:1323/post/group'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode({
      'name': name,
      'userID': userID,
    }),
  );

  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception("Failed postGroup /home/segnities007/Projects/sd_2408/client/lib/logics/http/post.dart 59");
  }
}
