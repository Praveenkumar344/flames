import 'package:flutter/material.dart';

class flames extends StatefulWidget {
  const flames({key, required this.n, required this.result});
  final int n;
  final String result;
  @override
  State<flames> createState() => _flamesState();
}

class _flamesState extends State<flames> {
  @override
  Widget build(BuildContext context) {
    Map rela = Map();
    rela["F"] = Color.fromARGB(255, 18, 113, 191);
    rela["L"] = Color.fromARGB(255, 18, 113, 191);
    rela["A"] = Color.fromARGB(255, 18, 113, 191);
    rela["M"] = Color.fromARGB(255, 18, 113, 191);
    rela["E"] = Color.fromARGB(255, 18, 113, 191);
    rela["S"] = Color.fromARGB(255, 18, 113, 191);
    rela[widget.result] = Color.fromARGB(255, 54, 220, 20);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
            print(widget.n);
          },
        ),
        title: Text("FLAMES "),
        backgroundColor: Color.fromARGB(249, 216, 30, 216),
        toolbarHeight: 60,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Text(
              "YOUR RELATONSHIP WILL BE ...",
              style: const TextStyle(
                color: Color.fromARGB(255, 60, 156, 235),
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 10),
            btext("FRIENDS", Color.fromARGB(249, 216, 30, 216), rela["F"]),
            btext("LOVE", Color.fromARGB(249, 216, 30, 216), rela["L"]),
            btext("AFFECTON", Color.fromARGB(249, 216, 30, 216), rela["A"]),
            btext("MARRIAGE", Color.fromARGB(249, 216, 30, 216), rela["M"]),
            btext("ENEMY", Color.fromARGB(249, 216, 30, 216), rela["E"]),
            btext("SISTER", Color.fromARGB(249, 216, 30, 216), rela["S"]),
          ])),
    );
  }

  Widget btext(String str, Color clr, Color bg) {
    return (Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
                color: bg, borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Text(
                str,
                style: TextStyle(
                    color: clr, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ))));
  }
}
