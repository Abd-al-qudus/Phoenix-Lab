import 'package:flutter/material.dart';
import 'package:newapp/screens/send_email_screen.dart';

class ChatWithDoctorScreen extends StatefulWidget {
  static const routeName = '/chat';
  const ChatWithDoctorScreen({Key? key}) : super(key: key);

  @override
  State<ChatWithDoctorScreen> createState() => _ChatWithDoctorScreenState();
}

class _ChatWithDoctorScreenState extends State<ChatWithDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    final doctorsName = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DR. ${doctorsName['firstName']} ${doctorsName['lastName']}',
          style: const TextStyle(
            fontSize: 18,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => Navigator.of(context).pushNamed(
          SendEmailScreen.routeName,
          arguments: doctorsName,
        ),
        child: const Icon(Icons.mail),
      ),
      body: Column(),
    );
  }
}
