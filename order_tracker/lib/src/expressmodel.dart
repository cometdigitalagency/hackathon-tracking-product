class ExpressAmodel {
  From? from;
  From? to;
  List<Trackings>? trackings;

  ExpressAmodel({this.from, this.to, this.trackings});

  ExpressAmodel.fromJson(Map<String, dynamic> json) {
    from = json['from'] != null ? new From.fromJson(json['from']) : null;
    to = json['to'] != null ? new From.fromJson(json['to']) : null;
    if (json['trackings'] != null) {
      trackings = <Trackings>[];
      json['trackings'].forEach((v) {
        trackings!.add(new Trackings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.from != null) {
      data['from'] = this.from!.toJson();
    }
    if (this.to != null) {
      data['to'] = this.to!.toJson();
    }
    if (this.trackings != null) {
      data['trackings'] = this.trackings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class From {
  String? code;
  String? name;
  String? tel;

  From({this.code, this.name, this.tel});

  From.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    tel = json['tel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['tel'] = this.tel;
    return data;
  }
}

class Trackings {
  String? date;
  String? description;
  String? title;

  Trackings({this.date, this.description, this.title});

  Trackings.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    description = json['description'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['description'] = this.description;
    data['title'] = this.title;
    return data;
  }
}