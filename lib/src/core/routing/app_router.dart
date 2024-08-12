import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otroja_users/src/core/routing/cubits.dart';
import 'package:otroja_users/src/core/routing/routes.dart';
import '../../otroja/data/models/stuednt_info.dart';
import '../../otroja/presentation/screens/Home/homePage.dart';
import '../../otroja/presentation/screens/Library/showDocuments/show_documents_screen.dart';
import '../../otroja/presentation/screens/Library/showDocuments/widgets/pdf_screen.dart';
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

      case Routes.pdf:
        final url = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => PDFScreen(url: url));
    }
    return null;
  }
}
