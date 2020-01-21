class ListClasses {
  String classname;
  String course;
  String tutor;

  ListClasses({this.classname, this.course, this.tutor});

  ListClasses.fromJson(Map<String, dynamic> json) {
    classname = json['classname'];
    course = json['course'];
    tutor = json['tutor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classname'] = this.classname;
    data['course'] = this.course;
    data['tutor'] = this.tutor;
    return data;
  }

  @override
  String toString() {
    return 'ListClasses{classname: $classname, course: $course, tutor: $tutor}';
  }


}
