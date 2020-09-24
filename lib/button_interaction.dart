import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class ButtonInteraction extends StatefulWidget {
  @override
  _ButtonInteractionState createState() => _ButtonInteractionState();
}

class _ButtonInteractionState extends State<ButtonInteraction> {
  int _counter = 0;
  bool _isPlaying = true;
  String _sec = "On";

  IconButton buildKey({Widget widget}) {
    return IconButton(
      icon: widget,
      iconSize: 27,
      color: Colors.white,
      onPressed: () {},
    );
  }

  void _upCounter() {
    setState(() {
      _counter++;
    });
  }

  void _downCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(top: 10.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(
                      'https://www.inovex.de/blog/wp-content/uploads/2019/01/Flutter-1-1.png'),
                ),
                title: Text(
                  'Flutter',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "What if you see the dash when you liked Flutter tweets? 💙",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        buildKey(widget: Icon(Icons.comment)),
                        buildKey(widget: Icon(Icons.repeat)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: IconButton(
                                iconSize: 27,
                                icon: FlareActor(
                                  "assets/animation/Button.flr",
                                  animation: _sec,
                                  isPaused: _isPlaying,
                                ),
                                onPressed: () {
                                  var animationName =
                                      (_sec == "On") ? "Off" : "On";
                                  setState(() {
                                    if (_isPlaying == true) {
                                      _isPlaying = false;
                                    } else {
                                      _sec = animationName;
                                    }
                                  });
                                  setState(() {
                                    if (_sec == "On") {
                                      _upCounter();
                                    } else {
                                      _downCounter();
                                    }
                                  });
                                },
                              ),
                            ),
                            Text(
                              '$_counter',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        buildKey(widget: Icon(Icons.share)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
