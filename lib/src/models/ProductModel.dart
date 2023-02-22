class ProdutModel {
  int? id;
  String? name;
  double? price;
  bool? status;
  String? update;

  ProdutModel({
    this.id,
    this.name,
    this.price,
    this.status,
    this.update,
  });

  factory ProdutModel.fromJson(Map<String, dynamic> map) {
    return ProdutModel(
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
