library login;

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'profile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Login Page")),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Card(
          elevation: 4, // Optional: shadow elevation
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(12), // Optional: rounded corners
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width:
                300, // Adjust the width here to control the form container size
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: 'email',
                            decoration:
                                const InputDecoration(labelText: 'Email'),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email(),
                            ]),
                          ),
                          const SizedBox(height: 10),
                          FormBuilderTextField(
                            name: 'password',
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(10,
                                  errorText:
                                      'Password must be at least 10 characters long'),
                            ]),
                          ),
                          const SizedBox(height: 20),
                          MaterialButton(
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () {
                              if (_formKey.currentState?.saveAndValidate() ??
                                  false) {
                                // หากการ validate ผ่าน ให้ทำการนำทางไปยังหน้า ProfilePage
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ProfilePage(),
                                  ),
                                );
                              } else {
                                debugPrint("Validation Failed");
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
