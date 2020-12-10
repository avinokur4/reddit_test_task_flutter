import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import '../http/http_client.dart';

abstract class IRepository {
  Future<Response> fetch(String url);
}

class Repository extends IRepository {
  Repository(DomainType domainType, {this.dio}) {
    dio = HttpClient(domainType).instance;
  }

  //for api helper testing only
  Repository.test({@required this.dio});

  Dio dio;

  @override
  Future<Response> fetch(String url) async {
    try {
      final Response response = await dio.get(Uri.encodeFull(url));
      debugPrint(response.data.toString());
      return response;
    } catch (e) {
      debugPrint('Error while fetching data::: $e');
      rethrow;
    }
  }
}
