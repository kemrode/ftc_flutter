import 'package:flutter/material.dart';
import 'package:untitled/Pages/newBoxView.dart';

class HouseMoveMainView extends StatefulWidget {
  final String houseMoveName;
  final String houseMoveDate;
  const HouseMoveMainView({required this.houseMoveName, required this.houseMoveDate});
  @override
  _HouseMoveMainViewState createState() => _HouseMoveMainViewState();
}

class _HouseMoveMainViewState extends State<HouseMoveMainView> {

  List<String> boxes = ["CA01","CA02","CA03","CA04","CA05"];


  Map<String, String> rooms = {
    "cuisine":"CUI",
    "chambre enfant":"CHE",
    "chambre parents":"CHP",
    "chambre ami":"CHA",
    "salon":"SAL",
    "bureau":"BUR",
    "garage":"GAR",
    "salle de bain":"SDB",
  };
  List<String> listOfRooms = ["cuisine", "chambre enfant", "chambre parents", "chambre ami", "salon", "bureau", "garage", "salle de bain"];
  List<String> listOfKitchenItems = [
    "casseroles","petits ustensiles","assiettes","verres","bols","couverts","plats","conserves",
    "produit entretien"
  ];
  List<String> listOfKidsItem = [
    "jouets","jeux","livres enfants","vêtements enfant","couverture","draps","alèze","affaires bébé",
    "oreiller","couette"
  ];
  List<String> listOfParents = [
    "drap","couverture","couette","oreillers","vêtements homme","vêtements femme","grande tenue",
    "lampe de chevet"
  ];
  List<String> listOfFriendRoom = [
    "drap","oreiller","couverture","lampe de chevet","matériel scrap"
  ];
  List<String> listOfMainRoom = [
    "assiette","luminaire","livres","bd","manga","dvd","cd","jeux vidéos","couverts","verres"
  ];
  List<String> listOfDesk = [
    "administratif","ordinateur","petit matériel de bureau","feuilles blanches","cahiers"
  ];
  List<String> listOfBathroom = [
    "savons","shampooing","serviettes","gants de toilette","matériel salle de bain"
  ];

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

  Widget boxesSelectionView(String element) {
    return Padding(
        padding: EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(element),
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
          // final newBoxView = NewBoxView();
          // Navigator.of(context).pop();
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (BuildContext ctx) {
          //     return newBoxView;
          //   })
          // );
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
                    children: [
                      Expanded(child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return boxesSelectionView(listOfRooms[index]);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider();
                          },
                          itemCount: listOfRooms.length))

                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

