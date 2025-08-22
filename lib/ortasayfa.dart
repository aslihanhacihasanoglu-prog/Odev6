import 'package:flutter/material.dart';

import 'package:odev6/kiyafetler.dart';

class DetaySayfa extends StatefulWidget {
  final Kiyafetler urun;
  const DetaySayfa({super.key,required this.urun});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.urun.ad}"),),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/${widget.urun.resim}"),
              Text("${widget.urun.ad} Detayına Git",style: TextStyle(fontSize: 50),),


            ],
          ),
        ),
      ),
    );
  }
}
