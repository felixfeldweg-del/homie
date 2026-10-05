import 'package:flutter/material.dart';
import 'package:homie/services/data_provider.dart';
import 'package:homie/widgets/divider.dart';
import 'package:homie/widgets/panel.dart';
import 'package:homie/widgets/sub_panel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<DataProvider>();

    if (userData.loadingClasses || userData.loadingSubjects) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (userData.errorClasses != null) {
      return Center(
        child: Text(userData.errorClasses!),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Panel(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Welcome to Homie!"),
              Text("You are logged in."),
              CustomDivider(color: Colors.grey[300]),
              SubPanel(
                child: Column(
                  children: [
                    Text("Your classes:"),
                    for (var classData in userData.classes)
                      Text(classData['name'] ?? 'Unnamed Class'),
                    for (var subjectData in userData.subjects)
                      Text(subjectData['name'] ?? 'Unnamed Subject'),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

}
