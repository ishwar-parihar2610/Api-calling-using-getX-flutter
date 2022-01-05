import 'package:get/state_manager.dart';
import 'package:provider_state/models/product.dart';
import 'package:provider_state/services/api_service.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    try{

    
    var product = await RemoteServices.fetchProdut();
    if (product != null) {
      productList.value = product;
    }
    } finally{
  isLoading(false);
    }
  
  }
}
