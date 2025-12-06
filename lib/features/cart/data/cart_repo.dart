import 'package:hungry_app/core/network/api_error.dart';
import 'package:hungry_app/core/network/api_service.dart';
import 'package:hungry_app/features/cart/data/cart_model.dart';

class CartRepo {
  ApiService apiService=ApiService();
  Future<void> addToCart(CartRequestModel cartData)async{
    try{
      final response=await apiService.post('/cart/add',cartData.toJSon());
    throw ApiError(message: response['message']);
    }catch(e){
      throw ApiError(message: e.toString());
    }
  }
 //GetCart
 Future<GetCartResponseModel?> GetCartData()async{
  try{
    final response=await apiService.get('/cart');
    if(response is ApiError){
      throw ApiError(message: response.message);
    }
    return GetCartResponseModel.fromJson(response);
  }catch(e){
    throw ApiError(message: e.toString());
  }
 }
 //RemoveCartItem
 Future<void> removeCartItem(int itemId)async{
  try{
    final response =await apiService.delete('/cart/remove/$itemId', {});
    if(response['code']==200||response['data']==null){
      throw ApiError(message: response['message']);
    }
  }catch(e){
    throw ApiError(message: e.toString());
  }
 }
}