class OrderHistoryModel {
  final DateTime? orderDate;
  final double? totalPrice;
  final int? itemsQuantity;
  final bool? isArrived;
  final List<OrderHistoryMealItem>? items;

  OrderHistoryModel._({
    this.orderDate,
    this.totalPrice,
    this.itemsQuantity,
    this.items,
    this.isArrived,
  });

  factory OrderHistoryModel({
    DateTime? orderDate,
    List<OrderHistoryMealItem>? items,
    bool? isArrived,
  }) {
    int itemsQu =
        items!.fold<int>(0, (oldData, item) => oldData + item.quantity!);

    double totalPr = items.fold<double>(
        0.0, (oldData, item) => oldData + (item.price! * item.quantity!));
    return OrderHistoryModel._(
      itemsQuantity: itemsQu,
      items: items,
      isArrived: isArrived,
      orderDate: orderDate,
      totalPrice: totalPr,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderDate': orderDate,
      'totalPrice': totalPrice,
      'itemsQuantity': itemsQuantity,
      'items': items,
      'isArrived': isArrived
    };
  }

  factory OrderHistoryModel.fromMap(Map<String, dynamic> map) {
    return OrderHistoryModel(
      orderDate: map['orderDate'],
      items: map['items'],
      isArrived: map['isArrived'],
    );
  }
}

class OrderHistoryMealItem {
  final String? mealName;
  final double? price;
  final int? quantity;
  final double? total;

  OrderHistoryMealItem._({
    this.mealName,
    this.price,
    this.quantity,
    this.total,
  });

  factory OrderHistoryMealItem(
      {String? mealName, double? price, int? quantity}) {
    return OrderHistoryMealItem._(
      mealName: mealName,
      price: price,
      quantity: quantity,
      total: price! * quantity!,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mealName': mealName,
      'price': price,
      'quantity': quantity,
      'total': total,
    };
  }

  factory OrderHistoryMealItem.fromMap(Map<String, dynamic> map) {
    return OrderHistoryMealItem(
      mealName: map['mealName'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }
}
