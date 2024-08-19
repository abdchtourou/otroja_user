import 'package:otroja_users/src/otroja/data/repositories/my_recite_repository.dart';
import 'package:otroja_users/src/otroja/data/repositories/show_activity_repo.dart';
import 'package:otroja_users/src/otroja/data/repositories/student_to_do_repository.dart';

import '../../otroja/cubits/documentCubit/document_cubit.dart';
import '../../otroja/cubits/myRecitCubit/my_recite_cubit.dart';
import '../../otroja/cubits/show_activity/show_activity_cubit.dart';
import '../../otroja/cubits/studentInfoCubit/student_info_cubit.dart';
import '../../otroja/cubits/student_to_do/student_to_do_cubit.dart';
import '../../otroja/data/datasource/api_services.dart';
import '../../otroja/data/repositories/document_repository.dart';
import '../../otroja/data/repositories/student_info_repository.dart';

class Cubits {
  static StudentInfoCubit studentInfoCubit =
      StudentInfoCubit(StudentRepository(ApiService()));
  static DocumentCubit documentCubit = DocumentCubit(DocumentRepository(ApiService()));
  static ShowActivityCubit showActivityCubit = ShowActivityCubit(ShowActivityRepo(ApiService()));
  static MyReciteCubit myReciteCubit = MyReciteCubit(MyReciteRepository(ApiService()));
  static StudentCubit studentCubit = StudentCubit(StudentToDoRepository(ApiService()));

}
