// ignore_for_file: avoid_print

part of 'services.dart';

class ConfirmPaymentServices {
  Future confirmPayment(
    String invoice,
    String accountName,
    String accountNumber,
    File image,
  ) async {
    try {
      var stream = http.ByteStream(image.openRead())..cast();
      var lengthImage = await image.length();
      var url = Uri.parse(BaseURL.apiConfirmPayment);
      var request = http.MultipartRequest('POST', url);
      var multiPartFile = http.MultipartFile('image', stream, lengthImage,
          filename: path.basename(image.path));
      request.fields['invoice'] = invoice;
      request.fields['name_account'] = accountName;
      request.fields['number_account'] = accountNumber;
      request.files.add(multiPartFile);
      var response = await request.send();
      response.stream.transform(utf8.decoder).listen((event) {
        final data = jsonDecode(event);
        String message = data['message'];
        int value = data['value'];
        if (value == 1) {
          print(message);
        } else {
          print(message);
        }
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
