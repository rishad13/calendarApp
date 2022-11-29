import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  List<String> evantList_provider = [];
  int index_provider = 0;
  String savedEvant = '';
  String selecteddate=DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  //String _selectedDates ='';
     

  int index() {
    return index_provider;
  }

  void removeEvantChange() {
    evantList_provider.removeAt(index_provider);
    notifyListeners();
  }

  void addEvantChange() {
    evantList_provider.add(savedEvant);
    notifyListeners();
  }

  saveEvantIntoSharePrefrence() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(selecteddate.toString(), evantList_provider);
    print("selected value $selecteddate");
    notifyListeners();
  }

  getShavedEvant() async {
    final prefs = await SharedPreferences.getInstance();
    evantList_provider = prefs.getStringList(selecteddate.toString()) ?? [];
    notifyListeners();
  }

  removeData() async {
    final prefs = await SharedPreferences.getInstance();
    final success = await prefs.remove(selecteddate.toString());
    notifyListeners();
  }
}
