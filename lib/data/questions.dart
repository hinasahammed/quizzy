import 'package:quizzy/model/question/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
    id: 1,
    questionText: 'What is the capital of France?',
    choices: [
      Choice(id: 1, questionId: 1, choiceText: 'Paris'),
      Choice(id: 2, questionId: 1, choiceText: 'Rome'),
      Choice(id: 3, questionId: 1, choiceText: 'Madrid'),
      Choice(id: 4, questionId: 1, choiceText: 'Berlin'),
    ],
  ),
  QuestionModel(
    id: 2,
    questionText: 'Who wrote "To Kill a Mockingbird"?',
    choices: [
      Choice(id: 5, questionId: 2, choiceText: 'Harper Lee'),
      Choice(id: 6, questionId: 2, choiceText: 'Mark Twain'),
      Choice(id: 7, questionId: 2, choiceText: 'J.K. Rowling'),
      Choice(id: 8, questionId: 2, choiceText: 'Ernest Hemingway'),
    ],
  ),
];
