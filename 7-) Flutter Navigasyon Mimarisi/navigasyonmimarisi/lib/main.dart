import 'package:flutter/material.dart';
import 'package:navigasyonmimarisi/models/student.dart';
import 'package:navigasyonmimarisi/screens/student_add.dart';

//import 'package:flutter/cupertino.dart';    ios görüntüsü

void main() {
  //material sınıfında çalışmasını sağlar
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      //uygulama iskeleti
      home: MyApp()));
}

//widget oluşturma
//değer değişse bile ekran değişmez
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";
  Student selectedStudent = Student.withId(0, "", "", 0, "");

  List<Student> students = [
    Student.withId(1, "Engin", "Demiroğ", 45, "assets/4.png"),
    Student.withId(2, "Rıdvan", "Keskin", 65, "assets/sekiro_smiling.png"),
    Student.withId(3, "Nicat", "İşler", 100, "assets/sekirot.jpg"),
    Student.withId(4, "Selo", "Altaşşak", 31, "assets/yakuza.jpg"),
  ];

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
                    //değişebilmeyi sağlıyo
                    setState(() {
                      selectedStudent = students[i];
                    });
                    //print(selectedStudent.firstName);
                    /*
                    String result = students[i].getStatus;
                    mesajGoster(context,
                        "${students[i].firstName} ${students[i].lastName} --> $result");
                    */
                  },
                );
              })),
      Text(
          "Seçili öğrenci : ${selectedStudent.firstName} ${selectedStudent.lastName}"),
      //satır şeklinde dizi gibi bişey
      Row(
        children: [
          //ekranı doldurur

          //ekleme butonu
          Flexible(
            fit: FlexFit.tight,
            //ekrandan ne kadar pay alacağı
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                //başka sayfaya yönlendirme bu önemli !!!
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentAdd()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text("Yeni Öğrenci"),
                ],
              ),
            ),
          ),

          //güncelleme butonu
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                var mesaj = "Güncellendi";
                mesajGoster(context, mesaj);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[200],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.update),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text("Güncelle"),
                ],
              ),
            ),
          ),
          
          //silme butonu
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  students.remove(selectedStudent);
                  var mesaj =
                      "Silindi : ${selectedStudent.firstName} ${selectedStudent.lastName}";
                  mesajGoster(context, mesaj);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[200],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text("Sil"),
                ],
              ),
            ),
          )
        ],
      )
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

  //mesaj gösterme fonksiyonu
  void mesajGoster(BuildContext context, String sonuc) {
    var alert = AlertDialog(
      title: const Text("İşlem Sonucu"),
      content: Text(sonuc),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
