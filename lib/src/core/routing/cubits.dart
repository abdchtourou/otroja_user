import 'package:otroja_users/src/otroja/cubits/exam_details/exam_details_cubit.dart';
import 'package:otroja_users/src/otroja/data/repositories/exam_details_repo.dart';
import 'package:otroja_users/src/otroja/data/repositories/show_exam_repo.dart';

import '../../otroja/cubits/documentCubit/document_cubit.dart';
import '../../otroja/cubits/show_exams/show_exams_cubit.dart';
import '../../otroja/cubits/studentInfoCubit/student_info_cubit.dart';
import '../../otroja/data/datasource/api_services.dart';
import '../../otroja/data/repositories/document_repository.dart';
import '../../otroja/data/repositories/student_info_repository.dart';

class Cubits {
  static StudentInfoCubit studentInfoCubit =
      StudentInfoCubit(StudentRepository(ApiService()));
  static DocumentCubit documentCubit = DocumentCubit(DocumentRepository(ApiService()));
  static ShowExamsCubit showExamsCubit = ShowExamsCubit(ShowExamRepo(ApiService()));
  static ExamDetailsCubit examDetailsCubit = ExamDetailsCubit(ExamDetailsRepo(ApiService()));
}
