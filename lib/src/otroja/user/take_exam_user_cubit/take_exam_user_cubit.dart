import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otroja_users/src/otroja/user/take_exam_user_cubit/take_exam_user_state.dart';

import '../../data/datasource/api_services.dart';
import '../model/questions.dart';
import '../widget_question/data/send_result.dart';

class TakeExamUserCubit extends Cubit<TakeExamUserState> {
  TakeExamUserCubit() : super(const TakeExamUserState());
  int examID=0;

  void initialize(List<Questions> questions,int examId,int duration) {
    examID=examId;
    emit(state.copyWith(
      qaList: questions,
      selectedAnswers: List<int>.filled(questions.length, -1),
      remainingTime: duration *60
    ));

    startTimer();
  }

  void selectAnswer(int index) {
    final updatedAnswers = List<int>.from(state.selectedAnswers);
    updatedAnswers[state.currentQuestionIndex] = index;
    emit(state.copyWith(selectedAnswers: updatedAnswers));
  }

  void nextQuestion() {
    if (state.currentQuestionIndex < state.qaList.length - 1) {
      emit(state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex + 1,
        showAnswerSelectionError: false,
      ));
    } else {
      finishExam();
    }
  }

  void goBack() {
    if (state.currentQuestionIndex > 0) {
      emit(state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex - 1,
        showAnswerSelectionError: false,
      ));
    }
  }

  void finishExam() {
    if (state.isExamFinished) return;

    int correctAnswers = 0;
    for (int i = 0; i < state.qaList.length; i++) {
      if (state.selectedAnswers[i] != -1 && state.qaList[i].answers![state.selectedAnswers[i]].isCorrect == 1) {
        correctAnswers++;
      }
    }

    emit(TakeExamUserFinishExam(
      correctAnswers: correctAnswers,
      total: state.qaList.length,
      currentQuestionIndex: state.currentQuestionIndex,
      qaList: state.qaList,
    ));
  }

  void updateRemainingTime() {
    if (state.remainingTime > 0) {
      emit(state.copyWith(remainingTime: state.remainingTime - 1));
    } else if (!state.isExamFinished) {
      finishExam();
    }
  }
  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (state.remainingTime > 0) {
        emit(state.copyWith(remainingTime: state.remainingTime - 1));
      } else {
        finishExam();
        _timer?.cancel();
      }
    });
  }

  void resetExam() {
    emit(TakeExamUserState(
      qaList: state.qaList,
      selectedAnswers: List<int>.filled(state.qaList.length, -1),
    ));
  }
  void sendResult(correctAnswers)async {
    try{
      ApiService apiService = ApiService();
      final data =
          SendResult(studentId: 1, examId: examID, score: correctAnswers);
      print(data.toJson());
      await apiService.post("results/create", data: data.toJson());
    }catch(e){
      print(e);
    }
  }
}
