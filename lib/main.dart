// ignore_for_file: prefer_interpolation_to_compose_strings, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'App Übung 3',
      home: MyHomePage(title: 'Tour Details'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: const Color.fromRGBO(254, 60, 0, 1),
        ),
        drawer: const Drawer(),
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              HeaderContainer("Highlight Tour"),
                              LoremTextContainer(),
                              InformationPair("Gebäude", "Zoo"),
                              InformationPair("Sammlung", "Interesannte Tiere"),
                              InformationPair("Dauer", "1 Stunde"),
                              InformationBoxSmall("TOUR STARTEN"),
                            ]),
                      ),
                      const InformationBoxBig("Eule",
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      const InformationBoxBig("Waschbär",
                          "https://images.pexels.com/photos/10767665/pexels-photo-10767665.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                      const InformationBoxBig("Leopard",
                          'https://images.pexels.com/photos/62324/leopard-safari-wildier-botswana-62324.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      const InformationBoxBig("Papagei",
                          'https://images.pexels.com/photos/105808/pexels-photo-105808.jpeg'),
                      const InformationBoxBig("Adler",
                          'https://images.pexels.com/photos/158330/steppe-eagle-eagle-steppe-nature-158330.jpeg'),
                    ]))));
  }
}

class InformationPair extends StatelessWidget {
  final String first;
  final String second;

  const InformationPair(this.first, this.second);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text.rich(TextSpan(children: [
          TextSpan(
              text: first + ": ",
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          TextSpan(
            text: second,
          )
        ])));
  }
}

class HeaderContainer extends StatelessWidget {
  final String headerString;

  const HeaderContainer(this.headerString);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        headerString,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}

class LoremTextContainer extends StatelessWidget {
  const LoremTextContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 15),
        child: const Text(
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
          style: TextStyle(fontSize: 15),
        ));
  }
}

class InformationBoxBig extends StatelessWidget {
  final String informationBoxBigText;
  final String informationBoxBigImg;
  const InformationBoxBig(
      this.informationBoxBigText, this.informationBoxBigImg);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: const Color.fromRGBO(254, 60, 0, 1), width: 2)),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: AspectRatio(
                  aspectRatio: 20 / 20,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    child: Image(
                      image: NetworkImage(informationBoxBigImg),
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: 7,
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    informationBoxBigText,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ))),
          const Expanded(
            flex: 1,
            child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.navigate_next,
                  size: 24.0,
                )),
          ),
        ],
      ),
    );
  }
}

class InformationBoxSmall extends StatelessWidget {
  final String informationBoxSmallText;

  const InformationBoxSmall(this.informationBoxSmallText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: const Color.fromRGBO(254, 60, 0, 1), width: 2)),
      width: 200,
      child: Row(
        children: <Widget>[
          const Expanded(
            flex: 2,
            child: Icon(
              Icons.signpost_outlined,
              color: Color.fromRGBO(254, 60, 0, 1),
              size: 24.0,
            ),
          ),
          Expanded(
            flex: 8,
            child: Text(
              informationBoxSmallText,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromRGBO(254, 60, 0, 1)),
            ),
          ),
        ],
      ),
    );
  }
}
