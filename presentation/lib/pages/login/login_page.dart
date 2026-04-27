import 'package:flutter/material.dart';
import 'package:presentation/utils/widgets/base/base_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Login Page'),
            Form(
              child: AutofillGroup(
                child: Column(
                  children: [
                    TextFormField(decoration:  InputDecoration(labelText: 'Email')),
                     TextFormField(decoration: InputDecoration(labelText: 'Password'), obscureText: true),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
