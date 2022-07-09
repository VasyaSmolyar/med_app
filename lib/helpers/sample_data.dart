import 'package:med_app/models/diagnosis.dart';
import 'package:med_app/models/pacient.dart';

final sampleData = [
  Pacient(
    id: '1', 
    firstName: "Александр", 
    lastName: "Дятлов", 
    secondName: "Терентьевич", 
    birthDay: DateTime(1986, 06, 18), 
    sex: Sex.male,
    image: 'assets/person.png',
    address: 'г. Таганрог, ул. Петровская, 89 Е, кв. 401', 
    diagnoses: [
      const Diagnosis(title: 'Острый гастроэнтерит'),
      const Diagnosis(title: 'Хронический гастрит'),
    ]
  ),

  Pacient(
    id: '2', 
    firstName: "Иван", 
    lastName: "Тестов", 
    secondName: "Витальевич", 
    birthDay: DateTime(1956, 01, 01), 
    sex: Sex.male,
    address: 'г. Таганрог, ул. Петровская, 89 Е, кв. 402', 
    diagnoses: [
      const Diagnosis(title: 'Хронический гастрит'),
    ]
  )
];
