import 'package:flutter/material.dart';
import 'package:untitled/Pages/houseMoveMainView.dart';

class MainMemu extends StatefulWidget {
  const MainMemu({Key? key}) : super(key: key);

  @override
  _MainMemuState createState() => _MainMemuState();
}

class _MainMemuState extends State<MainMemu> {
  // Properties
  String houseMoveName = "";
  String dateOfHouseMove = "";
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

  @override
  Widget build(BuildContext context) {
    // Size
    Size size = MediaQuery.of(context).size;

    // Scaffold
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
        color: Colors.white70,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: size.width * 0.65,
              height: size.height * 0.08,
              child: ElevatedButton(
                onPressed: () {
                  AlertDialog alert = NewHouseMove();
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext ctx) {
                        return alert;
                      });
                },
                child: const Text("Nouveau Déménagement"),
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(15),
                    backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent)
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.65,
              height: size.height * 0.08,
              child: ElevatedButton(
                onPressed: null,
                child: const Text("Mes Déménagaments"),
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(15),
                    backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AlertDialog NewHouseMove() {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      title: const Text("Nouveau déménagement"),
      content: Container(
        width: size.width*0.65,
        height: size.height*0.25,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(child: Text("Veuillez renseigner les informations"))
                  ],
                )),
            Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: "Nom du déménagement",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            )
                        ),
                        keyboardType: TextInputType.name,
                        onSubmitted: (newString) {
                          setState(() {
                            houseMoveName = newString;
                          });
                        },
                      ),
                    ),
                  ],
                )),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                              hintText: "Date du déménagement",
                              border:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              )
                          ),
                          keyboardType: TextInputType.datetime,
                          onSubmitted: (newString) {
                            setState(() {
                              dateOfHouseMove = newString;
                            });
                          },
                        )),
                  ],
                )),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  final houseMoveMainView = HouseMoveMainView(houseMoveName: houseMoveName, houseMoveDate: dateOfHouseMove);
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext ctx) {
                        return houseMoveMainView;
                      }));
                },
                child: const Text("Créer déménagement")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Annuler",
                  style: TextStyle(color: Colors.red),)),
          ],
        ),
      ],
    );
  }

}
