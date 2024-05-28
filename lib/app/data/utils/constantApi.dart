class Api {
  static const String baseUrl = 'https://c314-103-189-201-222.ngrok-free.app/';
  static const String api = '${baseUrl}api/';

  //foto
  static const String photoProduct = '${baseUrl}storage/';

  //auth
  static const String register = '${api}register';
  static const String login = '${api}login';
  static const String user = '${api}users/';

  //product
  static const String product = '${api}products';

  //transaction
  static const String transaction = '${api}transactions';

  //riwayat
  static const String riwayat = '${api}riwayat';
}
