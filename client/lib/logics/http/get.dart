import 'package:http/http.dart' as http;

Future<http.Response> getUser(String email, String password) async {
  var response = await http.get(
    Uri.parse('http://localhost:1323/get/user?email=$email&password=$password'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception("Failed getUser 15");
  }
}

Future<http.Response> getGroup(int groupID) async {
  var response = await http.get(
    Uri.parse('http://localhost:1323/get/group?groupID=$groupID'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception("Failed getGroup");
  }
}
