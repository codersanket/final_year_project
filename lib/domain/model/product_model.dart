class ProductM {
  String? id;
  String? brand;
  String? model;
  String? timeStamp;
  String? description;
  String? name;
  String? location;

  ProductM(
      {this.brand,
      this.id,
      this.model,
      this.timeStamp,
      this.description,
      this.name,
      this.location});

  ProductM.fromJson(Map<dynamic, dynamic> json) {
    brand = json['brand'];
    model = json['model'];
    timeStamp = json['timeStamp'];
    description = json['description'];
    name = json['name'];
    location = json['location'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand'] = brand;
    data['model'] = model;
    data['timeStamp'] = timeStamp;
    data['description'] = description;
    data['name'] = name;
    data['location'] = location;
    data["id"] = id;
    return data;
  }
}
