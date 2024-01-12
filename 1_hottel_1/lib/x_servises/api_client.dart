import 'dart:convert';
import 'dart:io';
import 'package:hottel_1/x_data/hotel.dart';

enum ApiClientExeptionType { network, auth, other, sessionExpired }

class ApiClientExeption implements Exception {
  final ApiClientExeptionType type;
  ApiClientExeption({
    required this.type,
  });
}

class ApiClient {
  final client = HttpClient();

  // Future<Hotel> getPost() async {
  //   final url = Uri.parse(
  //       'https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473');
  //   final request = await client.getUrl(url);
  //   //собираем наш request(запрос) //!await
  //   final respons = await request.close();
  //   //close() - выполняем наш request(запрос) и отправляем на сервер//!await
  //   //----------------------------------------
  //   //----------------------------------------
  //   final jsonStrings = await respons.transform(utf8.decoder).toList();
  //   //получение ответа сервера в виде: //!СТРИМА - байт(цифры): нужно переделать в СТРИМ строк(Json)(transform(utf8.decoder))
  //   //можно прослушать этот СТРИМ: respons.transform(utf8.decoder).listen((event) {   });
  //   //либо преобразовать в массив List: respons.transform(utf8.decoder).toList();
  //   //! это будет List Json_строк!!!!!, не String!!! ____ //!await!!
  //   final jsonString = jsonStrings.join();
  //   //склеиваем в одну строку <dynamic>
  //   final json = jsonDecode(jsonString) as Map<String, dynamic>;
  //   //!List<dynamic>;
  //   //преобразовываем в настоящий файл Json

  //   final posts = json.map((e) => Hotel.fromJson(e));
  //   //! преобразовываем файл Json в List<Post> posts
  //   return posts;
  // }

  Future<Hotel> getHotelPost(
      // {required String locale, required int movieId}
      ) async {
    // final parameters = <String, dynamic>{
    //   'api_key': _apiKey,
    //   'language': locale,
    //   'append_to_response': 'videos,credits'
    // };
    final url = Uri.parse(
        'https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473');

    try {
      final request = await client.getUrl(url);
      final respons = await request.close();

      final jsonMaps = await respons.transform(utf8.decoder).toList();
      final jsonMap = jsonMaps.join();
      final resultFile = jsonDecode(jsonMap) as Map<String, dynamic>;
      _validateResponse(respons, resultFile); //!ПРОВЕРКА

      final result = Hotel.fromJson(resultFile);
      return result;
    } //---------------------\\\\\-------
    on SocketException {
      throw ApiClientExeption(type: ApiClientExeptionType.network);
    } on ApiClientExeption {
      rethrow;
    } catch (_) {
      throw ApiClientExeption(type: ApiClientExeptionType.other);
    }
  }

//==================================================
  void _validateResponse(
      //хелпер проверки
      HttpClientResponse respons,
      Map<String, dynamic> json) {
    if (respons.statusCode == 401) {
      final dynamic status = json['status_code'];
      final code = status is int ? status : 0;
      if (code == 30) {
        //! нужно уточнить
        //?когда не верный логин пароль
        throw ApiClientExeption(type: ApiClientExeptionType.auth);
      } else if (code == 3) {
        //! нужно уточнить
        //? когда не верный sessionId
        throw ApiClientExeption(type: ApiClientExeptionType.sessionExpired);
      } else {
        throw ApiClientExeption(type: ApiClientExeptionType.other);
      }
    }
  }
}
