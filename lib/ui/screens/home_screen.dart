import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mova/ui/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(child: Container(
            child: Column(
      children: [header(), listMovieItem()],
    )),));
  }

  Widget header() {
    return SizedBox(
      height: 400,
      //Stack for the background image
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/poster_template.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          width: 800,
          color: Color.fromARGB(137, 28, 26, 41),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            height: 50,
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. Strange 2',
                  style: Styles.textTitle,
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Action, Super Hero ',
                    style: Styles.textRegular,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget listMovieItem() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular Movies', style: Styles.textTitle,),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text('See all', style: Styles.textSubtitleRed,),
                )
              ],
            ),
          ),
          Container(
              width: 150,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/poster_template.jpg',
                      fit: BoxFit.fitHeight,
                      height: MediaQuery.of(context).size.height,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10),
                      width: 30,
                      height: 20,
                      color: Colors.red,
                      child: Text('9.0',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
