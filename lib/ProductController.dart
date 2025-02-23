import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restapi2nd/Urls.dart';

class ProductController {

  List productList = [];

Future<void> fetchProduct()async{
  final response = await http.get(Uri.parse(Urls.readUrl));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    productList = data['data'];
  }
}

Future<void> createProduct(String name, String image, int quantity, int price, int totalPrice) async {
  final response = await http.post(Uri.parse(Urls.createProductUrl),
  headers: {'Content-Type' : 'application/json'},
    body: jsonEncode({
      "ProductName": name,
      "ProductCode": DateTime.now().millisecondsSinceEpoch,
      "Img": image,
      "Qty": quantity,
      "UnitPrice": price,
      "TotalPrice": totalPrice,})
  );
  if(response.statusCode == 201){
    fetchProduct();

  }

}


}