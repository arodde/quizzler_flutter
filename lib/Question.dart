class Question {
  /**
   * links a question ant its answer.
   */
  String questionText = '';

  // ignore: file_names
  bool questionAnswer = false;

  Question(String questionText, bool questionAnswer) {
    this.questionText = questionText;
    this.questionAnswer = questionAnswer;
  }
}
