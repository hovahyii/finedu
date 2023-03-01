import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

class AnalyticScreen extends StatefulWidget {
  const AnalyticScreen({Key? key}) : super(key: key);

  @override
  _AnalyticScreenState createState() => _AnalyticScreenState();
}

class _AnalyticScreenState extends State<AnalyticScreen> {
  bool isAddTaskOpen = false;

  @override
  Widget build(BuildContext context) {
    const ticks = [7, 14, 21, 28, 35];
    var features = [
      "Saving",
      "Planning",
      "Retirement",
      "Cash Flow",
      "Debt",
      "Income",
      "Knowledge",
      "Management"
    ];
    var data = [
      [10.0, 20, 28, 5, 16, 15, 17, 6],
      [14.5, 1, 4, 14, 23, 10, 6, 19]
    ];

    // Randomly assign a value to each feature
    var random = new Random();
    for (var i = 0; i < features.length; i++) {
      data[0][i] = random.nextDouble() * 35;
      data[1][i] = random.nextDouble() * 35;
    }

    // Determine number of features to show
    var numberOfFeatures = 8;
    features = features.sublist(0, numberOfFeatures.floor());
    data = data
        .map((graph) => graph.sublist(0, numberOfFeatures.floor()))
        .toList();

    // List of tips/hints or tasks to help user improve financial literacy
    List<String> tips = [];
    if (features.contains("Planning") &&
        data[0][features.indexOf("Planning")] < 15) {
      tips.add('Create a budget to improve your Planning.');
    }
    if (features.contains("Saving") &&
        data[0][features.indexOf("Saving")] < 15) {
      tips.add(
          'Try to save at least 10% of your income to improve your Saving.');
    }
    if (features.contains("Cash Flow") &&
        data[0][features.indexOf("Cash Flow")] < 15) {
      tips.add('Track your spending to improve your Cash Flow.');
    }
    if (features.contains("Debt") && data[0][features.indexOf("Debt")] > 25) {
      tips.add('Pay off high-interest debts to improve your Debt score.');
    }
    if (features.contains("Knowledge") &&
        data[0][features.indexOf("Knowledge")] < 15) {
      tips.add(
          'Read books or take courses on personal finance to improve your Knowledge.');
    }

    // List of tasks to improve financial literacy
    List<String> tasks = [];

// Saving task
    if (features.contains("Saving") &&
        data[0][features.indexOf("Saving")] < 15) {
      tasks.add('Try to save at least 10% of your income.');
    }

// Planning task
    if (features.contains("Planning") &&
        data[0][features.indexOf("Planning")] < 15) {
      tasks.add('Create a budget and stick to it.');
    }

// Retirement task
    if (features.contains("Retirement") &&
        data[0][features.indexOf("Retirement")] < 15) {
      tasks.add(
          'Learn about retirement savings options and start contributing.');
    }

// Cash Flow task
    if (features.contains("Cash Flow") &&
        data[0][features.indexOf("Cash Flow")] < 15) {
      tasks.add('Track your expenses and make a plan to increase your income.');
    }

// Debt task
    if (features.contains("Debt") && data[0][features.indexOf("Debt")] > 25) {
      tasks.add(
          'Create a debt repayment plan and start paying off high-interest debts.');
    }

// Income task
    if (features.contains("Income") &&
        data[0][features.indexOf("Income")] < 15) {
      tasks.add(
          'Explore ways to increase your income, such as negotiating a raise or finding a side job.');
    }

// Knowledge task
    if (features.contains("Knowledge") &&
        data[0][features.indexOf("Knowledge")] < 15) {
      tasks.add(
          'Read books or take courses on personal finance to improve your knowledge.');
    }

// Management task
    if (features.contains("Management") &&
        data[0][features.indexOf("Management")] < 15) {
      tasks.add('Create a financial plan and regularly review and adjust it.');
    }

    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: SizedBox(
                height: 300,
                child: RadarChart.light(
                  ticks: ticks,
                  features: features,
                  data: data,
                  reverseAxis: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tips to Improve Financial Literacy:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: tips
                        .map(
                          (tip) => Text(
                            '- ' + tip,
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Tasks:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: tasks
                        .map(
                          (task) => Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (value) {
                                },
                              ),
                              SizedBox(width: 8),
                              Expanded(child: Text(task)),
                            ],
                          ),
                        )
                        .toList(),
                  )
                ],
              ),
            ),
          ]),
    );
  }
}
