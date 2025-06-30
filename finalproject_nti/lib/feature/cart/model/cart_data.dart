import 'package:dio/dio.dart';

class CartData {
  Dio dio=Dio();
  addCart(String id) async {
    final response = await dio.post(
      'https://elwekala.onrender.com/cart/add',
      data: {
        'productId': id,    
        'nationalId': '01026524572123',
        "quantity": "1",
      },
    );
    // print('eeeeeeeeeeeeeeeeee$response');
    return response;
}

  getCart() async {
    final response = await dio.get(
      'https://elwekala.onrender.com/cart/allProducts',
      data: {
        'nationalId': '01026524572123'});
      return response.data['products'] as List<dynamic>;
  }
  

  deleteCart(String id) async {
    final response = await dio.delete(
      'https://elwekala.onrender.com/cart/delete',
      data: {
        'productId': id, 
        'nationalId': '01026524572123'});
      return response;
  }
  
  

updateCart(String id, int quantity) async {
    final response = await dio.put(
      'https://elwekala.onrender.com/cart',
      data: {
        'productId': id,
        'nationalId': '01026524572123', 
        'quantity': quantity,
      },
    );
    return response;

}


  }