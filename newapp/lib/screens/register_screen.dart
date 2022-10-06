import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapp/models/auth_provider.dart';
import 'package:newapp/models/database_provider.dart';
import 'package:newapp/screens/home_screen.dart';
import 'package:sqflite/sqlite_api.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final authService = AuthenticationProvider();
  final dbServices = DatabaseProvider();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;

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
    confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
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
                            if (value.isEmpty) return 'Enter password';
                            return "Password cannot be less than 6 characters";
                          }
                          return "Please Enter password";
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
                          hintText: 'confirm Password',
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        controller: confirmPassword,
                        validator: (value) {
                          if (value != null || value!.isNotEmpty) {
                            if (value.length >= 6 && value == password.text) {
                              return null;
                            }
                            if (value.isEmpty) {
                              return 'Enter password';
                            } else if (password.text != value) {
                              return 'Password mismatch';
                            }
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
                                  .createUserWithEmailAndPassword(
                                email.text,
                                password.text,
                              )
                                  .then((userCredential) {
                                // print(userCredential);
                                if (userCredential == 'success') {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('user created successfully'),
                                    ),
                                  );
                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(userCredential),
                                    ),
                                  );
                                }
                              });
                            }
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ),
    );
  }
}
