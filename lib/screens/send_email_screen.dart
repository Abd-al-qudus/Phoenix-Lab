import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class SendEmailScreen extends StatefulWidget {
  static const routeName = '/send-email';
  const SendEmailScreen({Key? key}) : super(key: key);

  @override
  State<SendEmailScreen> createState() => _SendEmailScreenState();
}

class _SendEmailScreenState extends State<SendEmailScreen> {
  late TextEditingController subject;
  late TextEditingController body;
  late TextEditingController recipient;

  @override
  void initState() {
    subject = TextEditingController();
    body = TextEditingController();
    recipient = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    subject.dispose();
    body.dispose();
    recipient.dispose();
    super.dispose();
  }

  Widget _textOverviewBuilder({
    required String labelText,
    required var controller,
    required int maxLines,
    TextInputType keyboardInputType = TextInputType.name,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: labelText,
        ),
        controller: controller,
        keyboardType: keyboardInputType,
        maxLines: maxLines,
      ),
    );
  }

  Future<void> sendEmail(String subject, String body, String recipient) async {
    final Email email = Email(
      body: body,
      subject: subject,
      recipients: [recipient],
      isHTML: false,
    );
    try {
      await FlutterEmailSender.send(email).then(
        (value) => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('email sent'),
          ),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('sending failed'),
        ),
      );
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final doctorDetail = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BOOK APPOINTMENT',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _textOverviewBuilder(
            labelText: 'Subject',
            controller: subject,
            maxLines: 1,
          ), //price
          _textOverviewBuilder(
              labelText: 'Body',
              keyboardInputType: TextInputType.name,
              controller: body,
              maxLines: 10),
          IconButton(
            onPressed: () async {
              final receiversEmail = doctorDetail['emailAddress'];
              if (subject.text.isNotEmpty && body.text.isNotEmpty) {
                await sendEmail(subject.text, body.text, receiversEmail);
              }
              return;
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
