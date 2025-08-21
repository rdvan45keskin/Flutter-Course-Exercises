import 'package:flutter/material.dart';
import 'package:guncellemebuttonuislevi/models/student.dart';
import 'package:guncellemebuttonuislevi/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  //constructor
  //gelen students listesini burada yakalıyoz
  late List<Student> students;

  StudentAdd(List<Student> _students) {
    this.students = _students;
  }

  @override
  State<StatefulWidget> createState() {
    //yakaladığımız students listesini diğer classa yolluyoz
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State<StudentAdd> with StudentValidationMixin {
  //constructor
  late List<Student> students;
  _StudentAddState(List<Student> _students) {
    this.students = _students;
  }

  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Yeni Öğrenci Ekle")),
        body: Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(20.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  buildFirstNameField(),
                  buildLastNameField(),
                  buildGradeField(),
                  buildSubmitButton(),
                ],
              )),
        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: "Öğrenci Adı", hintText: "Güçsüz"),
      //max 10 karakter olmalıdır gibi kuralları bunla yazioz
      validator: validateFirstName,
      onSaved: (String? value) {
        student.firstName = value ?? "";
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Musa"),
      //max 10 karakter olmalıdır gibi kuralları bunla yazioz
      validator: validateLastName,
      onSaved: (String? value) {
        student.lastName = value ?? "";
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: "Öğrenci Notu", hintText: "31"),
      validator: validateGrade,
      onSaved: (String? value) {
        if (value != null && value.isNotEmpty) {
          student.grade =
              int.tryParse(value) ?? 0; // Null kontrolü ve güvenli parse
        } else {
          student.grade = 0;
        }
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: const Text("Kaydet"),
      onPressed: () {
        final form = formKey
            .currentState; // formKey.currentState'i bir değişkene atıyoruz.
        if (form != null && form.validate()) {
          // Null kontrolü ile validate çağırma
          form.save(); // Save işlemi
          students.add(student);
          // Öğrenci verilerini kaydetmek için gerekli işlemleri yapabilirsiniz.
          saveStudent();
          //ana sayfaya yollama
          Navigator.pop(context, student);
        }
      },
    );
  }

  void saveStudent() {
    print("${student.firstName} ${student.lastName} ${student.grade}");
  }
}
