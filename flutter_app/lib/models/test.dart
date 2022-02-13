import 'package:flutter_app/models/testQuestion.dart';

class Test {
  final int length;
  final List<TestQuestion> questions;
  final bool solved;

  Test(this.length, this.questions, this.solved);
}