class ProductModel {
  String? status;
  String? message;
  String? timestamp;
  Data? data;

  ProductModel({this.status, this.message, this.timestamp, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    timestamp = json['timestamp'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['status'] = status;
    map['message'] = message;
    map['timestamp'] = timestamp;
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
      products = (json['products'] as List)
          .map((e) => Products.fromJson(e))
          .toList();
    }
    pagination =
        json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
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
  String? slug;
  String? description;
  String? shortDescription;
  double? price;
  double? comparePrice;
  int? discountPercentage;
  int? stockQuantity;
  String? stockStatus;
  bool? isFeatured;
  bool? isActive;
  List<Images>? images;
  Category? category;
  Reviews? reviews;
  String? createdAt;
  String? updatedAt;

  Products({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.shortDescription,
    this.price,
    this.comparePrice,
    this.discountPercentage,
    this.stockQuantity,
    this.stockStatus,
    this.isFeatured,
    this.isActive,
    this.images,
    this.category,
    this.reviews,
    this.createdAt,
    this.updatedAt,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? '';
    slug = json['slug'] ?? '';
    description = json['description'] ?? '';
    shortDescription = json['short_description'] ?? '';
    price = (json['price'] != null)
        ? double.tryParse(json['price'].toString()) ?? 0.0
        : 0.0;
    comparePrice = (json['compare_price'] != null)
        ? double.tryParse(json['compare_price'].toString()) ?? 0.0
        : 0.0;
    discountPercentage = json['discount_percentage'] ?? 0;
    stockQuantity = json['stock_quantity'] ?? 0;
    stockStatus = json['stock_status'] ?? '';
    isFeatured = json['is_featured'] ?? false;
    isActive = json['is_active'] ?? false;
    images = json['images'] != null
        ? (json['images'] as List).map((v) => Images.fromJson(v)).toList()
        : [];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    reviews = json['reviews'] != null ? Reviews.fromJson(json['reviews']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['description'] = description;
    map['short_description'] = shortDescription;
    map['price'] = price;
    map['compare_price'] = comparePrice;
    map['discount_percentage'] = discountPercentage;
    map['stock_quantity'] = stockQuantity;
    map['stock_status'] = stockStatus;
    map['is_featured'] = isFeatured;
    map['is_active'] = isActive;
    if (images != null) {
      map['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (category != null) map['category'] = category!.toJson();
    if (reviews != null) map['reviews'] = reviews!.toJson();
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class Images {
  String? id;
  String? url;
  String? alt;
  bool? isPrimary;

  Images({this.id, this.url, this.alt, this.isPrimary});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    url = json['url'] ?? '';
    alt = json['alt'] ?? '';
    isPrimary = json['is_primary'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['url'] = url;
    map['alt'] = alt;
    map['is_primary'] = isPrimary;
    return map;
  }
}

class Category {
  int? id;
  String? name;
  String? slug;

  Category({this.id, this.name, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? '';
    slug = json['slug'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    return map;
  }
}

class Reviews {
  double? averageRating;
  int? reviewCount;

  Reviews({this.averageRating, this.reviewCount});

  Reviews.fromJson(Map<String, dynamic> json) {
    averageRating = double.tryParse(json['average_rating'].toString()) ?? 0.0;
    reviewCount = json['review_count'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['average_rating'] = averageRating;
    map['review_count'] = reviewCount;
    return map;
  }
}

class Pagination {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;
  Links? links;

  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.links,
  });

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'] ?? 0;
    count = json['count'] ?? 0;
    perPage = json['per_page'] ?? 0;
    currentPage = json['current_page'] ?? 1;
    totalPages = json['total_pages'] ?? 1;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['total'] = total;
    map['count'] = count;
    map['per_page'] = perPage;
    map['current_page'] = currentPage;
    map['total_pages'] = totalPages;
    if (links != null) map['links'] = links!.toJson();
    return map;
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['first'] = first;
    map['last'] = last;
    map['prev'] = prev;
    map['next'] = next;
    return map;
  }
}
