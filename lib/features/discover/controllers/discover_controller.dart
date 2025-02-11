import 'package:ahziyah_flutter/features/discover/repo/dicover_repo.dart';
import 'package:get/get.dart' hide Response;
import 'package:pretty_logger/pretty_logger.dart';

import '../../../models/pagination.dart';
import '../../home/model/home_response.dart';
import '../models/filter_options.dart';

class DiscoverController extends GetxController {
  final DicoverRepo repo;

  DiscoverController({required this.repo});

  final _filterOptions = Rxn<FilterOptions>();
  FilterOptions? get filterOptions => _filterOptions.value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _selectedBrands = <int>[].obs;
  List<int> get selectedBrands => _selectedBrands;

  final _selectedCategories = <int>[].obs;
  List<int> get selectedCategories => _selectedCategories;

  final _selectedSizes = <int>[].obs;
  List<int> get selectedSizes => _selectedSizes;

  final _priceRange = Rx<RxPair<double, double>>(RxPair(0.0, 1000.0));
  Rx<RxPair<double, double>> get priceRange => _priceRange;

  final _searchQuery = ''.obs;
  String get searchQuery => _searchQuery.value;

  final _selectedSort = 'newest'.obs;
  String get selectedSort => _selectedSort.value;

  final _products = <Product>[].obs;
  List<Product> get products => _products;

  final _pagination = Rxn<Pagination>();
  Pagination? get pagination => _pagination.value;

  @override
  void onInit() {
    super.onInit();
    getFilterOptions();
    getProducts();
  }

  Future<void> getFilterOptions() async {
    try {
      final response = await repo.filterOptions();
      _filterOptions.value = FilterOptions.fromJson(response.data['data']);
    } catch (e) {
      PLog.error(e.toString());
    }
    // update();
  }

  Future<void> getProducts() async {
    try {
      _isLoading.value = true;
      final response = await repo.getProducts(
        brands: selectedBrands,
        categories: selectedCategories,
        sizes: selectedSizes,
        sort: selectedSort,
        minPrice: priceRange.value.first,
        maxPrice: priceRange.value.second,
      );

      final data = response.data['data'];
      _products.assignAll(
          (data['products'] as List).map((p) => Product.fromJson(p)).toList());
      _pagination.value = Pagination.fromJson(data['pagination']);
    } catch (e) {
      PLog.error('Error fetching products: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  void toggleBrand(int brandId) {
    if (_selectedBrands.contains(brandId)) {
      _selectedBrands.remove(brandId);
    } else {
      _selectedBrands.add(brandId);
    }
  }

  void toggleCategory(int categoryId) {
    if (_selectedCategories.contains(categoryId)) {
      _selectedCategories.remove(categoryId);
    } else {
      _selectedCategories.add(categoryId);
    }
  }

  void toggleSize(int sizeId) {
    if (_selectedSizes.contains(sizeId)) {
      _selectedSizes.remove(sizeId);
    } else {
      _selectedSizes.add(sizeId);
    }
  }

  void updatePriceRange(double min, double max) {
    _priceRange.value = RxPair(min, max);
  }

  void updateSearchQuery(String query) {
    _searchQuery.value = query;
  }

  void updateSort(String sort) {
    _selectedSort.value = sort;
  }

  Future<void> applyFilters() async {
    try {
      _isLoading.value = true;
      final response = await repo.getProducts(
        search: searchQuery,
        brands: selectedBrands,
        categories: selectedCategories,
        sizes: selectedSizes,
        minPrice: priceRange.value.first,
        maxPrice: priceRange.value.second,
        sort: selectedSort,
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];
        _products.value =
            (data['products'] as List).map((p) => Product.fromJson(p)).toList();
        _pagination.value = Pagination.fromJson(data['pagination']);
      }
    } catch (e) {
      PLog.error('Error applying filters: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  void clearFilters() {
    _selectedBrands.clear();
    _selectedCategories.clear();
    _selectedSizes.clear();
    _searchQuery.value = '';
    _selectedSort.value = 'newest';
    if (_filterOptions.value != null) {
      _priceRange.value = RxPair(
        _filterOptions.value!.priceRange.min,
        _filterOptions.value!.priceRange.max,
      );
    }
  }
}

class RxPair<T, U> {
  T first;
  U second;

  RxPair(this.first, this.second);
}
