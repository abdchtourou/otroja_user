import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otroja_users/src/core/routing/cubits.dart';
import 'package:otroja_users/src/core/routing/routes.dart';
import 'package:otroja_users/src/otroja/presentation/screens/showActivities/activityScreen.dart';
import '../../otroja/data/models/myRecite.dart';
import '../../otroja/data/models/stuednt_info.dart';
import '../../otroja/presentation/screens/Home/homePage.dart';
import '../../otroja/presentation/screens/Library/showDocuments/show_documents_screen.dart';
import '../../otroja/presentation/screens/Library/showDocuments/widgets/pdf_screen.dart';
import '../../otroja/presentation/screens/myRecite/my_recite_screen.dart';
import '../../otroja/presentation/screens/myRecite/widgets/standards_screen.dart';
import '../../otroja/presentation/screens/showActivities/widgets/show_students_recit.dart';
import '../../otroja/presentation/screens/student/absencesDays/absence_for_Group.dart';
import '../../otroja/presentation/screens/student/absencesDays/absences_by_group.dart';
import '../../otroja/presentation/screens/student/studentDetails/student_details_with_bloc.dart';
import '../../otroja/presentation/screens/student/studentPoints/student_points.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case Routes.studentDetails:
        Cubits.studentInfoCubit.fetchStudentInfo();
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: Cubits.studentInfoCubit,
                    ),
                  ],
                  child: StudentDetailsWithBloc(),
                ));
      case Routes.library:
        Cubits.documentCubit.loadDocuments();
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: Cubits.documentCubit,
                    ),
                  ],
                  child: ShowDocumentsScreen(),
                ));

      case Routes.studentAbsencsByGroup:
        final absences = settings.arguments as List<Absence>;
        return MaterialPageRoute(
            builder: (_) => AbsenceByGroup(
                  absence: absences,
                ));

      case Routes.studentAbsencsForGroup:
        final absences = settings.arguments as List<Absence>;
        return MaterialPageRoute(
            builder: (_) => StudentAbsencsForGroup(
                  absence: absences,
                ));

      case Routes.studentPoints:
        final results = settings.arguments as List<Result>;
        return MaterialPageRoute(
            builder: (_) => StudentPointsScreen(
                  results: results,
                ));
      case Routes.activity:
        Cubits.showActivityCubit.getActivity();
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: Cubits.showActivityCubit,
                  child: ActivityScreen(),
                ));

      case Routes.myReciteScreen:
        Cubits.myReciteCubit.fetchRecites();
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: Cubits.myReciteCubit,
                  child: MyReciteScreen(),
                ));

      case Routes.showStudent:
        Cubits.studentCubit.loadStudents();
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: Cubits.studentCubit,
                    ),
                    BlocProvider.value(
                      value:  Cubits.showActivityCubit,
                    ),
                  ],
                  child: ShowStudents(),
                ));

      case Routes.standard:
        final standardList = settings.arguments as List<Standard>;
        return MaterialPageRoute(
          builder: (_) => StandartsScreen(
            standard: standardList,
          ),
        );
      case Routes.pdf:
        final url = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => PDFScreen(url: url));
    }
    return null;
  }
}
