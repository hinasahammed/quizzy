import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quizzy/data/questions.dart';
import 'package:quizzy/res/components/constants/custom_button.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  int _currentQuestionIndex = 0;

  int? _selectedAnswerIndex;

  void _nextQuestion() {
    if (_currentQuestionIndex < questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswerIndex = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quiz Completed!')),
      );
    }
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
            expandedHeight: 250.0,
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
                                  style:
                                      theme.textTheme.headlineMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  )),
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
                ...questions[_currentQuestionIndex].choices.map(
                      (choice) => RadioListTile<int>(
                        title: Text(choice.choiceText),
                        value: questions[_currentQuestionIndex]
                            .choices
                            .indexOf(choice),
                        groupValue: _selectedAnswerIndex,
                        onChanged: (value) {
                          setState(() {
                            _selectedAnswerIndex = value;
                          });
                        },
                      ),
                    ),
                const Gap(40),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 50,
                    child: CustomButton(
                      onPressed:
                          _selectedAnswerIndex != null ? _nextQuestion : null,
                      btnText: _currentQuestionIndex < questions.length - 1
                          ? 'Next'
                          : 'Submit',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
