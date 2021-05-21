import 'package:flutter/material.dart';
import 'package:geopro/apply_screen.dart';
import 'package:geopro/sponsorship_screen.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                'Choose Action',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Card(
                    elevation: 2.0,
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ApplyScreen(),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Center(
                          child: Text(
                            'Apply For Sponsorship',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2.0,
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SponsorshipScreen(),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Center(
                          child: Text(
                            'View sponsorships',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
