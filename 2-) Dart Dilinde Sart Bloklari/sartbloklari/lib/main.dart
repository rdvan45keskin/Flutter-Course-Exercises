import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';    ios görüntüsü

void main() {
  //material sınıfında çalışmasını sağlar
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      //uygulama iskeleti
      home: MyApp()));
}

//widget oluşturma
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String mesaj = "Merhaba ilk uygulamam";
    int puan = 65;
    return Scaffold(
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
        child: ElevatedButton(
          onPressed: () {
            String mesaj = "";
            if (puan >= 50) {
              mesaj = "Geçti : " + puan.toString();
            } else if (puan >= 40) {
              mesaj = "Bütünleme : " + puan.toString();
            } else {
              mesaj = "Kaldı : " + puan.toString();
            }

            var alert = AlertDialog(
              title: const Text("Sınav Sonucu"),
              content: Text(mesaj),
            );
            showDialog(
                context: context, builder: (BuildContext context) => alert);
          },
          child: const Text("Sonucu gör"),
        ),
      ),
    );
  }
}
