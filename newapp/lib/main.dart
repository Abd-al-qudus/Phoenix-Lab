import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newapp/firebase_options.dart';
import 'package:newapp/models/database_provider.dart';
import 'package:newapp/screens/login_screen.dart';
import 'package:newapp/screens/register_screen.dart';
import 'package:provider/provider.dart';

import '../screens/send_email_screen.dart';
import '../screens/chat_with_doctor_screen.dart';
import '../models/drugs_provider.dart';
import '../models/patient_details_model.dart';
import '../models/purchase_list_provider.dart';
import '../screens/add_doctor_info.dart';
import '../screens/add_drug_screen.dart';
import '../screens/consultation_screen.dart';
import '../screens/edit_doctor_info.dart';
import '../screens/edit_drug_screen.dart';
import '../screens/clinic_home_screen.dart';
import '../screens/home_screen.dart';
import '../screens/hospital_map.dart';
import '../screens/patient_record_screen.dart';
import '../screens/payment_receipt_screen.dart';
import '../screens/pharmacy_drug_categories/analgestic_screen.dart';
import '../screens/pharmacy_drug_categories/anti_bacterial.dart';
import '../screens/pharmacy_drug_categories/anti_epileptic_screen.dart';
import '../screens/pharmacy_drug_categories/anti_infectional_screen.dart';
import '../screens/pharmacy_drug_categories/anti_leprosy_screen.dart';
import '../screens/pharmacy_drug_categories/antidote_screen.dart';
import '../screens/pharmacy_drug_categories/inhalational_screen.dart';
import '../screens/pharmacy_drug_categories/injectable_screen.dart';
import '../screens/pharmacy_drug_detail_screen.dart';
import '../screens/pharmacy_drug_overview_screen.dart';
import '../screens/pharmacy_search_screen.dart';
import '../screens/purchase_list_screen.dart';
import '../screens/record_screen.dart';
import '../screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'flutter-pharmacy-app',
      options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<bool> getUserSignedInStatus() async {
    return await DatabaseProvider()
        .getUserLoginStatus(DatabaseProvider().loginStatus)
        .then((value) => value);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DrugsModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PurchaseDrugList(),
        ),
        ChangeNotifierProvider(
          create: (context) => PatientRecordProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            //const Color.fromARGB(255, 211, 245, 221)
            //Color.fromARGB(255, 248, 248, 248),
            //const Color.fromARGB(255, 247, 247, 209)
            canvasColor: const Color.fromARGB(255, 247, 247, 209),
            primaryColor: Colors.black54,
            primarySwatch: Colors.teal,
            fontFamily: 'PT_Sans'),
        //_isLoggedIn ? const HomePage() : const LoginScreen(),
        home: FutureBuilder(
            future: getUserSignedInStatus(),
            builder: (context, snapshot) {
              if (snapshot.data == true) {
                return const HomePage();
              } else if (snapshot.data == false) {
                return const LoginScreen();
              } else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          RecordScreen.routeName: (context) => const RecordScreen(),
          PatientRecordScreen.routeName: (context) =>
              const PatientRecordScreen(),
          ClinicHomePage.routeName: (context) => const ClinicHomePage(),
          HospitalStaticMap.routeName: (context) => const HospitalStaticMap(),
          PharmacyDrugOverviewScreen.routeName: (context) =>
              const PharmacyDrugOverviewScreen(),
          DrugOverviewScreen.routeName: (context) => const DrugOverviewScreen(),
          PaymentReceiptScreen.routeName: (context) =>
              const PaymentReceiptScreen(),
          PurchaseListScreen.routeName: (context) => const PurchaseListScreen(),
          AnalgesticScreen.routeName: (context) => const AnalgesticScreen(),
          AntiBacterialScreen.routeName: (context) =>
              const AntiBacterialScreen(),
          AntiEpilepticScreen.routeName: (context) =>
              const AntiEpilepticScreen(),
          AntiInfectionalScreen.routeName: (context) =>
              const AntiInfectionalScreen(),
          AntiLeprosyScreen.routeName: (context) => const AntiLeprosyScreen(),
          AntidoteScreen.routeName: (context) => const AntidoteScreen(),
          InjectableScreen.routeName: (context) => const InjectableScreen(),
          InhalationalScreen.routeName: (context) => const InhalationalScreen(),
          PharmacySearchScreen.routeName: (context) =>
              const PharmacySearchScreen(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
          EditDrugScreen.routeName: (context) => const EditDrugScreen(),
          AddDrugScreen.routeName: (context) => const AddDrugScreen(),
          AddDoctorInfo.routeName: (context) => const AddDoctorInfo(),
          EditDoctorInfo.routeName: (context) => const EditDoctorInfo(),
          ConsultationScreen.routeName: (context) => const ConsultationScreen(),
          ChatWithDoctorScreen.routeName: (context) =>
              const ChatWithDoctorScreen(),
          SendEmailScreen.routeName: (context) => const SendEmailScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
        },
      ),
    );
  }
}
