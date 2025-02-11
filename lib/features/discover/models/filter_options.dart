class FilterOptions {
  final List<Category> categories;
  final List<Brand> brands;
  final Map<String, List<Size>> sizes;
  final PriceRange priceRange;
  final List<SortOption> sortOptions;

  FilterOptions({
    required this.categories,
    required this.brands,
    required this.sizes,
    required this.priceRange,
    required this.sortOptions,
  });

  factory FilterOptions.fromJson(Map<String, dynamic> json) => FilterOptions(
        categories: List<Category>.from(
          (json['categories'] ?? []).map((x) => Category.fromJson(x)),
        ),
        brands: List<Brand>.from(
          (json['brands'] ?? []).map((x) => Brand.fromJson(x)),
        ),
        sizes: Map<String, List<Size>>.from(
          (json['sizes'] ?? {}).map(
            (key, value) => MapEntry(
              key,
              List<Size>.from(value.map((x) => Size.fromJson(x))),
            ),
          ),
        ),
        priceRange: PriceRange.fromJson(json['price_range'] ?? {}),
        sortOptions: List<SortOption>.from(
          (json['sort_options'] ?? []).map((x) => SortOption.fromJson(x)),
        ),
      );
}

class PriceRange {
  final double min;
  final double max;

  PriceRange({required this.min, required this.max});

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
        min: (json['min'] ?? 0).toDouble(),
        max: (json['max'] ?? 1000).toDouble(),
      );
}

class Brand {
  final int id;
  final String name;
  final String slug;
  final int productsCount;

  Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.productsCount,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      productsCount: json['products_count'],
    );
  }
}

class Category {
  final int id;
  final String name;
  final String slug;
  final int productsCount;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.productsCount,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      productsCount: json['products_count'],
    );
  }
}

class Size {
  final int id;
  final String name;
  final String region;

  Size({
    required this.id,
    required this.name,
    required this.region,
  });

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      id: json['id'],
      name: json['name'],
      region: json['region'],
    );
  }
}

class SortOption {
  final String key;
  final String label;

  SortOption({required this.key, required this.label});

  factory SortOption.fromJson(Map<String, dynamic> json) => SortOption(
        key: json['key'] ?? '',
        label: json['label'] ?? '',
      );
}
