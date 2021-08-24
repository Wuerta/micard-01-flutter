import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MiCard());

class MiCard extends StatelessWidget {
  /// Add your picture url
  final pictureUrl = 'https://picsum.photos/200';

  /// Add your name
  final name = 'Your Name';

  /// Add your occupation
  final occupation = 'Your Occupation';

  /// Add your phone number
  final phoneNumber = '+111 (11) 1111111';

  /// Add your email
  final email = 'email@email.com';

  /// Add only [PRIMARY COLORS](https://material.io/design/color/the-color-system.html#color-usage-and-palettes)
  /// This not accept Black or White Color
  final color = Colors.grey;

  const MiCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: color,
        primarySwatch: color,
        accentColor: color,
      ),
      home: Scaffold(
        backgroundColor: color,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(pictureUrl),
                    ),
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 40,
                        color: color.shade50,
                      ),
                    ),
                    Text(
                      occupation.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: color.shade100,
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                      width: 150,
                      child: Divider(color: color.shade50),
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      color: color.shade50,
                      child: ListTile(
                        onTap: () => launch('tel://$phoneNumber'),
                        leading: Icon(Icons.phone, color: color),
                        title: Text(
                          phoneNumber,
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 20,
                            color: color.shade900,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      color: color.shade50,
                      child: ListTile(
                        onTap: () => launch(
                          'mailto://$email?subject=Contact&body=Hello!',
                        ),
                        leading: Icon(Icons.email, color: color),
                        title: Text(
                          email,
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 20,
                            color: color.shade900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
