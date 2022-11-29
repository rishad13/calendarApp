import 'package:calender/condroler/provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Consumer<MyProvider> (
      builder:( context,providers,_,){
      return  Scaffold(
        appBar: AppBar(
          title: Text("Calender"),
          backgroundColor: Colors.teal,
        ),
        body: Column(
          children: [
            DatePicker(
              DateTime.now(),
              onDateChange: (Date) {
                
                providers.getShavedEvant();
                 
                 providers.selecteddate=DateFormat('yyyy-MM-dd').format(Date);
                 
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: providers.evantList_provider.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: 
                      ListTile(
                        title: Text(providers.evantList_provider[index].toString()),
                         trailing: IconButton(onPressed: (() {
                           providers.saveEvantIntoSharePrefrence();
                         providers.removeEvantChange();
                         }), icon:Icon( Icons.delete_outline)),
                      ),
                  );
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            eventAddText.clear();
    
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Add a Event"),
                  content: TextField(
                    decoration: const InputDecoration(hintText: "Enter Text"),
                    controller: eventAddText,
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: Text("OK"),
                      onPressed: () {
                       providers.savedEvant = eventAddText.text;
                         providers.saveEvantIntoSharePrefrence();
                          Navigator.of(context).pop();
                           providers.addEvantChange();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      );
      }
    );
  }
}

String day1 = "";
TextEditingController eventAddText = TextEditingController();

