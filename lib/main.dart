import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'package:mynotes/views/NGO/create_opportunity.dart';
import 'package:mynotes/views/NGO/create_opportunity_new.dart';
import 'package:mynotes/views/NGO/edit_ngo_profile.dart';
import 'package:mynotes/views/NGO/edit_opportunity.dart';
import 'package:mynotes/views/NGO/ngo_user_profile.dart';
import 'package:mynotes/views/NGO/view_status.dart';
import 'package:mynotes/views/Volunteer_profile/edit_volunteer_profile.dart';
import 'package:mynotes/views/Volunteer_profile/volunteer_user_profile.dart';
import 'package:mynotes/views/login_view.dart';
import 'package:mynotes/views/notes_view.dart';
import 'package:mynotes/views/register_view.dart';
import 'package:mynotes/views/sign_up_view.dart';
import 'package:mynotes/views/verifyemail_view.dart';

// import 'package:mynotes/views/login_view.dart';P
void main() {
  WidgetsFlutterBinding.ensureInitialized(); //Used with Firebase.initializeApp
  runApp(
    GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
        routes: {
          //Links a String name to a View (Used for named Routes)
          loginRoute: (context) => const LoginView(),
          registerRoute: (context) => const RegisterView(),
          notesRoute: (context) => const NotesView(),
          verifyEmailRoute: (context) => const VerifyEmailView(),
          userProfile: (context) => const UserProfilePage(),
          ngoCreateOpportunity: (context) => const CreateOpprtunity(),
          ngoProfileRoute: (context) => const NgoUserProfile(),
          viewNgoStatus: (context) => const ViewStatus(),
          editOpportunity: (context) => const EditOpportunity(),
          homePage: (context) => const SignUpScreen(),
          editNgoProfile: (context) => const EditNgoProfile(),
          editVolunterProfile: (context) => const EditVolunteerProfile(),
        }),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: ((context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const UserProfilePage();
              }
            }

            return const LoginView();

          default:
            return const CircularProgressIndicator();
        }
      }),
    );
  }
}
