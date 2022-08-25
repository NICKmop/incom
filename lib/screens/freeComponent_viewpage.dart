import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.constants.dart';
import '../constants/common.constants.dart';

class freeComponent_viewpage extends StatefulWidget {
  const freeComponent_viewpage({Key? key}) : super(key: key);

  @override
  State<freeComponent_viewpage> createState() => freeComponentviewpageState();
}

class freeComponentviewpageState extends State<freeComponent_viewpage> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTapContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];


  Future<void> getPostsData() async {

    DocumentReference<Map<String, dynamic>> docref =
    FirebaseFirestore.instance.collection("crawlingData").doc('DONGJAK');
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await docref.get();
    var valueDoc = documentSnapshot.data();
    
    List<dynamic> valueData = [];
    valueDoc?.forEach((key, value) {
      valueData.add(value);
      print("value : $value");
    });
    
    List<dynamic> responseList= valueData;
    // List<dynamic> responseList = FOOD_DATAs;
    List<Widget> listItems = [];

    for ( var post in responseList){

      print(post['center_name']);

      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${post["title"]}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '기관명 | ${post['center_name ']}',
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '시작일 | ${post['registrationdate']}',
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          )));
    }
    // for (var post in responseList) {
    //   listItems.add(Container(
    //       height: 150,
    //       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    //       decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
    //         BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
    //       ]),
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: <Widget>[
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Text(
    //                   post["name"],
    //                   style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    //                 ),
    //                 Text(
    //                   post["brand"],
    //                   style: const TextStyle(fontSize: 17, color: Colors.grey),
    //                 ),
    //                 const SizedBox(
    //                   height: 10,
    //                 ),
    //                 Text(
    //                   "\$ ${post["price"]}",
    //                   style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
    //                 ),
    //                 IconButton(
    //                   iconSize: 2,
    //                   onPressed: (){getfirePostsData();},
    //                   icon: Icon(Icons.ac_unit)
    //                 )
    //               ],
    //             ),
    //           ],
    //         ),
    //       )));
    // }
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTapContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height*0.30;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CupertinoSearchTextField(
            prefixIcon: const Icon(Icons.search),
            placeholder: "관련 검색",
            placeholderStyle:
            const TextStyle(fontSize: 14,color: AppColors.hintText),
            onChanged: (value) {
              print(value);
            },
          ),
        ),
        backgroundColor: Colors.white,
        drawer: Drawer( // 함수로 뺴야하는 부분
          child: RESION_LIST_MENU
        ),
        body: SizedBox(
          height: size.height,
          child: Column(
            children: <Widget>[
              AnimatedOpacity(
                opacity: closeTapContainer?0:1,
                duration: const Duration(milliseconds: 200),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: size.width,
                  alignment: Alignment.topCenter,
                  height: closeTapContainer?0:categoryHeight,
                  child: categoriesScroller,),
              ),
              Expanded(
                  child: ListView.builder(
                    itemCount: itemsData.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (c, i){
                      double scale = 1.0;
                      if (topContainer > 0.5){
                        scale = i + 0.5 - topContainer;
                        if (scale < 0 ) { scale = 0;}
                        else if (scale > 1) { scale = 1; }
                      }
                      return Opacity(
                        opacity: scale,
                        child: Transform(
                          transform: Matrix4.identity()..scale(scale, scale),
                          alignment: Alignment.bottomCenter,
                          child: Align(
                            heightFactor: 0.95,
                            alignment: Alignment.topCenter,
                            child: itemsData[i],
                          ),
                        ),
                      );
                    }
                  )
              )
            ],
          ),
        ),
      )
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 375,
                margin: const EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.blueAccent.shade100),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "현재 인기가\n가장 많은 지원사업",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "지원사업 보러가기",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}