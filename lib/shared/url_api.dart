part of 'shared.dart';

class BaseURL {
  // Development
  // static String ipAddress = '192.168.43.30';
  // static String apiGetProgram =
  //     'http://$ipAddress/api_invest/api/api_get_program.php';
  // static String apiImage = 'http://$ipAddress/api_invest/assets';
  // static String apiSignUp = 'http://$ipAddress/api_invest/api/sign_up.php';
  // static String apiSignIn = 'http://$ipAddress/api_invest/api/sign_in.php';
  // static String apiGetUser =
  //     'http://$ipAddress/api_invest/api/get_profile.php?id_user=';
  // static String checkout = 'http://$ipAddress/api_invest/api/checkout.php';
  // static String apiGetHistory =
  //     'http://$ipAddress/api_invest/api/api_history_order.php?id_user=';
  // static String apiConfirmPayment =
  //     "http://$ipAddress/api_invest/api/confirm_payment.php";

  // Production
  static String ipAddress = 'kangsayuronline.tanibersama.com/invest-app';
  static String apiGetProgram = 'https://$ipAddress/api/api_get_program.php';
  static String apiImage = 'http://$ipAddress/assets/img_program';
  static String apiSignUp = 'https://$ipAddress/api/sign_up.php';
  static String apiSignIn = 'https://$ipAddress/api/sign_in.php';
  static String apiGetUser = 'https://$ipAddress/api/get_profile.php?id_user=';
  static String checkout = 'https://$ipAddress/api/checkout.php';
  static String apiGetHistory =
      'https://$ipAddress/api/api_history_order.php?id_user=';
  static String apiConfirmPayment =
      "https://$ipAddress/api/confirm_payment.php";
}
