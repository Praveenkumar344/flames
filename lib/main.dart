import 'package:flames/flames.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter",
      home: _homepage(),
    );
  }
}

class _homepage extends StatefulWidget {
  const _homepage();
  @override
  State<_homepage> createState() => __homepageState();
}

class __homepageState extends State<_homepage> {
  @override
  final txt1controller = TextEditingController();
  final txt2controller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLAMES "),
        // backgroundColor: Color.fromARGB(248, 216, 30, 145),
        backgroundColor: Color.fromARGB(249, 216, 30, 216),
        toolbarHeight: 60,
      ),
      backgroundColor: Color.fromARGB(255, 152, 35, 182),
      // backgroundColor: Color.fromARGB(255, 216, 45, 159),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Let's find your relationship...",
                style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: txt1controller,
                decoration: InputDecoration(
                  hintText: "His Name...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      child:
                      txt1controller.clear();
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: txt2controller,
                decoration: InputDecoration(
                  hintText: "Her Name...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      child:
                      txt2controller.clear();
                    },
                  ),
                ),
              ),
            ),
            MaterialButton(
                child: Text("Find"),
                color: Colors.blue,
                onPressed: () {
                  String name1 =
                      txt1controller.text.replaceAll(" ", "").toLowerCase();
                  String name2 =
                      txt2controller.text.replaceAll(" ", "").toLowerCase();
                  if (name1.isNotEmpty && name2.isNotEmpty) {
                    String s1 = name1, result;
                    List<String> s2 = name2.split('');
                    int num1 = 0, n;
                    for (int i = 0; i < s1.length; i++) {
                      if (s2.contains(s1[i]))
                        s2.remove(s1[i]);
                      else
                        num1 += 1;
                    }
                    n = num1 + s2.length;
                    if (n != 0) {
                      result = relation(n);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  flames(n: n, result: result)));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => Container(
                                child: AlertDialog(
                                    title: Text(
                                        "Kindly enter the different names.."),
                                    backgroundColor:
                                        Color.fromARGB(255, 135, 57, 155),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "OK",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    249, 216, 30, 216)),
                                          ))
                                    ]),
                              ));
                    }
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) => Container(
                              child: AlertDialog(
                                  title: Text("Kindly fill both the boxes"),
                                  backgroundColor:
                                      Color.fromARGB(255, 135, 57, 155),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "OK",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  249, 216, 30, 216)),
                                        ))
                                  ]),
                            ));
                  }
                })
          ],
        ),
      ),
    );
  }

  String relation(n) {
    List<String> l = ["F", "L", "A", "M", "E", "S"];
    int count = 0;
    int i = 0, j;
    while (l.length != 1) {
      count = 1;
      while (count != n) {
        if (i >= l.length - 1)
          i = 0;
        else
          i += 1;
        count += 1;
      }
      if (i >= (l.length - 1)) {
        j = i;
        i = 0;
      } else {
        j = i;
      }
      l.remove(l[j]);
    }
    print(l[0]);
    return (l[0]);
  }
}
