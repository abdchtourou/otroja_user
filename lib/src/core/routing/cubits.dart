import '../../otroja/cubits/studentInfoCubit/student_info_cubit.dart';
import '../../otroja/data/datasource/api_services.dart';
import '../../otroja/data/repositories/student_info_repository.dart';

class Cubits {
  static StudentInfoCubit studentInfoCubit =
      StudentInfoCubit(StudentRepository(ApiService()));
}