
import 'package:http/http.dart' as http;
import 'package:provider_state/models/product.dart';
import 'package:provider_state/utils/strings.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>?> fetchProdut() async {

    var response = await client.get(Uri.parse(Strings.API_URL));
      print("status code : ${response.statusCode}");
    if (response.statusCode == 200) {
    
      var jsonString = response.body;
      print("response body:${jsonString}");
      return productFromJson(jsonString);
    } else {
      return null;
    }
  }
}
