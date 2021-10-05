part of 'shared.dart';

class BaseURL {
  // Development
  // static String ipAddress = '192.168.18.250';
  // static String apiGetProgram =
  //     'http://$ipAddress/api_invest/api/api_get_program.php';
  // static String apiImage = 'http://$ipAddress/api_invest/assets';
  // static String apiSignUp = 'http://$ipAddress/api_invest/api/sign_up.php';
  // static String apiSignIn = 'http://$ipAddress/api_invest/api/sign_in.php';

  // Production
  static String ipAddress = 'kangsayuronline.tanibersama.com';
  static String apiGetProgram =
      'https://$ipAddress/invest-app/api_get_program.php';
  static String apiImage = 'http://$ipAddress/invest-app/img';
  static String apiSignUp = 'http://$ipAddress/invest-app/sign_up.php';
  static String apiSignIn = 'http://$ipAddress/invest-app/sign_in.php';
}
