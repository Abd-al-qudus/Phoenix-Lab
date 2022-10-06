import 'package:flutter/material.dart';
import 'package:newapp/models/auth_provider.dart';
import 'package:newapp/models/database_provider.dart';
import 'package:newapp/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/profile_screen.dart';
import '../widgets/home_screen_builder.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final authProvider = AuthenticationProvider();
    final dbProvider = DatabaseProvider();
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'MY HOSPITAL',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        width: 300,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: height * 0.1,
            ),
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.local_hospital),
            ),
            SizedBox(
              width: double.infinity,
              height: height * 0.05,
            ),
            SizedBox(
              height: height * 0.5,
              width: double.infinity,
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.primary,
                      size: 35,
                    ),
                    title: Text(
                      'PROFILE',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () async {
                      Navigator.of(context).pop();
                      await SharedPreferences.getInstance().then((prefs) {
                        final String? key = prefs.getString('recordKey');
                        Navigator.of(context).pushNamed(ProfileScreen.routeName,
                            arguments: [key]);
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Theme.of(context).colorScheme.primary,
                      size: 35,
                    ),
                    title: Text(
                      'LOGOUT',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () async {
                      Navigator.of(context).pop();
                      await authProvider.logOut().then((_) async {
                        await dbProvider.saveUserLoginStatus(false).then((_) {
                          Navigator.of(context)
                              .pushReplacementNamed(LoginScreen.routeName);
                        });
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: HomeScreenBuilder(),
      ),
    );
  }
}
