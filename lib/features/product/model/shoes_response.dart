class ProductResponse {
  final String status;
  final ProductData data;

  ProductResponse({
    required this.status,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        status: json['status'] ?? '',
        data: ProductData.fromJson(json['data'] ?? {}),
      );
}

class ProductData {
  final Product product;
  final RelatedProducts relatedProducts;

  ProductData({
    required this.product,
    required this.relatedProducts,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        product: Product.fromJson(json['product'] ?? {}),
        relatedProducts:
            RelatedProducts.fromJson(json['related_products'] ?? {}),
      );
}

class RelatedProducts {
  final CategoryProducts category;
  final BrandProducts brand;
  final PriceRangeProducts priceRange;

  RelatedProducts({
    required this.category,
    required this.brand,
    required this.priceRange,
  });

  factory RelatedProducts.fromJson(Map<String, dynamic> json) =>
      RelatedProducts(
        category: CategoryProducts.fromJson(json['category'] ?? {}),
        brand: BrandProducts.fromJson(json['brand'] ?? {}),
        priceRange: PriceRangeProducts.fromJson(json['price_range'] ?? {}),
      );
}

class Product {
  final int id;
  final String name;
  final String slug;
  final String description;
  final Price price;
  final Images images;
  final Category category;
  final Brand brand;
  final bool isFeatured;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<SizeShoes> sizes;
  final List<Review> reviews;
  final Rating rating;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.price,
    required this.images,
    required this.category,
    required this.brand,
    required this.isFeatured,
    required this.createdAt,
    required this.updatedAt,
    required this.sizes,
    required this.reviews,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        slug: json['slug'] ?? '',
        description: json['description'] ?? '',
        price: Price.fromJson(json['price'] ?? {}),
        images: Images.fromJson(json['images'] ?? {}),
        category: Category.fromJson(json['category'] ?? {}),
        brand: Brand.fromJson(json['brand'] ?? {}),
        isFeatured: json['is_featured'] ?? false,
        createdAt:
            DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
        updatedAt:
            DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
        sizes: List<SizeShoes>.from(
          (json['sizes'] ?? []).map((x) => SizeShoes.fromJson(x)),
        ),
        reviews: List<Review>.from(
          (json['reviews'] ?? []).map((x) => Review.fromJson(x)),
        ),
        rating: Rating.fromJson(json['rating'] ?? {'average': 0, 'count': 0}),
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
        amount: (json['amount'] ?? 0).toDouble(),
        formatted: json['formatted'] ?? '',
        discounted: json['discounted'] == null
            ? null
            : Discount.fromJson(json['discounted']),
      );
}

class Discount {
  final double amount;
  final String formatted;
  final int percentage;
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
        amount: (json['amount'] ?? 0).toDouble(),
        formatted: json['formatted'] ?? '',
        percentage: json['percentage'] ?? 0,
        startDate:
            DateTime.tryParse(json['start_date'] ?? '') ?? DateTime.now(),
        endDate: DateTime.tryParse(json['end_date'] ?? '') ?? DateTime.now(),
      );
}

class Images {
  final String primary;
  final Map<String, String> all;

  Images({
    required this.primary,
    required this.all,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        primary: json['primary'] ?? '',
        all: Map<String, String>.from(json['all'] ?? {}),
      );
}

class Category {
  final int id;
  final String name;
  final String slug;

  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        slug: json['slug'] ?? '',
      );
}

class Brand {
  final int id;
  final String name;
  final String slug;

  Brand({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        slug: json['slug'] ?? '',
      );
}

class SizeShoes {
  final int id;
  final String name, region;
  final int stockQuantity;
  final bool isActive;

  SizeShoes({
    required this.id,
    required this.name,
    required this.region,
    required this.stockQuantity,
    required this.isActive,
  });

  factory SizeShoes.fromJson(Map<String, dynamic> json) => SizeShoes(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        region: json['region'] ?? '',
        stockQuantity: json['stock_quantity'] ?? 0,
        isActive: json['is_active'] == 1,
      );
}

class Review {
  final int id;
  final int rating;
  final String comment;
  final DateTime createdAt;
  final User user;

  Review({
    required this.id,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json['id'] ?? 0,
        rating: json['rating'] ?? 0,
        comment: json['comment'] ?? '',
        createdAt:
            DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
        user: User.fromJson(json['user'] ?? {}),
      );
}

class User {
  final int id;
  final String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
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
        average: (json['average'] ?? 0).toDouble(),
        count: json['count'] ?? 0,
      );
}

class CategoryProducts {
  final String title;
  final List<Product> products;

  CategoryProducts({
    required this.title,
    required this.products,
  });

  factory CategoryProducts.fromJson(Map<String, dynamic> json) =>
      CategoryProducts(
        title: json['title'] ?? '',
        products: List<Product>.from(
          (json['products'] ?? []).map((x) => Product.fromJson(x)),
        ),
      );
}

class BrandProducts {
  final String title;
  final List<Product> products;

  BrandProducts({
    required this.title,
    required this.products,
  });

  factory BrandProducts.fromJson(Map<String, dynamic> json) => BrandProducts(
        title: json['title'] ?? '',
        products: List<Product>.from(
          (json['products'] ?? []).map((x) => Product.fromJson(x)),
        ),
      );
}

class PriceRangeProducts {
  final String title;
  final List<Product> products;

  PriceRangeProducts({
    required this.title,
    required this.products,
  });

  factory PriceRangeProducts.fromJson(Map<String, dynamic> json) =>
      PriceRangeProducts(
        title: json['title'] ?? '',
        products: List<Product>.from(
          (json['products'] ?? []).map((x) => Product.fromJson(x)),
        ),
      );
}







/*
request: {{doman}}/products/nike-cortez-vintage-suede
response: 
{
    "status": "success",
    "data": {
        "product": {
            "id": 6,
            "name": "Nike Cortez Vintage Suede",
            "slug": "nike-cortez-vintage-suede",
            "description": "You spoke. We listened. Based on your feedback, we've revamped the original Cortez while maintaining the retro appeal you know and love. Now with a wider toe area and firmer side panels, you can comfortably wear them day in and day out. Plus, re-engineered materials help prevent warping or creasing. Cortez fans—this one's for you.\r\nColour Shown: Summit White/Muslin/Gum Medium Brown/Black\r\nStyle: FJ2530-102",
            "price": {
                "amount": 529,
                "formatted": "$529.00",
                "discounted": {
                    "amount": 370.29999999999995,
                    "formatted": "$370.30",
                    "percentage": 30,
                    "start_date": "2025-02-08T00:00:00.000000Z",
                    "end_date": "2025-02-10T00:00:00.000000Z"
                }
            },
            "images": {
                "primary": "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwc4dd8ca1/nk/447/6/8/4/7/f/4476847f_411d_4068_9184_b276c703d74b.jpg?sw=700&sh=700&sm=fit&q=100&strip=false",
                "all": {
                    "image_one": "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwc4dd8ca1/nk/447/6/8/4/7/f/4476847f_411d_4068_9184_b276c703d74b.jpg?sw=700&sh=700&sm=fit&q=100&strip=false",
                    "image_two": "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw296b5325/nk/8a1/8/a/5/4/3/8a18a543_9a03_4744_92ce_442cd16be885.jpg?sw=700&sh=700&sm=fit&q=100&strip=false",
                    "image_three": "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw0357fdc5/nk/f5f/3/4/5/f/3/f5f345f3_5ee3_4cf1_be35_01c5267cd626.jpg?sw=700&sh=700&sm=fit&q=100&strip=false",
                    "image_four": "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw0acd8488/nk/fcb/1/9/0/5/e/fcb1905e_36bb_433a_a036_be0da7899368.jpg?sw=700&sh=700&sm=fit&q=100&strip=false",
                    "image_five": "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw5b2dab3f/nk/90e/6/9/5/5/6/90e69556_f29b_4654_a384_aa0295cee02d.jpg?sw=700&sh=700&sm=fit&q=100&strip=false",
                    "image_six": "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwe4f8d93e/nk/f69/1/8/3/0/0/f6918300_6677_4afd_8d8a_d677fd09ddd8.jpg?sw=700&sh=700&sm=fit&q=100&strip=false"
                }
            },
            "category": {
                "id": 2,
                "name": "Women",
                "slug": "women"
            },
            "brand": {
                "id": 2,
                "name": "Nike",
                "slug": "nike"
            },
            "is_featured": true,
            "created_at": "2025-01-26T20:59:00.000000Z",
            "updated_at": "2025-01-26T20:59:43.000000Z",
            "sizes": [
                {
                    "id": 1,
                    "name": "36",
                    "stock_quantity": 12,
                    "is_active": 1
                },
                {
                    "id": 2,
                    "name": "36.5",
                    "stock_quantity": 12,
                    "is_active": 1
                },
                {
                    "id": 3,
                    "name": "37",
                    "stock_quantity": 12,
                    "is_active": 1
                },
                {
                    "id": 4,
                    "name": "37.5",
                    "stock_quantity": 12,
                    "is_active": 1
                },
                {
                    "id": 5,
                    "name": "38",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 6,
                    "name": "38.5",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 7,
                    "name": "39",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 8,
                    "name": "39.5",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 9,
                    "name": "40",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 10,
                    "name": "40.5",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 11,
                    "name": "41",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 12,
                    "name": "41.5",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 13,
                    "name": "42",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 14,
                    "name": "42.5",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 15,
                    "name": "3",
                    "stock_quantity": 12,
                    "is_active": 1
                },
                {
                    "id": 16,
                    "name": "3.5",
                    "stock_quantity": 12,
                    "is_active": 1
                },
                {
                    "id": 17,
                    "name": "4",
                    "stock_quantity": 12,
                    "is_active": 1
                },
                {
                    "id": 18,
                    "name": "4.5",
                    "stock_quantity": 12,
                    "is_active": 1
                },
                {
                    "id": 19,
                    "name": "5",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 20,
                    "name": "5.5",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 21,
                    "name": "6",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 22,
                    "name": "6.5",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 23,
                    "name": "7",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 24,
                    "name": "7.5",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 25,
                    "name": "8",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 26,
                    "name": "8.5",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 27,
                    "name": "5",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 28,
                    "name": "5.5",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 29,
                    "name": "6",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 30,
                    "name": "6.5",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 31,
                    "name": "7",
                    "stock_quantity": 12,
                    "is_active": 1
                },
                {
                    "id": 32,
                    "name": "7.5",
                    "stock_quantity": 2,
                    "is_active": 1
                },
                {
                    "id": 33,
                    "name": "8",
                    "stock_quantity": 12,
                    "is_active": 1
                },
                {
                    "id": 34,
                    "name": "8.5",
                    "stock_quantity": 12,
                    "is_active": 1
                },
                {
                    "id": 35,
                    "name": "9",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 36,
                    "name": "9.5",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 37,
                    "name": "10",
                    "stock_quantity": 0,
                    "is_active": 1
                },
                {
                    "id": 38,
                    "name": "10.5",
                    "stock_quantity": 0,
                    "is_active": 1
                }
            ],
            "reviews": [
                {
                    "id": 1,
                    "rating": 4,
                    "comment": "First Review test",
                    "created_at": "2025-01-26T21:11:24.000000Z",
                    "user": {
                        "id": 20,
                        "name": "Admin"
                    }
                }
            ]
        },
        "related_products": {
            "category": {
                "title": "Similar Products",
                "products": [
                    {
                        "id": 3,
                        "name": "OZWEEGO Shoes",
                        "slug": "ozweego-shoes",
                        "price": {
                            "amount": 129,
                            "formatted": "$129.00"
                        },
                        "images": {
                            "primary": "https://assets.adidas.com/images/w_1880,f_auto,q_auto/04c768e54ae4492792cbadf000b5ab1a_9366/GY6177_01_standard.jpg"
                        },
                        "category": {
                            "id": 2,
                            "name": "Women",
                            "slug": "women"
                        },
                        "brand": {
                            "id": 1,
                            "name": "Adidas",
                            "slug": "adidas"
                        },
                        "rating": {
                            "average": 5,
                            "count": 1
                        },
                        "created_at": "2025-01-26T20:46:45.000000Z"
                    },
                    {
                        "id": 4,
                        "name": "Nike Air Force 1 'Animal Pack'",
                        "slug": "nike-air-force-1-animal-pack",
                        "price": {
                            "amount": 600,
                            "formatted": "$600.00"
                        },
                        "images": {
                            "primary": "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwd8c41e78/nk/3ae/4/d/a/e/0/3ae4dae0_fd86_4b08_b764_ec8a76ca4f4f.png?sw=700&sh=700&sm=fit&q=100&strip=false"
                        },
                        "category": {
                            "id": 2,
                            "name": "Women",
                            "slug": "women"
                        },
                        "brand": {
                            "id": 2,
                            "name": "Nike",
                            "slug": "nike"
                        },
                        "rating": {
                            "average": 5,
                            "count": 1
                        },
                        "created_at": "2025-01-26T20:53:00.000000Z"
                    },
                    {
                        "id": 5,
                        "name": "Nike Cortez",
                        "slug": "nike-cortez",
                        "price": {
                            "amount": 529,
                            "formatted": "$529.00"
                        },
                        "images": {
                            "primary": "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwa4d95bf7/nk/a6f/b/b/5/0/3/a6fbb503_58ee_4373_b324_dc42266c65b3.png?sw=700&sh=700&sm=fit&q=100&strip=false"
                        },
                        "category": {
                            "id": 2,
                            "name": "Women",
                            "slug": "women"
                        },
                        "brand": {
                            "id": 2,
                            "name": "Nike",
                            "slug": "nike"
                        },
                        "rating": {
                            "average": 5,
                            "count": 1
                        },
                        "created_at": "2025-01-26T20:56:58.000000Z"
                    },
                    {
                        "id": 9,
                        "name": "Arch Fit Arcade - Arcata",
                        "slug": "arch-fit-arcade-arcata",
                        "price": {
                            "amount": 70,
                            "formatted": "$70.00"
                        },
                        "images": {
                            "primary": "https://www.skechers.com/dw/image/v2/BDCN_PRD/on/demandware.static/-/Sites-skechers-master/default/dwe5697bcf/images/large/177195_PNK.jpg"
                        },
                        "category": {
                            "id": 2,
                            "name": "Women",
                            "slug": "women"
                        },
                        "brand": {
                            "id": 4,
                            "name": "Skechers",
                            "slug": "skechers"
                        },
                        "rating": {
                            "average": 0,
                            "count": 0
                        },
                        "created_at": "2025-01-28T05:15:38.000000Z"
                    }
                ]
            },
            "brand": {
                "title": "More from Nike",
                "products": [
                    {
                        "id": 4,
                        "name": "Nike Air Force 1 'Animal Pack'",
                        "slug": "nike-air-force-1-animal-pack",
                        "price": {
                            "amount": 600,
                            "formatted": "$600.00"
                        },
                        "images": {
                            "primary": "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwd8c41e78/nk/3ae/4/d/a/e/0/3ae4dae0_fd86_4b08_b764_ec8a76ca4f4f.png?sw=700&sh=700&sm=fit&q=100&strip=false"
                        },
                        "category": {
                            "id": 2,
                            "name": "Women",
                            "slug": "women"
                        },
                        "brand": {
                            "id": 2,
                            "name": "Nike",
                            "slug": "nike"
                        },
                        "rating": {
                            "average": 5,
                            "count": 1
                        },
                        "created_at": "2025-01-26T20:53:00.000000Z"
                    },
                    {
                        "id": 5,
                        "name": "Nike Cortez",
                        "slug": "nike-cortez",
                        "price": {
                            "amount": 529,
                            "formatted": "$529.00"
                        },
                        "images": {
                            "primary": "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwa4d95bf7/nk/a6f/b/b/5/0/3/a6fbb503_58ee_4373_b324_dc42266c65b3.png?sw=700&sh=700&sm=fit&q=100&strip=false"
                        },
                        "category": {
                            "id": 2,
                            "name": "Women",
                            "slug": "women"
                        },
                        "brand": {
                            "id": 2,
                            "name": "Nike",
                            "slug": "nike"
                        },
                        "rating": {
                            "average": 5,
                            "count": 1
                        },
                        "created_at": "2025-01-26T20:56:58.000000Z"
                    }
                ]
            },
            "price_range": {
                "title": "Products in Similar Price Range",
                "products": [
                    {
                        "id": 4,
                        "name": "Nike Air Force 1 'Animal Pack'",
                        "slug": "nike-air-force-1-animal-pack",
                        "price": {
                            "amount": 600,
                            "formatted": "$600.00"
                        },
                        "images": {
                            "primary": "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwd8c41e78/nk/3ae/4/d/a/e/0/3ae4dae0_fd86_4b08_b764_ec8a76ca4f4f.png?sw=700&sh=700&sm=fit&q=100&strip=false"
                        },
                        "category": {
                            "id": 2,
                            "name": "Women",
                            "slug": "women"
                        },
                        "brand": {
                            "id": 2,
                            "name": "Nike",
                            "slug": "nike"
                        },
                        "rating": {
                            "average": 5,
                            "count": 1
                        },
                        "created_at": "2025-01-26T20:53:00.000000Z"
                    },
                    {
                        "id": 5,
                        "name": "Nike Cortez",
                        "slug": "nike-cortez",
                        "price": {
                            "amount": 529,
                            "formatted": "$529.00"
                        },
                        "images": {
                            "primary": "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dwa4d95bf7/nk/a6f/b/b/5/0/3/a6fbb503_58ee_4373_b324_dc42266c65b3.png?sw=700&sh=700&sm=fit&q=100&strip=false"
                        },
                        "category": {
                            "id": 2,
                            "name": "Women",
                            "slug": "women"
                        },
                        "brand": {
                            "id": 2,
                            "name": "Nike",
                            "slug": "nike"
                        },
                        "rating": {
                            "average": 5,
                            "count": 1
                        },
                        "created_at": "2025-01-26T20:56:58.000000Z"
                    }
                ]
            }
        }
    }
}
 */