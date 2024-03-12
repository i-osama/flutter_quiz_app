import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/top_bar.dart';

class Dashboard extends StatelessWidget{
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const TopNavBar(),
      appBar: AppBar(title: const Text("Dashboard"),),
    );
  }

}