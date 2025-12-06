
class CartModel {
  final int id;
  final int quantity;
  final double spicy;
  final List<int> toppings;
  final List<int> sideOptions;

  CartModel({required this.id, required this.quantity, required this.spicy, required this.toppings, required this.sideOptions});
  Map<String,dynamic> toJson()=>{
    'product_id':id,
    'quantity':quantity,
    'spicy':spicy,
    'toppings':toppings,
    'side_options':sideOptions
  };
}
class CartRequestModel {
  final List<CartModel> items;
  CartRequestModel({required this.items});
  Map<String,dynamic> toJSon()=>{
    'items':items.map((e)=>e.toJson()).toList(),
  };
}
class GetCartResponseModel{
  final int statusCode;
  final String message;
  final CartDataModel cartData;

  GetCartResponseModel({required this.statusCode, required this.message, required this.cartData});
  factory GetCartResponseModel.fromJson(Map<String,dynamic>json){
    return GetCartResponseModel(
      statusCode: json['code'],
      message: json['message'],
      cartData: CartDataModel.fromJson(json['data']),
      );
  }

}
class CartDataModel{
  final int id;
  final String totalPrice;
  final List<CartItemModel> items;

  CartDataModel({required this.id, required this.totalPrice, required this.items});
  factory CartDataModel.fromJson(Map<String,dynamic>json){
    return CartDataModel(
      id: json['id'],
      totalPrice: json['total_price'],
      items: (json['items'] as List).map((e)=>CartItemModel.fromJson(e)).toList(),
      );
  }
}
class CartItemModel{
  final int itemId;
  final int productId;
  final String name;
  final String image;
  final int quantity;
  final String price;
  final double spicy;
  final List<ToppingsOptionsModel>toppings;
  final List<ToppingsOptionsModel>sideOptions;

  CartItemModel({required this.itemId, required this.productId, required this.name, required this.image, required this.quantity, required this.price, required this.spicy, required this.toppings, required this.sideOptions});
  factory CartItemModel.fromJson(Map<String,dynamic>json){
    return CartItemModel(
      itemId: json['item_id'],
      productId: json['product_id'],
      name: json['name'],
      image: json['image'],
      quantity: json['quantity'],
      price: json['price'].toString(),
      spicy: double.tryParse(json['spicy'].toString())??0.0,
      toppings: (json['toppings'] as List).map((e)=>ToppingsOptionsModel.fromJSon(e)).toList() ,
      sideOptions: (json['side_options'] as List).map((e)=>ToppingsOptionsModel.fromJSon(e)).toList(),
      );
  }
}
class ToppingsOptionsModel{
  final int id;
  final String name;
  final String image;

  ToppingsOptionsModel({required this.id, required this.name, required this.image});
  factory ToppingsOptionsModel.fromJSon(Map<String,dynamic> json){
    return ToppingsOptionsModel(
      id: json['id'],
      name: json['name'],
      image: json['image']
      );
  }
}