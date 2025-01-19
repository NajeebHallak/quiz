import 'package:dio/dio.dart';

abstract class Failure {
  String errorMassage;
  Failure(this.errorMassage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMassage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Time out with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Time out with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Time out with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection..');
      case DioExceptionType.unknown:
        return ServerFailure('UnExpacted Error ,Please Try again!');
      default:
        return ServerFailure('Oops there was an error , please try later!');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 429) {
      return ServerFailure('${response["error"]}');
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found , please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal sever error , please try later!');
    } else {
      return ServerFailure('Oops there was an error , please try later!');
    }
  }
}
