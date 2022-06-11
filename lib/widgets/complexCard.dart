import 'package:animated_resusables_widgets/utils/animationBiblio.dart';
import 'package:animated_resusables_widgets/utils/contants.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/fontFamily.dart';
import 'butonWidget.dart';

class ComplexAnimatedCard extends StatefulWidget {
  String title;
  String date;
  String subtitle;
  String summary;
  List<String> tagTextList;
  bool hasTags;
  String picturePath;
  String actionButonText;
  String dismissText;

  ComplexAnimatedCard({
    required Key key,
    required this.title,
    this.subtitle = "",
    this.summary = "",
    this.hasTags = true,
    required this.tagTextList,
    required this.date,
    required this.picturePath,
    required this.actionButonText,
    required this.dismissText,
  }) : super(key: key);

  @override
  _ComplexAnimatedCard createState() => _ComplexAnimatedCard();
}

class _ComplexAnimatedCard extends State<ComplexAnimatedCard> {
  late SnackBar snackBar;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.startToEnd,
      onDismissed: (_) async {
        snackBar = const SnackBar(
            content: Text("One element is dismissed"),
            duration: Duration(milliseconds: 5000));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: MShowUpLeft(
        child: Container(
          margin: const EdgeInsets.only(
              right: 7, left: defaultMargin, bottom: defaultMargin * 1.5),
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              ListTile(
                title: Row(
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: apppPrimaryFont,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.date,
                      style: TextStyle(
                        color: subtitleColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontFamily: apppPrimaryFont,
                      ),
                    ),
                  ],
                ),
                subtitle: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    widget.subtitle,
                    style: TextStyle(
                        color: subtitleColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: apppPrimaryFont),
                  ),
                ),
                leading: MShowUpLeft(
                  child: Container(
                    margin: const EdgeInsets.only(right: defaultMargin * 0.6),
                    child: Image.asset(
                      widget.picturePath,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  delay: 250,
                ), //ACCORDING TO THE IMAGE TYPE if it svg, use SvgPicture.asset,
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text(""),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: Text(
                        widget.summary,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: apppPrimaryFont),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (widget.hasTags)
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Text(""),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return index % 2 == 0
                                ? //To make different amination in tagsList according to the tag position
                                MShowUpRight(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        right: 5,
                                      ),
                                      height: 30,
                                      padding: const EdgeInsets.only(
                                        left: defaultMargin * 0.4,
                                        right: defaultMargin * 0.4,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: tagsColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(7),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          widget.tagTextList.elementAt(index),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: apppPrimaryFont,
                                          ),
                                        ),
                                      ),
                                    ),
                                    delay: middledelay,
                                  )
                                : MShowUpLeft(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        right: 5,
                                      ),
                                      height: 30,
                                      padding: const EdgeInsets.only(
                                          left: defaultMargin * 0.4,
                                          right: defaultMargin * 0.4),
                                      decoration: const BoxDecoration(
                                        color: tagsColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(7),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          widget.tagTextList.elementAt(index),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: apppPrimaryFont,
                                          ),
                                        ),
                                      ),
                                    ),
                                    delay: middledelay,
                                  );
                          },
                          itemCount: widget.tagTextList.length,
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(
                height: defaultMargin,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                        margin: const EdgeInsets.only(left: 19, right: 8),
                        child: MShowUp(
                          child: PrimaryButonWidget(
                            text: widget.actionButonText,
                            hasBackground: true,
                            onTap: () {},
                          ),
                          delay: longDelay,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
        delay: speedDelay,
      ),
    );
  }
}
