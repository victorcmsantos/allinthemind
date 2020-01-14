class Courses {
  String author;
  String createdAt;
  String descriptionLogo;
  String descriptionText;
  String name;
  String type;
  String updatedAt;

  Courses(
      {this.author,
        this.createdAt,
        this.descriptionLogo,
        this.descriptionText,
        this.name,
        this.type,
        this.updatedAt});

  Courses.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    createdAt = json['created_at'];
    descriptionLogo = json['description_logo'];
    descriptionText = json['description_text'];
    name = json['name'];
    type = json['type'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['created_at'] = this.createdAt;
    data['description_logo'] = this.descriptionLogo;
    data['description_text'] = this.descriptionText;
    data['name'] = this.name;
    data['type'] = this.type;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
