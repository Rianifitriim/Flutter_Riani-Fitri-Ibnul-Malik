import 'package:flutter/material.dart';
import 'package:soal1/new_contact.dart';
import 'package:provider/provider.dart';
import 'model/data_manager.dart';

class Homepage extends StatelessWidget {
  final DataManager dataManager;
  const Homepage({
    Key? key,
    required this.dataManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataPost = dataManager.dataContact;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 218, 227),
        appBar: AppBar(
          title: Text('Contacts'),
          backgroundColor: Colors.purpleAccent.shade400,
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(children: [
            ListView.builder(
                itemCount: dataPost.length,
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final contact = dataPost[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Text(
                            contact.name![0],
                            style: TextStyle(
                                color: Colors.purpleAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 236, 187, 245),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(contact.name!,
                                      style: const TextStyle(fontSize: 17)),
                                  Text(contact.number!,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 91, 91, 91)))
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                })
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purpleAccent.shade400,
          onPressed: () {
            final data = Provider.of<DataManager>(context, listen: false);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => newContact(onCreate: (contact) {
                  data.addData(contact);
                  Navigator.pop(context);
                }),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
