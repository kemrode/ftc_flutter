import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HouseMoveMainView extends StatefulWidget {
  final String houseMoveName;
  final String houseMoveDate;
  const HouseMoveMainView({required this.houseMoveName, required this.houseMoveDate});
  @override
  _HouseMoveMainViewState createState() => _HouseMoveMainViewState();
}

class _HouseMoveMainViewState extends State<HouseMoveMainView> {

  List<String> boxes = ["CA01","CA02","CA03","CA04","CA05"];

  List<Widget> itemBoxes() {
    List<Widget> items = [];
    boxes.forEach((element) {
      final widget = boxesToShow(element);
      items.add(widget);
    });
    return items;
  }

  Widget boxesToShow(String element) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(element),
          const Icon(Icons.check_circle)
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("FTC menu principal", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
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
        child: Expanded(
          child: Container(
              width: size.width * 0.5,
              height: size.height * 0.2,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.houseMoveName, style: const TextStyle(color: Colors.blueAccent),),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.houseMoveDate, style: const TextStyle(color: Colors.blueAccent),)
                        ],
                      )
                    ],
                  ),
                  ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return boxesToShow(boxes[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                      itemCount: boxes.length)
                ],
              )
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AlertDialog alert = newBoxAlert();
          showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return alert;
              });
        },
        child: const Icon(Icons.add_circle_outline, color: Colors.white,),
      ),
    );
  }

  AlertDialog newBoxAlert() {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      title: const Text("Nouveau Carton"),
      elevation: 5,
      content: Container(
        width: size.width * 0.85,
        height: size.height * 0.5 ,
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
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

