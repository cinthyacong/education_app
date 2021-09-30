import 'package:flutter/material.dart';

class ContactDetail extends StatelessWidget {
  String imgURL = "";
  String title = "";
  String description = "";
  String content = "";
  // String user = "";

  ContactDetail({
    required this.imgURL,
    required this.title,
    required this.description,
    required this.content,
    // required this.user
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network('$imgURL', height: 200.0, fit: BoxFit.cover),
                  // Text("$title"),
                  // Text("$description")
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Text(
                            "$title",
                            style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.blue,
                      height: 32.0,
                    ),
                    Card(
                      child: ListTile(
                        // leading: CircleAvatar(
                        //   backgroundImage: AssetImage(
                        //       "..."), // no matter how big it is, it won't overflow
                        // ),
                        // title: Text("$user"),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.blue,
                      height: 32.0,
                    ),
                    Text("$content")
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
