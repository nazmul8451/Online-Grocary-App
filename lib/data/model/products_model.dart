class ProductModel {
  bool? success; // পূর্বে ছিল String? status
  String? message;
  Data? data;

  ProductModel({this.success, this.message, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['success'] = success;
    map['message'] = message;
    if (data != null) map['data'] = data!.toJson();
    return map;
  }
}

class Data {
  List<Products>? products;
  Pagination? pagination;

  Data({this.products, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products =
          (json['products'] as List).map((e) => Products.fromJson(e)).toList();
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    if (products != null) {
      map['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) map['pagination'] = pagination!.toJson();
    return map;
  }
}

class Products {
  int? id;
  String? name;
  double? price;
  double? regularPrice;
  double? salePrice;
  bool? onSale;
  String? image;
  double? rating;
  int? reviewCount;
  String? stockStatus;
  bool? inStock;

  Products({
    this.id,
    this.name,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.onSale,
    this.image,
    this.rating,
    this.reviewCount,
    this.stockStatus,
    this.inStock,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? '';
    price = double.tryParse(json['price']?.toString() ?? '0') ?? 0;
    regularPrice = double.tryParse(json['regular_price']?.toString() ?? '0') ?? 0;
    salePrice = double.tryParse(json['sale_price']?.toString() ?? '0') ?? 0;
    onSale = json['on_sale'] ?? false;
    image = json['image'] ?? '';
    rating = double.tryParse(json['rating']?.toString() ?? '0') ?? 0;
    reviewCount = json['review_count'] ?? 0;
    stockStatus = json['stock_status'] ?? '';
    inStock = json['in_stock'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['name'] = name;
    map['price'] = price;
    map['regular_price'] = regularPrice;
    map['sale_price'] = salePrice;
    map['on_sale'] = onSale;
    map['image'] = image;
    map['rating'] = rating;
    map['review_count'] = reviewCount;
    map['stock_status'] = stockStatus;
    map['in_stock'] = inStock;
    return map;
  }
}

class Pagination {
  int? currentPage;
  int? perPage;
  int? totalProducts;
  int? totalPages;
  bool? hasNext;
  bool? hasPrev;

  Pagination({
    this.currentPage,
    this.perPage,
    this.totalProducts,
    this.totalPages,
    this.hasNext,
    this.hasPrev,
  });

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    perPage = json['per_page'];
    totalProducts = json['total_products'];
    totalPages = json['total_pages'];
    hasNext = json['has_next'];
    hasPrev = json['has_prev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['current_page'] = currentPage;
    map['per_page'] = perPage;
    map['total_products'] = totalProducts;
    map['total_pages'] = totalPages;
    map['has_next'] = hasNext;
    map['has_prev'] = hasPrev;
    return map;
  }
}
