// ignore_for_file: avoid_print

part of 'services.dart';

class CheckoutServices {
  Future<String?> checkout(
    String? userID,
    String? idProgram,
    String? idBorrower,
    String? unit,
    String? payback,
    String? costInvest,
  ) async {
    try {
      var body = {
        'id_user': userID,
        'id_program': idProgram,
        'id_borrower': idBorrower,
        'unit': unit,
        'payback': payback,
        'cost_invest': costInvest,
      };

      var response = await http.post(Uri.parse(BaseURL.checkout), body: body);
      print(response.body);
      print(response.statusCode);

      var data = jsonDecode(response.body);
      int value = data['value'];

      if (value == 1) {
        return value.toString();
      } else {
        return value.toString();
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
