import 'dart:convert';
import 'dart:io';
import 'package:hottel_1/x_data/apartment.dart';
import 'package:hottel_1/x_data/apartment_data.dart';
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


  Future<Hotel> getHotelPost() async {
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

  Future<Apartment> getApartmentPost() async {
    final url = Uri.parse(
        'https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195');

    try {
      final request = await client.getUrl(url);
      final respons = await request.close();

      final jsonMaps = await respons.transform(utf8.decoder).toList();
      final jsonMap = jsonMaps.join();
      final resultFile = jsonDecode(jsonMap) as Map<String, dynamic>;
      _validateResponse(respons, resultFile); //!ПРОВЕРКА

      final result = Apartment.fromJson(resultFile);
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

  Future<ApartmentData> getApartmentDataPost() async {
    final url = Uri.parse(
        'https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff');

    try {
      final request = await client.getUrl(url);
      final respons = await request.close();

      final jsonMaps = await respons.transform(utf8.decoder).toList();
      final jsonMap = jsonMaps.join();
      final resultFile = jsonDecode(jsonMap) as Map<String, dynamic>;
      _validateResponse(respons, resultFile); //!ПРОВЕРКА

      final result = ApartmentData.fromJson(resultFile);
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
