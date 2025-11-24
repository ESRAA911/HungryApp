import 'package:hungry_app/core/network/api_service.dart';
import 'package:hungry_app/features/home/data/models/product_model.dart';
import 'package:hungry_app/features/home/data/models/topping_model.dart';

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
  //get toppings
  Future<List<ToppingModel>>getToppings()async{
    try{
      final response=await apiService.get('/toppings');
      return (response['data'] as List).map((e)=>ToppingModel.fromJson(e)).toList();
     }catch(e){
      print(e.toString());
      return [];
     }
  }
  //get sideOptions
  Future<List<ToppingModel>> getSideOptions() async{
    try{
      final response=await apiService.get('/side-options');
      return (response['data'] as List).map((e)=>ToppingModel.fromJson(e)).toList();
    }catch(e){
      print(e.toString());
      return [];
    }
  }
}