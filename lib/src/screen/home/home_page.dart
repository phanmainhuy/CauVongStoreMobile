import 'package:flutter/material.dart';

import '../../resources/app_color.dart';
import 'nav_drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: AppColor.kPrimaryColor,
      ),
      drawer: NavDrawerWidget(),
      // body: _buildCard(),
    );
  }
}
