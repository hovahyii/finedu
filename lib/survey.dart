class SurveyQuestion {
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  SurveyQuestion(
      {required this.question,
      required this.options,
      required this.correctOptionIndex});
}

List<SurveyQuestion> financialLiteracySurvey = [
  SurveyQuestion(
    question: 'What is the capital of France?',
    options: ['London', 'Paris', 'Berlin', 'Rome'],
    correctOptionIndex: 1,
  ),
];
