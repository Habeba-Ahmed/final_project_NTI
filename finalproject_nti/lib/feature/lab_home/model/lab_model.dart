class LabModel {
  final String? status;
  final String? message;
  final List<Product>? product;

  LabModel({this.status, this.message, this.product});

  factory LabModel.fromJson(Map<String, dynamic> json) {
    return LabModel(
      status: json['status'],
      message: json['message'],
      product: (json['product'] as List<dynamic>?)
          ?.map((item) => Product.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'product': product?.map((p) => p.toJson()).toList(),
    };
  }
}

class Product {
  final String? id;
  final String? status;
  final String? category;
  final String? name;
  final double? price;
  final String? description;
  final String? image;
  final List<String>? images;
  final String? company;
  final int? countInStock;
  final int? v;
  final int? sales;

  Product({
    this.id,
    this.status,
    this.category,
    this.name,
    this.price,
    this.description,
    this.image,
    this.images,
    this.company,
    this.countInStock,
    this.v,
    this.sales,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      status: json['status'],
      category: json['category'],
      name: json['name'],
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'],
      image: json['image'],
      images: (json['images'] as List<dynamic>?)?.cast<String>(),
      company: json['company'],
      countInStock: json['countInStock'],
      v: json['__v'],
      sales: json['sales'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'status': status,
      'category': category,
      'name': name,
      'price': price,
      'description': description,
      'image': image,
      'images': images,
      'company': company,
      'countInStock': countInStock,
      '__v': v,
      'sales': sales,
    };
  }
}
