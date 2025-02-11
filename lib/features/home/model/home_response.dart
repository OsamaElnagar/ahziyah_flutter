class HomeResponse {
  final String status;
  final HomeData data;

  HomeResponse({
    required this.status,
    required this.data,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        status: json['status'] ?? '',
        data: HomeData.fromJson(json['data'] ?? {}),
      );
}

class HomeData {
  final List<Category> categories;
  final List<Product> featuredProducts;
  final List<Product> latestProducts;
  final List<Product> popularProducts;

  HomeData({
    required this.categories,
    required this.featuredProducts,
    required this.latestProducts,
    required this.popularProducts,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
        categories: List<Category>.from(
          (json['categories'] ?? []).map(
            (x) => Category.fromJson(x),
          ),
        ),
        featuredProducts: List<Product>.from(
          (json['featured_products'] ?? []).map(
            (x) => Product.fromJson(x),
          ),
        ),
        latestProducts: List<Product>.from(
          (json['latest_products'] ?? []).map(
            (x) => Product.fromJson(x),
          ),
        ),
        popularProducts: List<Product>.from(
          (json['popular_products'] ?? []).map(
            (x) => Product.fromJson(x),
          ),
        ),
      );
}

class Product {
  final int id;
  final String name;
  final String slug;
  final Price price;
  final ProductImages images;
  final Brand brand;
  final Rating rating;
  final bool? isFeatured;
  final DateTime? createdAt;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.price,
    required this.brand,
    required this.images,
    required this.rating,
    this.isFeatured,
    this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        slug: json['slug'] ?? '',
        price: Price.fromJson(json['price'] ?? {}),
        images: ProductImages.fromJson(json['images'] ?? {}),
        rating: Rating.fromJson(json['rating'] ?? {}),
        isFeatured: json['is_featured'],
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'])
            : null,
        brand: Brand.fromJson(json['brand'] ?? {}),
      );
}

class Price {
  final double amount;
  final String formatted;
  final Discount? discounted;

  Price({
    required this.amount,
    required this.formatted,
    this.discounted,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: (json['amount'] ?? 0.0).toDouble(),
        formatted: json['formatted'] ?? '',
        discounted: json['discounted'] != null
            ? Discount.fromJson(json['discounted'])
            : null,
      );
}

class Discount {
  final double amount;
  final String formatted;
  final double percentage;
  final DateTime startDate;
  final DateTime endDate;

  Discount({
    required this.amount,
    required this.formatted,
    required this.percentage,
    required this.startDate,
    required this.endDate,
  });

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        amount: (json['amount'] ?? 0.0).toDouble(),
        formatted: json['formatted'] ?? '',
        percentage: (json['percentage'] ?? 0.0).toDouble(),
        startDate: DateTime.parse(json['start_date'] ?? ''),
        endDate: DateTime.parse(json['end_date'] ?? ''),
      );
}

class ProductImages {
  final String primary;

  ProductImages({
    required this.primary,
  });

  factory ProductImages.fromJson(Map<String, dynamic> json) => ProductImages(
        primary: json['primary'] ?? '',
      );
}

class Rating {
  final double average;
  final int count;

  Rating({
    required this.average,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: (json['average'] ?? 0.0).toDouble(),
        count: json['count'] ?? 0,
      );
}

class Category {
  final int id;
  final int productsCount;
  final String name;
  final String slug;
  final String logo;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.logo,
    required this.productsCount,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        slug: json['slug'] ?? '',
        logo: json['logo'] ?? '',
        productsCount: json['products_count'] ?? 0,
      );
}

class Brand {
  final int id;
  final int? productsCount;
  final String name;
  final String slug;
  final String? logo;

  Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.logo,
    required this.productsCount,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        slug: json['slug'] ?? '',
        logo: json['logo'] ?? '',
        productsCount: json['products_count'] ?? 0,
      );
}
