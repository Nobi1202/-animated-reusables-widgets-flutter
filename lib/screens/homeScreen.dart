import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/contants.dart';
import '../widgets/complexCard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late SnackBar snackBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0,
        backgroundColor: secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: defaultMargin * 2,
              ),
              Container(
                margin: const EdgeInsets.only(right: 15),
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ComplexAnimatedCard(
                        hasTags: true,
                        title: "Title " + index.toString() + " here ",
                        date: "28 May",
                        subtitle: " subtitle " + index.toString() + " here...",
                        summary:
                            "summary here, summary here, summary here, summary here, summary here,summary here, summary here,summary here,summary here ,summary here, summary here... ",
                        actionButonText: "Action",
                        picturePath: "assets/png/default.png",
                        key: UniqueKey(),
                        tagTextList: const [
                          "Tag buton1",
                          "Tag buton2",
                          "Tag buton3",
                          "Tag buton4",
                          "Tag buton5",
                          "Tag buton6",
                          "Tag buton7"
                        ],
                        dismissText: "One element is dismissed",
                      );
                    },
                    itemCount: 50),
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
