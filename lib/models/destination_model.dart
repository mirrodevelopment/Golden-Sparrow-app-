class Destination {
  int? statusCode;
  String? id;
  String? country;
  String? seasonName;
  String? travelMonths;
  String? description;
  String? averageTemperature;
  String? flightDuration;
  String? experienceType;
  String? heroImage;
  List<Attractions>? attractions;

  Destination(
      {this.id,
        this.country,
        this.seasonName,
        this.travelMonths,
        this.description,
        this.averageTemperature,
        this.flightDuration,
        this.experienceType,
        this.heroImage,
        this.attractions,
        this.statusCode
      });

  Destination.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    id = json['id'];
    country = json['country'];
    seasonName = json['seasonName'];
    travelMonths = json['travelMonths'];
    description = json['description'];
    averageTemperature = json['averageTemperature'];
    flightDuration = json['flightDuration'];
    experienceType = json['experienceType'];
    heroImage = json['heroImage'];
    if (json['attractions'] != null) {
      attractions = <Attractions>[];
      json['attractions'].forEach((v) {
        attractions!.add(new Attractions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['id'] = this.id;
    data['country'] = this.country;
    data['seasonName'] = this.seasonName;
    data['travelMonths'] = this.travelMonths;
    data['description'] = this.description;
    data['averageTemperature'] = this.averageTemperature;
    data['flightDuration'] = this.flightDuration;
    data['experienceType'] = this.experienceType;
    data['heroImage'] = this.heroImage;
    if (this.attractions != null) {
      data['attractions'] = this.attractions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attractions {
  String? name;
  String? category;

  Attractions({this.name, this.category});

  Attractions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['category'] = this.category;
    return data;
  }
}
