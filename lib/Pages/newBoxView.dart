import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewBoxView extends StatefulWidget {
  const NewBoxView({Key? key}) : super(key: key);

  @override
  State<NewBoxView> createState() => _NewBoxViewState();
}

class _NewBoxViewState extends State<NewBoxView> {
  @override
  Widget build(BuildContext context) {
    //Properties
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouveau carton", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
        backgroundColor: Colors.blue,
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(Icons.person)
          ),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.cyan,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [],
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
