class ProductModel {
  int? id;
  String? name;
  double? price;
  bool? status;
  String? update;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.status,
    this.update,
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['ITN_CODIGO'],
      name: map['ITN_DESCRITIVO'],
      price: map['ITN_PRECO'],
      status: map['ITN_ATIVO'],
      update: map['ITN_DATA'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "status": status,
      "update": update,
    };
  }
}
