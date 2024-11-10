import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:quizzy/data/questions.dart';
import 'package:quizzy/model/questionSummary/question_summary_model.dart';
import 'package:quizzy/res/components/constants/custom_button.dart';
import 'package:quizzy/view/quizResult/quiz_result_view.dart';
import 'package:quizzy/viewmodel/provider/quiz/quiz_controller.dart';
import 'package:uuid/uuid.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  int _currentQuestionIndex = 0;
  List<Map<String, String>> userAnswer = [];
  int correctAnswerCount = 0;
  int answeredCount = 0;
  int unAnsweredCount = 0;
  int timerCount = 30;
  Timer? _timer;
  late String userId;

  @override
  void initState() {
    super.initState();
    startQuizTimer();
    userId = Provider.of<QuizController>(context, listen: false).fetchId();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            snap: false,
            title: const Text('Quiz Time'),
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Question ",
                                  style: theme.textTheme.headlineSmall),
                              TextSpan(
                                text: "${_currentQuestionIndex + 1}",
                                style: theme.textTheme.headlineMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: "/${questions.length}",
                                style: theme.textTheme.headlineSmall!.copyWith(
                                  color: theme.colorScheme.onSurface
                                      .withOpacity(.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    LinearProgressIndicator(
                      value: (_currentQuestionIndex + 1) / questions.length,
                    ),
                    const Gap(20),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${_currentQuestionIndex + 1}. ${questions[_currentQuestionIndex].questionText}",
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Timer",
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Card(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: Text(
                                timerCount.toString(),
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      ...questions[_currentQuestionIndex].choices.map(
                            (choice) => Card(
                              child: InkWell(
                                onTap: () {
                                  resetTimer();
                                  getUserAnswer(
                                      questions[_currentQuestionIndex]
                                          .id
                                          .toString(),
                                      questions[_currentQuestionIndex]
                                          .correctAnserId
                                          .toString(),
                                      choice.id.toString());
                                  nextQuestion();
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    choice.choiceText,
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: theme.colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      const Gap(20),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CustomButton(
                          onPressed: () {
                            nextQuestion();
                          },
                          btnText: "Skip",
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void nextQuestion() {
    if (_currentQuestionIndex < questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      var correctAnserList = userAnswer.where(
        (element) =>
            element['correct_answerId'] == element['selected_answerId'],
      );
      setState(() {
        correctAnswerCount = correctAnserList.length;
        answeredCount = userAnswer.length;
        unAnsweredCount = questions.length - userAnswer.length;
      });
      _timer?.cancel();
      var summary = QuestionSummaryModel(
        id: const Uuid().v4(),
        userId: userId,
        correctAnswersCount: correctAnswerCount,
        answeredCount: answeredCount,
        skippedCount: unAnsweredCount,
        quizPoint: correctAnswerCount * 2,
      );
      Provider.of<QuizController>(context, listen: false).saveQuiz(summary);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultView(
            questionSummaryModel: summary,
          ),
        ),
      );
    }
  }

  getUserAnswer(
    String questionId,
    String correctAnswerId,
    String selectedAnswerId,
  ) {
    setState(() {
      userAnswer.add({
        "question_id": questionId,
        "correct_answerId": correctAnswerId,
        "selected_answerId": selectedAnswerId,
      });
    });
  }

  void startQuizTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          timerCount--;
        });
        if (timerCount == 0) {
          timer.cancel();
          nextQuestion();
          resetTimer();
        }
      },
    );
  }

  void resetTimer() {
    _timer?.cancel();
    setState(() {
      timerCount = 30;
    });
    startQuizTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
