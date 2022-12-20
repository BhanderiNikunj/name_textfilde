import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List l1=[];
  TextEditingController txtname = TextEditingController();
  String name="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: txtname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Your Name",
                      focusedBorder: OutlineInputBorder()
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      name = txtname.text;
                      l1.add(name);
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text("submit"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: l1.asMap().entries.map((e) => Name(l1[e.key])).toList(),
                  ),
                ),
              ],
            ),
          ),
         )
    );
  }
  Widget Name(dynamic name)
  {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("$name"),
                ),
                InkWell(onTap: () {
                  setState(() {
                    l1.removeAt(0);
                  });
                },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                          Icons.delete
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}