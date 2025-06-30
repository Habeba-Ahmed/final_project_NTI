import 'package:dio/dio.dart';

class FavData {
  Dio dio=Dio();
  addFavorite(String id) async {
    final response = await dio.post(
      'https://elwekala.onrender.com/favorite',
      data: {
        'productId': id,    
        'nationalId': '01009876567876',
      },
    );
    // print('eeeeeeeeeeeeeeeeee$response');
    return response;
}

  getFavorites() async {
    final response = await dio.get(
      'https://elwekala.onrender.com/favorite',
      data: {
        'nationalId': '01009876567876'});
      // print('rrrrrrrrrrrrrrrrrrrr${response.data}');  
      return response.data['favoriteProducts'] as List<dynamic>;
  }
  

  deleteFavorites(String id) async {
    final response = await dio.delete(
      'https://elwekala.onrender.com/favorite',
      data: {
        'productId': id, 
        'nationalId': '01009876567876'});
      // print('rrrrrrrrrrrrrrrrrrrr${response.data}');  
      return response;
  }
  
  }