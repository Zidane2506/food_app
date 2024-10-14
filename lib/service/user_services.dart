part of 'sevices.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + '/login';

    var response = await client.post(Uri.parse(url),
        headers: ApiServices.headersPost(),
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Login Failed, please try again later');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {File? pictureFile, http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + '/register';

    var response = await http.post(Uri.parse(url),
        headers: ApiServices.headersPost(),
        body: jsonEncode(<String, String>{
          'name': user.name!,
          'email': user.email!,
          'password': password,
          'password_confirmation': password,
          'address': user.address!,
          'city': user.city!,
          'houseNumber': user.houseNumber!,
          'phoneNumber': user.phoneNumber!,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Register Failed, Please try again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadPicturePath(pictureFile);

      if (result.value != null) {
        value = value.copyWith(
            picturePath: "https://food.rtid73.com/storage/${result.value}");
      }
    }

    return ApiReturnValue();
  }

  static Future<ApiReturnValue<String>> uploadPicturePath(File pictureFile,
      {http.MultipartRequest? request}) async {
    String url = baseUrl + '/user/photo';

    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest('POST', uri)
        ..headers['Content-Type'] = 'application/json'
        ..headers['Authorization'] = 'Bearer ${User.token}';
    }

    var multiPartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);

    request.files.add(multiPartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();

      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];

      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(
          message: 'Upload pictures failed, Please try again later');
    }
  }

  static Future<ApiReturnValue<bool>> logOut({http.Client? client}) async {

    client ??= http.Client();

    String url = '$baseUrl/logOut';
    print("URL Logout : $url");

    var response = await client.post(Uri.parse(url),
    headers: ApiServices.headersPost(token: User.token));

    print("Response Logout : ${response.body}");

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'LogOut Failed');
    }

    return ApiReturnValue(value: true);
  }
}
