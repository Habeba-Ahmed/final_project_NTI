import 'package:dio/dio.dart';

class LabData {
  Dio dio=Dio();
  fetchLabData() async {
      final response = await dio.get('https://elwekala.onrender.com/product/Laptops');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('Failed to load lab data');
      }
  }
}