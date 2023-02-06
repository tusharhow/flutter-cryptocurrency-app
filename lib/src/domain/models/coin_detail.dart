class CoinDetail {
  String? id;
  String? name;
  String? symbol;
  int? rank;
  bool? isNew;
  bool? isActive;
  String? type;
  String? logo;
  List<Tags>? tags;
  List<Team>? team;
  String? description;
  String? message;
  bool? openSource;
  String? startedAt;
  String? developmentStatus;
  bool? hardwareWallet;
  String? proofType;
  String? orgStructure;
  String? hashAlgorithm;

  Whitepaper? whitepaper;
  String? firstDataAt;
  String? lastDataAt;

  CoinDetail(
      {this.id,
      this.name,
      this.symbol,
      this.rank,
      this.isNew,
      this.isActive,
      this.type,
      this.logo,
      this.tags,
      this.team,
      this.description,
      this.message,
      this.openSource,
      this.startedAt,
      this.developmentStatus,
      this.hardwareWallet,
      this.proofType,
      this.orgStructure,
      this.hashAlgorithm,
      this.whitepaper,
      this.firstDataAt,
      this.lastDataAt});

  CoinDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    rank = json['rank'];
    isNew = json['is_new'];
    isActive = json['is_active'];
    type = json['type'];
    logo = json['logo'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add( Tags.fromJson(v));
      });
    }
    if (json['team'] != null) {
      team = <Team>[];
      json['team'].forEach((v) {
        team!.add( Team.fromJson(v));
      });
    }
    description = json['description'];
    message = json['message'];
    openSource = json['open_source'];
    startedAt = json['started_at'];
    developmentStatus = json['development_status'];
    hardwareWallet = json['hardware_wallet'];
    proofType = json['proof_type'];
    orgStructure = json['org_structure'];
    hashAlgorithm = json['hash_algorithm'];

    whitepaper = json['whitepaper'] != null
        ? Whitepaper.fromJson(json['whitepaper'])
        : null;
    firstDataAt = json['first_data_at'];
    lastDataAt = json['last_data_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['rank'] = this.rank;
    data['is_new'] = this.isNew;
    data['is_active'] = this.isActive;
    data['type'] = this.type;
    data['logo'] = this.logo;
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    if (this.team != null) {
      data['team'] = this.team!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['message'] = this.message;
    data['open_source'] = this.openSource;
    data['started_at'] = this.startedAt;
    data['development_status'] = this.developmentStatus;
    data['hardware_wallet'] = this.hardwareWallet;
    data['proof_type'] = this.proofType;
    data['org_structure'] = this.orgStructure;
    data['hash_algorithm'] = this.hashAlgorithm;

    if (this.whitepaper != null) {
      data['whitepaper'] = this.whitepaper!.toJson();
    }
    data['first_data_at'] = this.firstDataAt;
    data['last_data_at'] = this.lastDataAt;
    return data;
  }
}

class Tags {
  String? id;
  String? name;
  int? coinCounter;
  int? icoCounter;

  Tags({this.id, this.name, this.coinCounter, this.icoCounter});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coinCounter = json['coin_counter'];
    icoCounter = json['ico_counter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['coin_counter'] = this.coinCounter;
    data['ico_counter'] = this.icoCounter;
    return data;
  }
}

class Team {
  String? id;
  String? name;
  String? position;

  Team({this.id, this.name, this.position});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['position'] = this.position;
    return data;
  }
}

class Stats {
  int? subscribers;
  int? contributors;
  int? stars;
  int? followers;

  Stats({this.subscribers, this.contributors, this.stars, this.followers});

  Stats.fromJson(Map<String, dynamic> json) {
    subscribers = json['subscribers'];
    contributors = json['contributors'];
    stars = json['stars'];
    followers = json['followers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['subscribers'] = this.subscribers;
    data['contributors'] = this.contributors;
    data['stars'] = this.stars;
    data['followers'] = this.followers;
    return data;
  }
}

class Whitepaper {
  String? link;
  String? thumbnail;

  Whitepaper({this.link, this.thumbnail});

  Whitepaper.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['link'] = this.link;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
