import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infant_incubator/view/widgets/infant_widget.dart';


class InfantScreen extends StatelessWidget {
  const InfantScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffb6d0f3),
          foregroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Infant Incubator ',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Color(0xffb6d0f3),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/babyGame.gif'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              InfantWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
