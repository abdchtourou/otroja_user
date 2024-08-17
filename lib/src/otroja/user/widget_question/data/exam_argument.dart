import '../../model/questions.dart';

class ExamArguments {
  final List<Questions> showExamsModel;
  final int examId;
  final duration;


  ExamArguments({
    required this.showExamsModel,
    required this.examId,
    required this.duration,
  });
}