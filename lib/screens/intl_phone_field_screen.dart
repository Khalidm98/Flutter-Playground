import 'package:flutter/material.dart';

import '../widgets/phone_field.dart';

class IntlPhoneFieldScreen extends StatefulWidget {
  const IntlPhoneFieldScreen({super.key});

  @override
  State<IntlPhoneFieldScreen> createState() => _IntlPhoneFieldScreenState();
}

class _IntlPhoneFieldScreenState extends State<IntlPhoneFieldScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          const PhoneField(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _formKey.currentState!.validate,
            child: const Text('Validate'),
          )
        ],
      ),
    );
  }
}
