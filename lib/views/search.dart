import 'package:chatination/widgets/widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarMain(context),
      body: new Container(
        child: Column(
          children: [
            Container(
              color: Color(0x54ffffff),
              padding: EdgeInsets.symmetric(vertical: 16 , horizontal: 24),
              child: new Row(
                children: [
                  Expanded(child: TextField(
                    style: TextStyle(
                        color: Colors.white
                      ),
                    decoration: InputDecoration(
                      hintText: "search username ...",
                      hintStyle: TextStyle(
                        color: Colors.white54
                      ),
                      border: InputBorder.none
                    ),
                  )),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors:[
                            const Color(0x36ffffff),
                            const Color(0x0ffffff)
                        ]
                        ),
                        borderRadius: BorderRadius.circular(40)
                    ),
                    padding: EdgeInsets.all(12),
                    child: Image.asset("assets/images/search_white.png"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}