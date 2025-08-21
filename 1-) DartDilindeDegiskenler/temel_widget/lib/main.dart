import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';    ios görüntüsü

void main() {
  String mesaj = "Merhaba ilk uygulamam";
  //material sınıfında çalışmasını sağlar
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //uygulama iskeleti
    home: Scaffold(
      //appbar işte
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          mesaj,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Gövde Kısım"),
      ),
    ),
  ));
}
