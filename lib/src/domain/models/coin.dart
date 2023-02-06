class Coin {
  String? id;
  String? name;
  String? symbol;
  int? rank;
  bool? isNew;
  bool? isActive;
  String? type;

  Coin(
      {this.id,
      this.name,
      this.symbol,
      this.rank,
      this.isNew,
      this.isActive,
      this.type});

  Coin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    rank = json['rank'];
    isNew = json['is_new'];
    isActive = json['is_active'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['rank'] = this.rank;
    data['is_new'] = this.isNew;
    data['is_active'] = this.isActive;
    data['type'] = this.type;
    return data;
  }
}
