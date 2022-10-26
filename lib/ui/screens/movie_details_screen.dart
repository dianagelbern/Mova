import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mova/ui/styles.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [header(), body()],
      )),
    );
  }

  Widget header() {
    return Container(
      height: 280,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        'assets/images/poster_template.jpg',
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget body() {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Titulo de la película',
            style: Styles.textTitle,
          ),
          Row(
            children: [
              Container(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.star_half,
                      color: Color(0xFFE21221),
                      size: 20,
                    ),
                    Text(
                      '9.8',
                      style: Styles.textSubtitleRed,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xFFE21221),
                      size: 25,
                    ),
                    Text(
                      '2022',
                      style: Styles.textSubtitle,
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  height: 30,
                  child: Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        '+13',
                        style: Styles.textSubtitleRed,
                      )),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE21221), width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ))
            ],
          ),
          Text(
            'Description',
            style: Styles.textSubtitle,
          ),
          actorItem()
        ],
      ),
    );
  }

  Widget actorItem() {
    return Container(
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://googleflutter.com/sample_image.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Actor',
                    style: Styles.textSubtitleBold,
                  ),
                  Text(
                    'rol',
                    style: Styles.textSubtitleGray,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
