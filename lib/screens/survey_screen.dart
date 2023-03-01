import 'package:flutter/material.dart';

class SurveyQuestion extends StatefulWidget {
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  const SurveyQuestion({
    Key? key,
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  }) : super(key: key);

  @override
  _SurveyQuestionState createState() => _SurveyQuestionState();
}

class _SurveyQuestionState extends State<SurveyQuestion> {
  int? _selectedOptionIndex;
  int _score = 0;

  void _checkAnswer() {
    if (_selectedOptionIndex == widget.correctOptionIndex) {
      setState(() {
        _score++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.question,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.options.length,
              itemBuilder: (context, index) {
                return RadioListTile<int>(
                  title: Text(widget.options[index]),
                  value: index,
                  groupValue: _selectedOptionIndex,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedOptionIndex = value;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _checkAnswer();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Answer'),
                      content: Text(
                        _selectedOptionIndex == widget.correctOptionIndex
                            ? 'Correct!'
                            : 'Incorrect.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Submit'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Score: $_score',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
