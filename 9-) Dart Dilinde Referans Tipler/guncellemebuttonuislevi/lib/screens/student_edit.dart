import 'package:flutter/material.dart';
import 'package:guncellemebuttonuislevi/models/student.dart';
import 'package:guncellemebuttonuislevi/validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  late Student selectedStudent;
  StudentEdit(Student student) {
    this.selectedStudent = student;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _studentEditState(selectedStudent);
  }
}

class _studentEditState extends State<StudentEdit> with StudentValidationMixin {
  late Student selectedStudent;
  _studentEditState(Student student) {
    this.selectedStudent = student;
  }

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Öğrenci Güncelle")),
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
      //varsayılan değer verme
      initialValue: selectedStudent.firstName,
      decoration:
          const InputDecoration(labelText: "Öğrenci Adı", hintText: "Gülcan"),
      //max 10 karakter olmalıdır gibi kuralları bunla yazioz
      validator: validateFirstName,
      onSaved: (String? value) {
        selectedStudent.firstName = value ?? "";
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      //varsayılan değer verme
      initialValue: selectedStudent.lastName,
      decoration: const InputDecoration(
          labelText: "Öğrenci Soyadı", hintText: "Keskin"),
      //max 10 karakter olmalıdır gibi kuralları bunla yazioz
      validator: validateLastName,
      onSaved: (String? value) {
        selectedStudent.lastName = value ?? "";
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      //varsayılan değer verme
      initialValue: selectedStudent.grade.toString(),
      decoration:
          const InputDecoration(labelText: "Öğrenci Notu", hintText: "86"),
      validator: validateGrade,
      onSaved: (String? value) {
        if (value != null && value.isNotEmpty) {
          selectedStudent.grade =
              int.tryParse(value) ?? 0; // Null kontrolü ve güvenli parse
        } else {
          selectedStudent.grade = 0;
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
          // Öğrenci verilerini kaydetmek için gerekli işlemleri yapabilirsiniz.
          saveStudent();
          //ana sayfaya yollama
          Navigator.pop(context, selectedStudent);
        }
      },
    );
  }

  void saveStudent() {
    print(
        "${selectedStudent.firstName} ${selectedStudent.lastName} ${selectedStudent.grade}");
  }
}
