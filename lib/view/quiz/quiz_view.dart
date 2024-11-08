import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  final List<String> _questions = [
    'What is the capital of France?',
    'What is 2 + 2?',
    'What is the boiling point of water?'
  ]; // Replace with SharedPreferences-loaded questions
  final List<List<String>> _choices = [
    ['Paris', 'London', 'Berlin', 'Madrid'],
    ['3', '4', '5', '6'],
    ['90°C', '100°C', '110°C', '120°C']
  ];
  int? _selectedAnswerIndex;

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswerIndex = null;
      });
    } else {
      // Submit the quiz and navigate to the results page.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quiz Completed!')),
      );
      // Navigator.push to results page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Time'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}/${_questions.length}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / _questions.length,
            ),
            const SizedBox(height: 16),
            Text(
              _questions[_currentQuestionIndex],
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: _choices[_currentQuestionIndex].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_choices[_currentQuestionIndex][index]),
                    leading: Radio<int>(
                      value: index,
                      groupValue: _selectedAnswerIndex,
                      onChanged: (value) {
                        setState(() {
                          _selectedAnswerIndex = value;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _selectedAnswerIndex != null ? _nextQuestion : null,
              child: Text(_currentQuestionIndex < _questions.length - 1
                  ? 'Next'
                  : 'Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
