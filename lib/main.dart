import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task/utils/colors.dart';
import 'package:task/utils/styles.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  int _currentItem = 1;
  bool pressAttention = false;
 ScrollController  _scrollController = ScrollController();
  double height;
  double imageHeight;
  double width;
  bool isExamineClicked=false;
  String selectedSize="SELECT SIZE";
  String selected="SWEET CORAL";
  GlobalKey <ScaffoldState> scaffoldKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageHeight = 300;
    initAnimation();
  }
  @override
  Widget build(BuildContext context) {
     height = MediaQuery.of(context).size.height;
     width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      body: buildHomeBody(),
      endDrawer: _buildDrawer(),
    );
  }
List<String> itemsSize = [
  "XSMALL","SMALL","MEDIUM","LARGE","XLARGE","XXLARGE"
];
  List<String> items = [
  "SWEET CORAL ","LIGHT HEATHER GREY","BLEACH"
];
  _buildHeader() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        imageHeight == 300 ?  Icon(Icons.close): InkWell(
            onTap: (){
              // setState(() {
              //   imageHeight = 300;
              // });
              _pressOrReturnAddToCard(300);
            },
            child: Icon(Icons.arrow_back)),
        Stack(
            children: <Widget>[
          Icon(Icons.work, color: blue,size: 30,),
              Positioned  (
                  right: 10,
                  top: 9,
                  child: Text("2",style: mediumWhite,))])
      ],
    );
  }
  _buildHeadIcon() {
    return Column (
      children: <Widget>[
        Tab(icon :Image.asset("assets/shamaa.png",width: 100,height: 100,fit: BoxFit.fitHeight,)),
        Text("MY CLOSET", style:mediumHeadline,)
      ],
    );
  }
  _checkAnimation() {
    if (isExamineClicked) {
      controller.reset();
      controller.forward();
      isExamineClicked = false;
    }
  }

  AnimationController controller;
  Animation<double> classificationAnimation;
  Animation<Offset> pulseAnimation;
  Widget listItemBuilder(int index ) {
    return Container(
      child: Container(
        alignment: Alignment.center,
        width: width * .9,
        height: height * .8,
        padding: const EdgeInsets.only(top:16.0),
        child: ListView  (
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("aero new york ath-detp graphic t",style:mediumBlack.copyWith(letterSpacing: 2) ,),
                    Text("sweet coral",style:mediumSubHeadline.copyWith(letterSpacing: 1) ,),
                    Text("\$10.00",style:longBlack.copyWith(letterSpacing: 1) ,),
                    Text("\$24.50",style:mediumSubHeadline.copyWith(letterSpacing: 1) ,),

                  ],
                )
              ],
            ),
            AnimatedContainer(
                height: imageHeight,
                duration: Duration(seconds: 1),
                child: Image.asset("assets/t_shirt.png", fit: BoxFit.fitHeight,)),
            imageHeight !=300 ?
            Container(
              width: width * .95,
              height: height * .12,
              child: SlideTransition  (
                position: pulseAnimation,
                child: Text("if a relaxing boardwalk stroll with the BF is in order, be sure to wear our stylish  "
                      "braided faux leather sandal! the upper is design with slim '"
                      " braided straps and a subtly shnlny ,antiqued bickle for a look that's a chic "
                      " match with your flirtiest threads  ",overflow: TextOverflow.ellipsis,
                      maxLines: 6,)),
            ):Container(),
           imageHeight !=300 ?  FadeTransition(
              opacity: classificationAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OutlineButton(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(selectedSize , style:  mediumSubHeadline,),
                  Icon(Icons.keyboard_arrow_down ,color: grey,)
                ],
              ),
                    onPressed: (){
                   setState(() {
                     optionSelected= 0;

                   });
                   scaffoldKey.currentState.openEndDrawer();
                    },padding: EdgeInsets.all(16),borderSide: BorderSide(width: 2,color: grey),

                  ),
                  OutlineButton(child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(selected , style:  mediumSubHeadline,),
                      Icon(Icons.keyboard_arrow_down,color: grey,)
                    ],
                  ),
                    onPressed: (){
                      setState(() {
                        optionSelected= 1;

                      });
                      scaffoldKey.currentState.openEndDrawer();

                    },padding: EdgeInsets.all(16),borderSide: BorderSide(width: 2,color: grey),

                  )
                ],
              ),

            ) : Container()

          ],
        ),
      ),
    );
  }
  int optionSelected = 0;
  _buildDrawer() {
    return Theme(
      data: Theme.of(context).copyWith(
        // Set the transparency here
        canvasColor: Colors.black54, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
      ),
      child: Drawer(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.all(8),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(flex:1,child: Icon(Icons.close, color: OFFWHITE,)),
                  Expanded(flex:6,child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("SELECT SIZE ", style: mediumBlack.copyWith(color: OFFWHITE),),
                    ],
                  ))
                ],
              ),
              optionSelected == 0 ? Container(
                height: MediaQuery.of(context).size .height * .8,
                child: ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom:16.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                          setState(() {
                            selectedSize = itemsSize[i];
                          });
                        },
                        child: ListItem(
                          item: itemsSize[i],
                   //   onTap: () => itemsSize[i].onTap(context),
                        ),
                      ),
                    );
                  },
                  itemCount: itemsSize.length,
                ),
              ):
              Container(
                height: MediaQuery.of(context).size .height * .8,
                child: ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom:16.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                          setState(() {
                            selected = items[i];
                          });
                        },
                        child: ListItem(
                          item: items[i],
                          //   onTap: () => itemsSize[i].onTap(context),
                        ),
                      ),
                    );
                  },
                  itemCount: items.length,
                ),
              ),
            ],
          )
          ,),
      ),
    );
  }

  void initAnimation() {
    controller = AnimationController(
        duration: Duration(milliseconds:1000), vsync: this);
    pulseAnimation = Tween<Offset>(
      begin: Offset(-6.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.5,
          0.7,
          curve: Curves.ease,
        ),
      ),
    );
    classificationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.bounceInOut,
        ),
      ),
    );
  }

  buildHomeBody() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0,left: 16.0,bottom: 16.0,top: 64),
      child: buildHomeColumn(),
    );
  }

  buildHomeColumn() {
    return SingleChildScrollView(
      child: Column(

        children: <Widget>[
          _buildHeader(),
          _buildHeadIcon(),
          _buildContainer(),
          SizedBox(height: 10,),
          _buildRowOfCurrentItem(),
          SizedBox(height: 16,),
          _buildFloatingBtn(),
          SizedBox(height: 16,),
          imageHeight !=300 ?
          Container(
            width: width * .95,
            height: height * .12,
            child: SlideTransition  (
                position: pulseAnimation,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("ic_facebook.png"),
                    Image.asset("ic_twitter.png"),
                    Image.asset("ic_indtagram.png"),
                  ],
                )),
          ): _buildOuterBtn()
        ],
      ),
    );
  }

  _buildContainer() {
    return Container(
      height: height * .6,
      width: double.infinity,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index){
          return VisibilityDetector
            (
            key: Key(index.toString()),
            child: listItemBuilder(index),
            onVisibilityChanged: (VisibilityInfo info) {
              if (info.visibleFraction == 1)
                setState(() {
                  _currentItem = index+1;
                  print(_currentItem);
                });
            },
          );
        },
      ),

    );
  }

  _buildRowOfCurrentItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("$_currentItem of 37",style:mediumSubHeadline.copyWith(letterSpacing: 1) ,),
      ],
    );
  }

  void _pressOrReturnAddToCard(int i){
    setState(() {
      pressAttention = !pressAttention;
    });
    // pressAttention = !pressAttention;
    Future.delayed(Duration(milliseconds: 50)).then((onValue){
      setState(() {

        if (imageHeight!=i){
          isExamineClicked =true;
          _checkAnimation();
        }
        imageHeight = i.toDouble();

      });
    });
  }

  _buildFloatingBtn() {
    return FlatButton(
      color: !pressAttention ?   blue : black ,
      child: Text("ADD TO CARD" , style:  mediumWhite,),onPressed: (){
        _pressOrReturnAddToCard(200);


      },padding: EdgeInsets.all(16),hoverColor:blue ,);
  }

  _buildOuterBtn() {
    return OutlineButton(child: Text("REMOVE FROM CLOSET" , style:  mediumSubHeadline,),
      onPressed: (){

      },padding: EdgeInsets.all(16),borderSide: BorderSide(width: 2,color: grey),

    );
  }



}

class ListItem extends StatelessWidget {
  final String item;

  ListItem({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: transparent,
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(item, style: longWhite.copyWith(fontWeight: FontWeight.normal, fontSize: 19,color: DARKOFFWHITE),),
              Container(width: 15,height: 15,
                decoration: BoxDecoration(shape: BoxShape.circle,color: transparent,border: Border.all(color: OFFWHITE)
                ),),

            ],
          ),
        ),
        Divider(height: 1,thickness: 1,color: DARKOFFWHITE,)
      ],
    );
  }
}
