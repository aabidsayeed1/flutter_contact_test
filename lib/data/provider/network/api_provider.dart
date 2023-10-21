import 'dart:async';
import 'dart:io';
import 'package:get/get_connect/connect.dart';

import 'api_request_representable.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 30);
  final _client = GetConnect(timeout: requestTimeOut);

  static final _singleton = APIProvider();
  static APIProvider get instance => _singleton;

  Future request(APIRequestRepresentable request) async {
    print(request.headers);
    print(request.body);

    try {
      final response = await _client.request(
        request.url,
        request.method.string,
        headers: request.headers,
        query: request.query,
        body: request.body,
      );
      print(response.body);
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw NoInternetException('No Internet connection');
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 422:
      case 403:
        throw UnauthorisedException(' ${response.body['message']}');
      case 404:
        throw BadRequestException(response.body['message'].toString());
      case 500:
      case 503:
        print("status code 500 and 503 :  ${response.body.toString()}");
        throw FetchDataException('Internal Server Error');
      // ${response.body['message'].toString()}
      default:
        throw FetchDataException(
            'Error occured while Communication with Server');
    }
  }
}

class AppException implements Exception {
  final code;
  final message;
  final details;

  AppException({this.code, this.message, this.details});
  @override
  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
      : super(
          code: "fetch-data",
          message: "Internal Server Error",
          details: details,
        );
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
      : super(
          code: "invalid-request",
          message: "Invalid Request",
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details)
      : super(
          code: "unauthorised",
          message: "Unauthorised",
          details: details,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details)
      : super(
          code: "invalid-input",
          message: "Invalid Input",
          details: details,
        );
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details)
      : super(
          code: "authentication-failed",
          message: "Authentication Failed",
          details: details,
        );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: "request-timeout",
          message: "Request TimeOut",
          details: details,
        );
}

class NoInternetException extends AppException {
  NoInternetException(String? details)
      : super(
          code: "no-internet",
          message: "Please Check Your Internet Connection",
          details: details,
        );
}
