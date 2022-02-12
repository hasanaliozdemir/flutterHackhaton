import 'package:flutter_app/models/question.dart';
import 'package:flutter_app/models/subject.dart';

class Student {
  final String name;
  final int grade;
  final String email;
  final int point;
  final List<Subject> loseSubjects;
  final List<Question> questions;

  Student(this.name, this.grade, this.email, this.point, this.loseSubjects, this.questions);
}