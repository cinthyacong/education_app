import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:blog_app/screens/blog-detail.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  var URL = "https://codesundar.com/wp-json/wp/v2/posts";
  List _users = [];

  getContactFromNetwork() async {
    try {
      await http.get(Uri.parse(URL)).then((res) {
        print("Success");
        // print(res.body);
        var resp = json.decode(res.body);
        setState(() {
          _users = resp;
        });
        // print(_users);
        // print(json.decode(res.toString()));
      }).catchError((e) {
        // print("Error");
        // print(e);
      });
    } catch (e) {
      // print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Blog"), actions: [
        IconButton(
          onPressed: () {
            getContactFromNetwork();
          },
          icon: Icon(Icons.refresh),
        )
      ]),
      body: Container(
        child: _users.length == 0
            ? Text("Please make request")
            : ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _users.length,
                itemBuilder: (bc, index) {
                  return Card(
                      child: ListTile(
                    title: Text(
                      "${_users[index]['title']['rendered']}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blueGrey,
                      ),
                    ),
                    tileColor: Colors.white,
                    subtitle: Text(
                        "${_users[index]['yoast_head_json']['description']}"),
                    // leading: CircleAvatar(
                    //   backgroundImage: NetworkImage(_users[index]['avatar']),
                    // ),

                    onTap: () {
                      Get.to(ContactDetail(
                          imgURL: _users[index]['yoast_head_json']['og_image']
                              [0]['url'],
                          title: _users[index]['title']['rendered'],
                          description: _users[index]['yoast_head_json']
                              ['description'],
                          //  user = _users[index]['yoast_head_json']['og_site_name']
                          content: _users[index]['content']['rendered']));
                    },
                  ));
                },
              ),
      ),
    );
  }
}
