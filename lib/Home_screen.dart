import 'package:contact_application/Contact.dart';
import 'package:contact_application/style.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _nameState();
}

class _nameState extends State<HomeScreen> {


List<Contact> contacts = List.empty(growable: true);

TextEditingController namecontroller = TextEditingController();
TextEditingController numbercontroller = TextEditingController();

var selectindex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Contact App',style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: namecontroller,
              decoration: apptextfielddecoration.main(hinttext:"enter Name"),
            ),
            SizedBox(height: 15),
            TextField(
              controller: numbercontroller,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: apptextfielddecoration.main(hinttext:"enter Number"),
            ),
             SizedBox(height: 15),

             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  String name= namecontroller.text.trim();
                  String number=numbercontroller.text.trim();

                  if(name.isNotEmpty && number.isNotEmpty){
                    setState(() {
                      namecontroller.text='';
                      numbercontroller.text='';
                      contacts[selectindex].name = name;
                      contacts[selectindex].number = number;//pajalin samana karpu index ek meken set krnwa
                      selectindex = -1;
                    });
                  }
                }, 
                child: const Text("UPDATE")),

                ElevatedButton(onPressed: (){
                  //giving data to ON Press button
                  String name= namecontroller.text.trim();
                  String number=numbercontroller.text.trim();

                  if(name.isNotEmpty && number.isNotEmpty){
                    setState(() {
                      namecontroller.text='';
                      numbercontroller.text='';      //data ekk add kala pahu ee text field eke his karna code ek 
                      contacts.add(Contact(name: name, number: number));
                    });
                  }

                }, child: const Text("SAVE")),
                
              ],
             ),

             SizedBox(height: 20),

            Expanded(
              child:
              contacts.isEmpty ? Center(child: Text("No contacts"),):
              ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) => 
                Card(
                  child: ListTile(
                    title: Column(
                      children: [
                        Text(contacts[index].name),
                  
                        Text(contacts[index].number)//display eke pennana data
                      ],
                    ),
                    leading: CircleAvatar(backgroundColor: index%2 == 0 ? Colors.blueGrey :Colors.redAccent,
                    child: Text(contacts[index].name.substring(0,2)),
                    foregroundColor: Colors.white,
                    ),
                    trailing: SizedBox(
                      width: 70,
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Icon(Icons.edit),
                            onTap: () {
                              selectindex = index;// list eke index ek selectindex ekt samana karanwa
                              namecontroller.text = contacts[index].name;
                              numbercontroller.text = contacts[index].number;// edit button ek click kalahama ud thiyen text field walata yawima

                            },
                          ),
                          SizedBox(width: 20),

                          GestureDetector(
                            child: Icon(Icons.delete),
                            onTap: () {
                              setState(() {
                                contacts.removeAt(index);
                              });
                            },

                          ), // card eke thiyen edite and delete button
                        ],
                      ),
                    ),
                    
                  ),
                ),
              ),
            )

          ],
        ),
      )
    );
  }
}