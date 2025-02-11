import 'package:ahziyah_flutter/services/dio_client.dart';
import 'package:dio/dio.dart';

class DicoverRepo {
  final DioClient dioClient;

  DicoverRepo({required this.dioClient});

  Future<Response> filterOptions() async {
    return await dioClient.getData('/products/filters');
  }

  Future<Response> getProducts({
    String? search,
    List<int>? brands,
    List<int>? categories,
    List<int>? sizes,
    double? minPrice,
    double? maxPrice,
    String? sort,
    int page = 1,
  }) async {
    final queryParameters = {
      if (search != null && search.isNotEmpty) 'search': search,
      if (brands != null && brands.isNotEmpty) 'brands': brands.join(','),
      if (categories != null && categories.isNotEmpty)
        'categories': categories.join(','),
      if (sizes != null && sizes.isNotEmpty) 'sizes': sizes.join(','),
      if (minPrice != null) 'min_price': minPrice.toString(),
      if (maxPrice != null) 'max_price': maxPrice.toString(),
      if (sort != null) 'sort': sort,
      'page': page.toString(),
    };

    return await dioClient.getData('/products',
        queryParameters: queryParameters);
  }
}
