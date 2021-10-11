// ignore_for_file: avoid_print

part of 'services.dart';

class PortfolioServices {
  Future<List<PortfolioModel>> getHistory(String userID) async {
    try {
      var response = await http.get(Uri.parse(BaseURL.apiGetHistory + userID));

      if (response.statusCode == 200) {
        List<PortfolioModel> portfolios = [];
        List parseJson = jsonDecode(response.body);

        print(response.statusCode);
        print(parseJson);

        for (var portfolio in parseJson) {
          portfolios.add(PortfolioModel.fromJson(portfolio));
        }

        return portfolios;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
