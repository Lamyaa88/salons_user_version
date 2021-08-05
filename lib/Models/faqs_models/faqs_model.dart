class AllFaqsModel {
  List<Data> data;

  AllFaqsModel({this.data});

  AllFaqsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String questionEn;
  String questionAr;
  String answerEn;
  String answerAr;

  Data(
      {this.id,
        this.questionEn,
        this.questionAr,
        this.answerEn,
        this.answerAr});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionEn = json['question_en'];
    questionAr = json['question_ar'];
    answerEn = json['answer_en'];
    answerAr = json['answer_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_en'] = this.questionEn;
    data['question_ar'] = this.questionAr;
    data['answer_en'] = this.answerEn;
    data['answer_ar'] = this.answerAr;
    return data;
  }
}
