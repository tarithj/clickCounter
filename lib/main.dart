
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int counter = 0;
bool fade = false;
bool clicked = false;

void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Click counter"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: ClickCounter(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          if (fade != true) {
            fade = true;
          }
          clicked = !clicked;
          counter++;
          setState(() {});
        },
        backgroundColor: Colors.deepOrange,
        tooltip: 'add',
      ),
    );
  }
}

class ClickCounter extends StatefulWidget {
  @override
  _ClickCounterState createState() => _ClickCounterState();
}

class _ClickCounterState extends State<ClickCounter> {

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Tutorial(),
           Container(
             child: Center(
               child: Text(
                 '$counter',
                 style: TextStyle(
                   fontSize: clicked? 100.0 : 99.0,
                   color: Colors.black,
                 ),
               ),
             ),
           ),
           Container(
               padding: EdgeInsets.all(15.0),
               child: Center(
                 child: IconButton(
                   icon: Icon(Icons.clear),
                   onPressed: (){
                     counter = 0;
                     setState(() {});
                   },
                   tooltip: "clear counter",
                 ),
               )
           )
         ]
       )
    );
  }
}

class Tutorial extends StatefulWidget {
  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 700),
      curve: Curves.easeInOut,

      opacity: fade? 0.0 : 1.0,
      child: Container(
        padding: EdgeInsets.all(6.0),
        child: Text(
          'Click on the plus icon to start',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey
          ),
        ),
      ),
    );
  }
}
