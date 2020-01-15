class CoursesIntro {
  String audience;
  String course;
  String introductionVideo;
  String scenario;
  String sections;
  String title;

  CoursesIntro(
      {this.audience,
        this.course,
        this.introductionVideo,
        this.scenario,
        this.sections,
        this.title});

  CoursesIntro.fromJson(Map<String, dynamic> json) {
    audience = json['audience'];
    course = json['course'];
    introductionVideo = json['introduction_video'];
    scenario = json['scenario'];
    sections = json['sections'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['audience'] = this.audience;
    data['course'] = this.course;
    data['introduction_video'] = this.introductionVideo;
    data['scenario'] = this.scenario;
    data['sections'] = this.sections;
    data['title'] = this.title;
    return data;
  }
}
