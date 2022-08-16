part of 'shared.dart';

class BaseURL {
  // Development
  // static String ipAddress = '192.168.1.3';
  // static String apiGetProgram =
  //     'http://$ipAddress/api_invest_agriculture/api/api_get_program.php';
  // static String apiImage = 'http://$ipAddress/api_invest_agriculture/assets';
  // static String apiSignUp =
  //     'http://$ipAddress/api_invest_agriculture/api/sign_up.php';
  // static String apiSignIn =
  //     'http://$ipAddress/api_invest_agriculture/api/sign_in.php';
  // static String apiGetUser =
  //     'http://$ipAddress/api_invest_agriculture/api/get_profile.php?id_user=';
  // static String checkout =
  //     'http://$ipAddress/api_invest_agriculture/api/checkout.php';
  // static String apiGetHistory =
  //     'http://$ipAddress/api_invest_agriculture/api/api_history_order.php?id_user=';
  // static String apiConfirmPayment =
  //     "http://$ipAddress/api_invest_agriculture/api/confirm_payment.php";

  // Production
  static String ipAddress = 'https://buangsampah.com/api_invest';
  static String apiGetProgram = '$ipAddress/api/api_get_program.php';
  static String apiImage = '$ipAddress/assets/img_program';
  static String apiSignUp = '$ipAddress/api/sign_up.php';
  static String apiSignIn = '$ipAddress/api/sign_in.php';
  static String apiGetUser = '$ipAddress/api/get_profile.php?id_user=';
  static String checkout = '$ipAddress/api/checkout.php';
  static String apiGetHistory = '$ipAddress/api/api_history_order.php?id_user=';
  static String apiConfirmPayment = "$ipAddress/api/confirm_payment.php";
}
