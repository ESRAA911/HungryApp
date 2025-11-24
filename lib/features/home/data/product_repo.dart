import 'package:hungry_app/core/network/api_service.dart';
import 'package:hungry_app/features/home/data/product_model.dart';

class ProductRepo {
  ApiService apiService=ApiService();
  //get products
  Future<List<ProductModel>>getProducts()async{
    try{
      final response =await apiService.get('/products/');
      return (response['data'] as List) 
      .map((e)=>ProductModel.fromJson(e)).toList();

    }catch(e){
      print(e.toString());
      return [];
    }
  }
 

}