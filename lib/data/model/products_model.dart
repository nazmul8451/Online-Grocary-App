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
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['timestamp'] = this.timestamp;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Products>? products;
  Pagination? pagination;

  Data({this.products, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
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
  Null? stockQuantity;
  String? stockStatus;
  bool? isFeatured;
  bool? isActive;
  List<Images>? images;
  Category? category;
  Reviews? reviews;
  String? createdAt;
  String? updatedAt;

  Products(
      {this.id,
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
        this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    shortDescription = json['short_description'];
    price = json['price'];
    comparePrice = json['compare_price'];
    discountPercentage = json['discount_percentage'];
    stockQuantity = json['stock_quantity'];
    stockStatus = json['stock_status'];
    isFeatured = json['is_featured'];
    isActive = json['is_active'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    reviews =
    json['reviews'] != null ? new Reviews.fromJson(json['reviews']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    data['price'] = this.price;
    data['compare_price'] = this.comparePrice;
    data['discount_percentage'] = this.discountPercentage;
    data['stock_quantity'] = this.stockQuantity;
    data['stock_status'] = this.stockStatus;
    data['is_featured'] = this.isFeatured;
    data['is_active'] = this.isActive;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  void operator [](other) {}
}

class Images {
  String? id;
  String? url;
  String? alt;
  bool? isPrimary;

  Images({this.id, this.url, this.alt, this.isPrimary});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    alt = json['alt'];
    isPrimary = json['is_primary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['alt'] = this.alt;
    data['is_primary'] = this.isPrimary;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? slug;

  Category({this.id, this.name, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Reviews {
  int? averageRating;
  int? reviewCount;

  Reviews({this.averageRating, this.reviewCount});

  Reviews.fromJson(Map<String, dynamic> json) {
    averageRating = json['average_rating'];
    reviewCount = json['review_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average_rating'] = this.averageRating;
    data['review_count'] = this.reviewCount;
    return data;
  }
}

class Pagination {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;
  Links? links;

  Pagination(
      {this.total,
        this.count,
        this.perPage,
        this.currentPage,
        this.totalPages,
        this.links});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    return data;
  }
}

class Links {
  String? first;
  String? last;
  Null? prev;
  Null? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}
