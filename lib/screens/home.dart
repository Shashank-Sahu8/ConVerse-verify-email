import 'package:con_verse_email_verification/services/api_fetch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:lottie/lottie.dart';
class MuHomePage extends StatefulWidget {
  const MuHomePage({super.key});

  @override
  State<MuHomePage> createState() => _MuHomePageState();
}

class _MuHomePageState extends State<MuHomePage> {
  bool temp=false;
  @override
  void initState()  {
    super.initState();
    final String url = html.window.location.href;
    final Uri uri = Uri.parse(url);
    final String token = uri.queryParameters['token'] ?? '';
    verifyUser(token).then((value){
      setState(() {
        temp=value;
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: temp==true?Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
             'animations/3.json',
              height:300,
              reverse:true,
              repeat:true,
            ),
            Text("Email Verified Successfully",style: TextStyle(fontWeight:FontWeight.w600,fontSize: 20 ),)
          ],
        ):
        Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'animations/1.json',
              height:300,
              reverse:true,
              repeat:true,
            ),
            Text("Please Waite...",style: TextStyle(fontWeight:FontWeight.w600,fontSize: 20 ),)
          ],
        )
            ),
      );
  }
}
