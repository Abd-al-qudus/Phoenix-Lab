import 'package:flutter/material.dart';
import 'package:newapp/models/auth_provider.dart';
import 'package:newapp/models/database_provider.dart';
import 'package:newapp/screens/home_screen.dart';
import 'package:newapp/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final authService = AuthenticationProvider();
  final dbService = DatabaseProvider();
  final _formKey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;

  Widget _imageBuilder(String imageUrl) {
    final imageAsset = AssetImage(imageUrl);
    Image image = Image(
      image: imageAsset,
      fit: BoxFit.contain,
      height: 200,
      width: 200,
    );
    return image;
  }

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          'CLINIC',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      Text(
                        'Explore for advance Health Services',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      _imageBuilder('assets/images/demo.png'),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          hintText: 'Email',
                          prefixIcon: const Icon(Icons.mail),
                        ),
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!)
                              ? null
                              : "Please enter valid Email";
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        controller: password,
                        validator: (value) {
                          if (value != null || value!.isNotEmpty) {
                            if (value.length >= 6) return null;
                            return "Password cannot be less than 6 characters";
                          }
                          return "Please Enter password";
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              await authService
                                  .signInWithEmailAndPassword(
                                email.text,
                                password.text,
                              )
                                  .then((code) {
                                if (code == 'success') {
                                  Navigator.of(context).pushReplacementNamed(
                                      HomePage.routeName,
                                      arguments: email);
                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(code),
                                    ),
                                  );
                                }
                              });
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: () => Navigator.of(context)
                                .pushNamed(RegisterScreen.routeName),
                            child: const Text('Register now!'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
            ),
    );
  }
}
