import 'package:case_study_3_app/common/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: title,background: Colors.blue),
      body: Center(
        child: Text('Body $title'),
      ),
    );
  }
}
