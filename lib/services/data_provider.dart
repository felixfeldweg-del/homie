import 'package:flutter/material.dart';
import 'package:homie/services/data_service.dart';

class DataProvider extends ChangeNotifier {
  // INITIALIZE 
  void init(){
    loadClasses();
    loadSubjects();
  }
  // SERVICES
  final ClassService _classService = ClassService();

  //? CLASS DATA

    // private variables 
  List<Map<String, dynamic>> _classes = [];
  bool _loadingClasses = false;
  String? _errorClasses;

    // getters 
  List<Map<String, dynamic>> get classes => _classes;
  bool get loadingClasses => _loadingClasses;
  String? get errorClasses => _errorClasses;

    // loading logic
  Future<void> loadClasses() async {
    
      _loadingClasses = true;
      _errorClasses = null;
      notifyListeners();
    try {
      _classes = await _classService.getUsersClasses();
    }catch (e) {
      _errorClasses = e.toString();
    }

    _loadingClasses = false;
    notifyListeners();
  }

  //? SUBJECT DATA

    // private variables
  List<Map<String, dynamic>> _subjects = [];
  bool _loadingSubjects = false;
  String? _errorSubjects;

    // getters
  List<Map<String, dynamic>> get subjects => _subjects;
  bool get loadingSubjects => _loadingSubjects;
  String? get errorSubjects => _errorSubjects;

    // loading logic
  Future<void> loadSubjects() async {
    
      _loadingSubjects = true;
      _errorSubjects = null;
      notifyListeners();
    try {
      _subjects = await _classService.getSubjects();
    }catch (e) {
      _errorSubjects = e.toString();
    }

    _loadingSubjects = false;
    notifyListeners();
  }
}