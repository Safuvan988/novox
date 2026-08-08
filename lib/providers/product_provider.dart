import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _service = ProductService();

  List<Product> products = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> fetchProducts() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      products = await _service.fetchProducts();
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
