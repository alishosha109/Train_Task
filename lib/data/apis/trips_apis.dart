import 'package:dio/dio.dart';
import '../../constants/strings.dart';

class TripsApis {
  late Dio dio;

  TripsApis() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 30 * 1000,
      receiveTimeout: 30 * 1000,
      headers: {
        "authorization": "${acctoken}",
        "Content-Type": "application/json; charset=UTF-8"
      },
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getTrips(page, date, id) async {
    try {
      Response response = await dio
          .get('$id', queryParameters: {'page': page, 'date_gte': date});
      var data = response.data;
      return data;
    } catch (e) {
      print(e.toString());
      return [e];
    }
  }
}
