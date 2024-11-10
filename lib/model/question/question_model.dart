class QuestionModel {
  QuestionModel({
    required this.id,
    required this.questionText,
    required this.correctAnserId,
    required this.choices,
  });

  final int id;
  final String questionText;
  final String correctAnserId;
  final List<Choice> choices;
}

class Choice {
  Choice({
    required this.id,
    required this.questionId,
    required this.choiceText,
  });

  final int id;
  final int questionId;
  final String choiceText;
}
