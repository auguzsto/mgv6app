class BalanceModel {
  int? id;
  int? status;

  BalanceModel({
    this.id,
    this.status,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> map) {
    return BalanceModel(
      id: map['BAL_CODIGO'],
      status: map['BAL_ESTADO'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "status": status,
    };
  }
}
