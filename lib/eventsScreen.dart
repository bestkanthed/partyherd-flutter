import 'package:flutter/material.dart';
import 'package:partyherd/addEvent.dart';

class EventsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://cdn4.iconfinder.com/data/icons/music-and-entertainment/512/Music_Entertainment_Crowd-512.png'),
                    ),
                    title: Text('The Enchanted Nightingale'),
                    subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () {/* ... */},
                        ),
                        FlatButton(
                          child: const Text('KNOW MORE'),
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://image.shutterstock.com/image-vector/party-time-90s-style-label-260nw-476849917.jpg'),
                    ),
                    title: Text("House Party At Shashwat's"),
                    subtitle: Text('Bollywood style. Surprise special Guest.'),
                  ),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('REQUEST INVITATION'),
                          onPressed: () {/* ... */},
                        ),
                        FlatButton(
                          child: const Text('KNOW MORE'),
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-c_UcTVm2AL1meeJgyDYiVWfDnfH7WBti3gLFvqTLf-gj0FVc'),
                    ),
                    title: Text('Football at Nahar Amritshakti'),
                    subtitle: Text('9 Players per Team. Filling Fast.'),
                  ),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('GET SPOT'),
                          onPressed: () {/* ... */},
                        ),
                        FlatButton(
                          child: const Text('KNOW MORE'),
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddEvent()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}