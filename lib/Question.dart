class Question {
  String questionText = '';

  // ignore: file_names
  bool questionAnswer = false;

  Question({required String questionText, required bool questionAnswer}) {
    this.questionText = questionText;
    this.questionAnswer = questionAnswer;
  }
}
