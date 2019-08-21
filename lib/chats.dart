import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Event Chats';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(12.0),
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://www.windsor-racecourse.co.uk/images/upload/YourVENUE-Christmas-Parties-5050-1340x1004.jpg'),
              ),
              onTap: () {
                // do something
              },
              title: Text(
                "Aarohi's Hosue Party",
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text('Subhash: Where is the party?'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://s3.amazonaws.com/bit-photos/large/8355791.jpeg'),
              ),
              onTap: () {
                // do something
              },
              title: Text(
                'Vidhya Vox Concert',
                style: TextStyle(fontSize: 24),  
              ),
              subtitle: Text('Varnika: Wow. It was sooo much fun.'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQV9GDFftfG_kIm9SKd86FUG-1J23iZDUFVhNAJ4pphRAja-zzQ'),
              ),
              onTap: () {
                // do something
              },
              title: Text(
                "Dumb Charades",
                style: TextStyle(fontSize: 24),  
              ),
              subtitle: Text('Gautami: Sent a new picture!'),
            ),
          ],
        ),
      ),
    );
  }
}