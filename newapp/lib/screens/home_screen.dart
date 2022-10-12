import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth_provider.dart';
import '../models/database_provider.dart';

import '../models/user.dart';
import '../screens/login_screen.dart';

import '../screens/profile_screen.dart';
import '../widgets/home_screen_builder.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home-page';
  final String? email;
  const HomePage({Key? key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailProvider = Provider.of<User?>(context);
    final height = MediaQuery.of(context).size.height;
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
                      await dbProvider
                          .getUserId(emailProvider!.email)
                          .then((userId) async {
                        if (userId != null) {
                          await dbProvider.getRecordId(userId).then((recordId) {
                            Navigator.of(context)
                                .pushNamed(ProfileScreen.routeName, arguments: [
                              recordId,
                              userId,
                              emailProvider.email
                            ]);
                          });
                        } else {
                          Navigator.of(context).pushNamed(
                              ProfileScreen.routeName,
                              arguments: [null, null, emailProvider.email]);
                        }
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
                      await authProvider.logOut().then((_) {
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
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
