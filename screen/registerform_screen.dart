import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/root.dart';

class RegisterFormScreen extends StatelessWidget {
  const RegisterFormScreen({Key? key}) : super(key: key);

  static const String routeName = "/registerform";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register Form"),
        ),
        body: Center(
          child: Column(
            children: const [
              //Text("test"),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {

  final _formKey = GlobalKey<FormState>();
  final _registerCodeController = TextEditingController();
  final _modelController = TextEditingController();
  final _customerCodeController = TextEditingController();

  Future<void> postDataToApi() async {
    if (_formKey.currentState!.validate()) {
      final url = Uri.parse('https://10.0.2.2:7022/api/Database/CreateEdit'); // Replace with your API URL

      final data = {
        'registerCode': _registerCodeController.text,
        'model': _modelController.text,
        'customerCode': _customerCodeController.text,
        'chasisNo': "string", // Replace with your data
        'remarks': "string", // Replace with your data
        'mileageType': "string", // Replace with your data
        'engineNo': "string", // Replace with your data
        'regDate': "2023-10-23T08:54:25.472Z", // Replace with your data
        'nextMileage': 0,
        'nextDate': "2023-10-23T08:54:25.472Z",
        'display': 0,
        'colour': "string",
        'companyCar': "string",
        'ownerName': "string",
        'address1': "string",
        'address2': "string",
        'address3': "string",
        'address4': "string",
        'hpTelephone': "string",
        'telephone': "string",
        'fax': "string",
        'contactPerson': "string",
        'type': "string",
        'yearMade': "string",
        'brand': "string",
        'intercooler': "string",
        'turbo': "string",
        'axle': "string",
        'btm': 0,
        'bdm': 0,
        'puspakomDueDate': "2023-10-23T08:54:25.472Z",
        'roadTaxDueDate': "2023-10-23T08:54:25.472Z",
        'aPermitDueDate': "2023-10-23T08:54:25.472Z"
      };

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // Request was successful
        print('Data sent successfully');
        // You can handle the response here, if needed
      } else {
        // Request failed
        print('Failed to send data. Status code: ${response.statusCode}');
        // You can handle errors or show an error message
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _registerCodeController,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Please enter register code";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Your Register Code",
                  labelText: "Register Code"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _modelController,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Please enter model";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Your Model",
                    labelText: "Model"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _customerCodeController,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Please enter customer code";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Your Customer Code",
                    labelText: "Customer Code"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                // onPressed: () {
                //   if(_formKey.currentState!.validate()) {
                //     var root = Root(
                //       value: Value(
                //         registerCode: _registerCodeController.text,
                //         model: _modelController.text,
                //         customerCode: _customerCodeController.text,
                //       ),
                //     );
                //   }
                // },
                onPressed: postDataToApi, // Call the function to send data
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

