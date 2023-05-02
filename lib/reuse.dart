// ignore_for_file: no_logic_in_create_state, unused_element

import 'package:flutter/material.dart';
import 'package:providerapp/loginscreen.dart';
import 'package:flutter/material.dart';

class name1 extends StatefulWidget {
  const name1({super.key});

  @override
  State<name1> createState() => _name1State();
}
class _name1State extends State<name1> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(10000, (i) => "vickal no.. ${i+i}");
  var items = <String>[];

  @override
  void initState() {
    items = duplicateItems;
    super.initState();
  }

  void filterSearchResults(String query) {
    setState(() {
      items = duplicateItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.transparent,
      
      body: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white,),
        margin:EdgeInsets.only(left: 30, right: 30,top: 300, bottom: 10),
       
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child:editingController.text.length==1? ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InkWell(onTap: () {
                     vehiclecontroller!.text = items.elementAt(index);
      Navigator.pop(context);
                  },
                    child: ListTile(
                      title: Text('${items[index]}'),
                    ),
                  );
                },
              ):Container()
            ),
          ],
        ),
      ),
    );
  }
}