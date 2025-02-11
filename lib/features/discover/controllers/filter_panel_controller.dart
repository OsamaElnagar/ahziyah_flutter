import 'package:ahziyah_flutter/features/discover/controllers/discover_controller.dart';
import 'package:ahziyah_flutter/features/discover/models/filter_options.dart';
import 'package:ahziyah_flutter/utils/responsive.dart';
import 'package:get/get.dart';

class FilterPanelController extends GetxController {
  final DiscoverController discoverController;

  FilterPanelController({required this.discoverController});

  final _selectedBrands = <int>[].obs;
  final _selectedCategories = <int>[].obs;
  final _selectedSizes = <int>[].obs;
  final _selectedSort = ''.obs;

  double get minPrice => discoverController.filterOptions?.priceRange.min ?? 0;
  double get maxPrice => discoverController.filterOptions?.priceRange.max ?? 0;
  List<Brand> get brands => discoverController.filterOptions?.brands ?? [];
  List<Category> get categories =>
      discoverController.filterOptions?.categories ?? [];
  Map<String, List<Size>> get sizes =>
      discoverController.filterOptions?.sizes ?? {};
  List<SortOption> get sortOptions =>
      discoverController.filterOptions?.sortOptions ?? [];

  List<int> get selectedBrands => _selectedBrands;
  List<int> get selectedCategories => _selectedCategories;
  List<int> get selectedSizes => _selectedSizes;
  String get selectedSort => _selectedSort.value;

  @override
  void onInit() {
    super.onInit();
    _selectedSort.value = discoverController.selectedSort;
    _selectedBrands.assignAll(discoverController.selectedBrands);
    _selectedCategories.assignAll(discoverController.selectedCategories);
    _selectedSizes.assignAll(discoverController.selectedSizes);
  }

  void toggleBrand(int brandId) {
    if (_selectedBrands.contains(brandId)) {
      _selectedBrands.remove(brandId);
    } else {
      _selectedBrands.add(brandId);
    }
    discoverController.toggleBrand(brandId);
  }

  void toggleCategory(int categoryId) {
    if (_selectedCategories.contains(categoryId)) {
      _selectedCategories.remove(categoryId);
    } else {
      _selectedCategories.add(categoryId);
    }
    discoverController.toggleCategory(categoryId);
  }

  void toggleSize(int sizeId) {
    if (_selectedSizes.contains(sizeId)) {
      _selectedSizes.remove(sizeId);
    } else {
      _selectedSizes.add(sizeId);
    }
    discoverController.toggleSize(sizeId);
  }

  void updateSort(String sort) {
    _selectedSort.value = sort;
    discoverController.updateSort(sort);
  }

  void clearAll() {
    _selectedBrands.clear();
    _selectedCategories.clear();
    _selectedSizes.clear();
    _selectedSort.value = 'newest';
    discoverController.clearFilters();
  }

  void updatePriceRange(double min, double max) {
    discoverController.updatePriceRange(min, max);

    update();
  }

  void applyFilters() {
    discoverController.applyFilters();
    if (Responsive.isMobile(Get.context!)) {
      Get.back(); // Close drawer on mobile
    }
    update();
  }
}
