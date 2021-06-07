import 'package:flutter/material.dart';
import 'package:geopro/services/sponsorship.dart';
import 'package:geopro/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:geopro/helpers/string_extensions.dart';

class SponsorshipListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperOne(),
            child: Image.asset('assets/student_graduate.jpg'),
          ),
        ],
      ),
    );
  }
}
