import 'package:intl/intl.dart';
import 'package:med_app/models/diagnosis.dart';

enum Sex {
  male,
  female
}

class Pacient {
  const Pacient({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.secondName,
    this.image,
    required this.birthDay,
    required this.sex,
    required this.address,
    required this.diagnoses
  }); 

  final String id;

  final String firstName;

  final String lastName;

  final String secondName;

  final String? image;

  final DateTime birthDay;

  final Sex sex;

  final String address;

  final List<Diagnosis> diagnoses;

  Pacient copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? secondName,
    String? image,
    DateTime? birthDay,
    Sex? sex,
    String? address,
    List<Diagnosis>? diagnoses,
  }) {
    return Pacient(
      id: id ?? this.id, 
      firstName: firstName ?? this.firstName, 
      lastName: lastName ?? this.lastName, 
      secondName: secondName ?? this.secondName,
      image: image ?? this.image, 
      birthDay: birthDay ?? this.birthDay, 
      sex: sex ?? this.sex, 
      address: address ?? this.address, 
      diagnoses: diagnoses ?? this.diagnoses
    );
  }

  String get initials => "$lastName ${firstName[0]}. ${secondName[0]}.";

  String get fullName => "$lastName $firstName $secondName";

  String get sexTitle => sex == Sex.male ? "Мужской" : "Женский";

  String get birthString {
    final yearDiff = DateTime.now().year - birthDay.year;
    final yearEnd = yearDiff % 100;
    String end;

    if(yearEnd == 0 || (yearDiff >= 10 && yearDiff <= 14)) {
      end = 'лет';
    } else if(yearEnd == 1) {
      end = 'год';
    } else if(yearEnd < 5) {
      end = 'года';
    } else {
      end = 'лет';
    }

    return "$birthDay ($yearDiff $end)";
  }
}
