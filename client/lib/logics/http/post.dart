import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> postUser({
  required final String name,
  required final String email,
  required final int birthday,
  required final String password,
  required final String place,
  required final String githubURL,
  required final String selfIntro,
  required final String preference,
  required final List<int> groupIDs,
  required final String iconPath
}) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('http://localhost:1323/post/user'),
  );

  // フィールドの設定
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
  } else {//no print 直し
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    throw Exception("Failed to post user");
  }
}

Future<http.Response> postGroup({
  required final String name,
  required final int userID
}) async {
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
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    throw Exception("Failed to post group");
  }
}

void main() async {
  try {
    final userResponse = await postUser(
      name: "John Doe",
      email: "johndoe@example.com",
      birthday: 19900101,
      password: "password123",
      place: "Tokyo",
      githubURL: "https://github.com/johndoe",
      selfIntro: "Hello, I am John!",
      preference: "Go, Docker",
      groupIDs: [1, 2, 3],
      iconPath: "/path/to/icon.png",
    );
    print("User created: ${userResponse.body}");

    final groupResponse = await postGroup(
      name: "Developers Group",
      userID: 1,
    );
    print("Group created: ${groupResponse.body}");
  } catch (e) {
    print("Error: $e");
  }
}
