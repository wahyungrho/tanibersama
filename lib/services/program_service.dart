// ignore_for_file: avoid_print

part of 'services.dart';

class ProgramServices with ChangeNotifier {
  Future<List<ProgramModel>> getAllProgram() async {
    try {
      var response = await http.get(Uri.parse(BaseURL.apiGetProgram));

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        List<ProgramModel> programs = [];
        List parseJson = jsonDecode(response.body);

        for (var program in parseJson) {
          programs.add(ProgramModel.fromJson(program));
        }

        return programs;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
