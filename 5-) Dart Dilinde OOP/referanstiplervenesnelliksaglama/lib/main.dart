import 'dart:io';

import 'package:flutter/material.dart';
import 'package:referanstiplervenesnelliksaglama/models/student.dart';
//import 'package:flutter/cupertino.dart';    ios görüntüsü

void main() {
  //material sınıfında çalışmasını sağlar
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      //uygulama iskeleti
      home: MyApp()));
}

//widget oluşturma
// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  String mesaj = "Öğrenci Takip Sistemi";
  List<Student> students = [
    Student("Engin", "Demiroğ", 45, "assets/4.png"),
    //"https://cdn.pixabay.com/photo/2022/04/02/20/22/woman-7107687_1280.png"),
    Student("Rıdvan", "Keskin", 65, "assets/sekiro_smiling.png"),
    //"https://cdn.pixabay.com/photo/2022/04/02/20/22/woman-7107687_1280.png"),
    Student("Nicat", "İşler", 100, "assets/sekirot.jpg"),
    //"https://cdn.pixabay.com/photo/2022/04/02/20/22/woman-7107687_1280.png"),
    Student("Gülcan", "Keskin", 38, "assets/yakuza.jpg"),
    //"https://cdn.pixabay.com/photo/2022/04/02/20/22/woman-7107687_1280.png")
  ];
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(children: [
      //genişletilmiş liste listview  column ile calışamıyo expanded koymak lazımmış
      Expanded(
          //eleman sayısı kadar alttaki buildcontexti çalıştırıyomuş
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  leading: CircleAvatar(
                    //backgroundImage: NetworkImage(students[i].imageUrl),
                    backgroundImage: AssetImage(students[i].imageUrl),
                  ),
                  title:
                      Text("${students[i].firstName} ${students[i].lastName}"),
                  subtitle: Text(
                      "Sınavdan aldığı not : ${students[i].grade} [${students[i].getStatus}]"),
                  trailing: buildStatusIcon(students[i].grade),
                  onTap: () {
                    print(
                        "${students[i].firstName} ${students[i].lastName} ${students[i].grade} [${students[i].getStatus}]");
                    String mesaj = students[i].getStatus;
                    mesajGoster(context,
                        "${students[i].firstName} ${students[i].lastName} --> $mesaj");
                  },
                );
              })),
      Center(
        child: ElevatedButton(
          onPressed: () {
            var mesaj = sinavHesapla(55);
            mesajGoster(context, mesaj);
          },
          child: const Text("Sonucu gör !"),
        ),
      ),
    ]);
  }

  //ikon döndürcez
  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return const Icon(Icons.done);
    } else if (grade >= 40) {
      return const Icon(Icons.album);
    } else {
      return const Icon(Icons.warning_sharp);
    }
  }

  //sınav puanı hesaplama basitce ama bunu kullanmioz
  String sinavHesapla(int puan) {
    String mesaj = "";
    if (puan >= 50) {
      mesaj = "Geçti : $puan";
    } else if (puan >= 40) {
      mesaj = "Bütünleme : $puan";
    } else {
      mesaj = "Kaldı : $puan";
    }
    return mesaj;
  }

  //mesaj gösterme fonksiyonu
  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: const Text("Sınav Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
