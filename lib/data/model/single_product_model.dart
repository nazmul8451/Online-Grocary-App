class SingleProductModel {
  final int id;
  final String name;
  final String? price;
  final String? regularPrice;
  final String? salePrice;
  final bool onSale;
  final String? image;
  final String? rating;
  final int? reviewCount;
  final String? stockStatus;
  final bool inStock;
  final String? description;
  final String? shortDescription;
  final String? sku;
  final String? type;
  final List<dynamic> attributes;
  final List<dynamic> galleryImages;
  final List<Category> categories;
  final List<dynamic> variations;

  SingleProductModel({
    required this.id,
    required this.name,
    this.price,
    this.regularPrice,
    this.salePrice,
    required this.onSale,
    this.image,
    this.rating,
    this.reviewCount,
    this.stockStatus,
    required this.inStock,
    this.description,
    this.shortDescription,
    this.sku,
    this.type,
    required this.attributes,
    required this.galleryImages,
    required this.categories,
    required this.variations,
  });

  factory SingleProductModel.fromJson(Map<String, dynamic> json) {
    return SingleProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: json['price'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      onSale: json['on_sale'] ?? false,
      image: json['image'],
      rating: json['rating'],
      reviewCount: json['review_count'],
      stockStatus: json['stock_status'],
      inStock: json['in_stock'] ?? false,
      description: json['description'],
      shortDescription: json['short_description'],
      sku: json['sku'],
      type: json['type'],
      attributes: json['attributes'] ?? [],
      galleryImages: json['gallery_images'] ?? [],
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e))
          .toList() ??
          [],
      variations: json['variations'] ?? [],
    );
  }
}

class Category {
  final int id;
  final String name;
  final String slug;

  Category({required this.id, required this.name, required this.slug});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
    );
  }
}
