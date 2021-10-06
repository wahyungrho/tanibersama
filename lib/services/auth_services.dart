// ignore_for_file: avoid_print

part of 'services.dart';

class AuthServices {
  Future<UserModel?> signup(
    String? name,
    String? email,
    String? phone,
    String? password,
    String? pin,
  ) async {
    try {
      //* Define body for response POST
      var body = {
        'fullname': name,
        'email': email,
        'phone': phone,
        'password': password,
        'pin': pin,
      };

      var response = await http.post(Uri.parse(BaseURL.apiSignUp), body: body);

      print(response.statusCode);
      print(response.body);

      var data = jsonDecode(response.body);
      int value = data['value'];
      String id = data['id-user'];

      if (value == 1) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString(PrefProfile.idUSer, id.toString());
        sharedPreferences.setBool(PrefProfile.login, true);
        return UserModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel?> signin(
      String? email, String? password, String? pin) async {
    try {
      //* Define body for response POST
      var body = {
        'email': email,
        'password': password,
        'pin': pin,
      };

      var response = await http.post(Uri.parse(BaseURL.apiSignIn), body: body);

      print(response.statusCode);
      print(response.body);

      var data = jsonDecode(response.body);
      String id = data['id_user'];
      int value = data['value'];

      if (value == 1) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString(PrefProfile.idUSer, id.toString());
        sharedPreferences.setBool(PrefProfile.login, true);
        return UserModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
