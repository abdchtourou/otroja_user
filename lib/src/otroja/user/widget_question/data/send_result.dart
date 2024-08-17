class SendResult {
  int? studentId;
  int? examId;
  int? score;

  SendResult({
   required this.studentId,required this.examId,required this.score});

  SendResult.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    examId = json['exam_id'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['exam_id'] = this.examId;
    data['score'] = this.score;
    return data;
  }
}