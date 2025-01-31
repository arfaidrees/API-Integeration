class OrdersResponse {
  OrdersResponse({
    required this.status,
    required this.orders,
  });

  String status;
  List<Order> orders;

  factory OrdersResponse.fromJson(Map<String, dynamic> json) {
    return OrdersResponse(
      status: json['status'],
      orders: List<Order>.from(json['orders'].map((x) => Order.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'orders': List<dynamic>.from(orders.map((x) => x.toJson())),
    };
  }
}

class Order {
  Order({
    required this.id,
    required this.temporaryOrderId,
    required this.imageUrl,
    required this.floor,
    required this.shop,
    this.tag,
    this.availability,
    this.paymentType,
    this.paymentMode,
    this.price,
    required this.status,
  });

  int id;
  String temporaryOrderId;
  String imageUrl;
  String floor;
  String shop;
  String? tag;
  String? availability;
  String? paymentType;
  String? paymentMode;
  dynamic price;
  String status;

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      temporaryOrderId: json['temporary_order_id'],
      imageUrl: json['image_url'],
      floor: json['floor'],
      shop: json['shop'],
      tag: json['tag'],
      availability: json['availability'],
      paymentType: json['payment_type'],
      paymentMode: json['payment_mode'],
      price: json['price'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'temporary_order_id': temporaryOrderId,
      'image_url': imageUrl,
      'floor': floor,
      'shop': shop,
      'tag': tag,
      'availability': availability,
      'payment_type': paymentType,
      'payment_mode': paymentMode,
      'price': price,
      'status': status,
    };
  }
}