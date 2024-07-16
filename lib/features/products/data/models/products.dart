import 'package:products_clean_code/features/products/domain/entities/product.dart';

class ProductsResponseDto {
  List<ProductsDto> products;
  int? total;
  int? skip;
  int? limit;

  ProductsResponseDto(
      {required this.products, this.total, this.skip, this.limit});

  factory ProductsResponseDto.fromJson(Map<String, dynamic> json) =>
      ProductsResponseDto(
          products:  (json['products'] as List<dynamic>)
          .map((e) => ProductsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
          limit: json["limit"] as int? ,
          skip: json["skip"] as int?,
          total: json["total"] as int?) ;
}

class ProductsDto extends Product {
  final num? discountPercentage;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? category;
  final String? sku;
  final int? weight;
  final Dimensions? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<Reviews>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final Meta? meta;
  final List<String>? images;

  const ProductsDto({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.rating,
    required super.thumbnail,
    this.category,
    this.discountPercentage,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
  });

  factory ProductsDto.fromJson(Map<String, dynamic> json) => ProductsDto(
        id: json["id"] as int,
        title: json["title"] as String,
        description: json["description"] as String,
        price: json["price"] as double,
        rating: json["rating"] as double,
        thumbnail: json["thumbnail"] as String,
        category: json["category"] as String?,
        discountPercentage: json["discountPercentage"] as num?,
        stock: json["stock"] as int?,
        tags: json["tags"] == null ? null : List<String>.from(json["tags"]),
        brand: json["brand"],
        sku: json["sku"],
        weight: json["weight"],
        dimensions: json["dimensions"] == null
            ? null
            : Dimensions.fromJson(json["dimensions"]),
        warrantyInformation: json["warrantyInformation"] as String?,
        shippingInformation: json["shippingInformation"] as String?,
        availabilityStatus: json["availabilityStatus"] as String?,
        reviews: json["reviews"] == null
            ? null
            : (json["reviews"] as List)
                .map((e) => Reviews.fromJson(e))
                .toList(),
        returnPolicy: json["returnPolicy"],
        minimumOrderQuantity: json["minimumOrderQuantity"],
        meta: json["meta"] == null
            ? null
            : Meta.fromJson(json["meta"] as Map<String, dynamic>),
        images:
            json["images"] == null ? null : List<String>.from(json["images"]),
      );
}

class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  Meta.fromJson(Map<String, dynamic> json) {
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    barcode = json["barcode"];
    qrCode = json["qrCode"];
  }
}

class Reviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Reviews(
      {this.rating,
      this.comment,
      this.date,
      this.reviewerName,
      this.reviewerEmail});

  Reviews.fromJson(Map<String, dynamic> json) {
    rating = json["rating"];
    comment = json["comment"];
    date = json["date"];
    reviewerName = json["reviewerName"];
    reviewerEmail = json["reviewerEmail"];
  }
}

class Dimensions {
  num? width;
  num? height;
  num? depth;

  Dimensions({this.width, this.height, this.depth});

  Dimensions.fromJson(Map<String, dynamic> json) {
    width = json["width"];
    height = json["height"];
    depth = json["depth"];
  }
}
