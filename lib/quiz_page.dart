import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizModel quizModel;
  int currentQuestion = 1;
  int score = 0;

  Future fetchData() async {
    http.Response response;
    response =
        await http.get(Uri.parse('https://opentdb.com/api.php?amount=10'));
    var body = response.body;
    var json = jsonDecode(body);
    setState(() {
      quizModel = QuizModel.fromJson(json);
      quizModel.results[currentQuestion].incorrectAnswers
          .add(quizModel.results[currentQuestion].correctAnswer);
      quizModel.results[currentQuestion].incorrectAnswers.shuffle();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    quizModel;
  }

  changeQuestion() {
    if (quizModel.results.length - 1 == currentQuestion) {
      print('quiz complete');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ResultPage(score: score)));
    } else {
      setState(() {
        currentQuestion++;
        quizModel.results[currentQuestion].incorrectAnswers
            .add(quizModel.results[currentQuestion].correctAnswer);
        quizModel.results[currentQuestion].incorrectAnswers.shuffle();
      });
    }
  }

  checkAnswer(answer) {
    if (quizModel.results[currentQuestion].correctAnswer == answer) {
      print('correct');
      score = score + 10;
    } else {
      print('wrong');
    }
    changeQuestion();
  }

  @override
  Widget build(BuildContext context) {
    if (quizModel == null) {
      return Scaffold(
        body: Center(child: const CircularProgressIndicator()),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'TRIVIA APP',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Question $currentQuestion',
                style: TextStyle(color: Colors.blueAccent),
              ),
              Text(quizModel.results[currentQuestion].question),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Text(
                'Choices',
                style: TextStyle(color: Colors.blueAccent),
              ),
              Column(
                children: quizModel.results[currentQuestion].incorrectAnswers
                    .map((e) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  checkAnswer(e);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black.withOpacity(0.2),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Container(
                                      height: 50,
                                      width: 100,
                                      child: Center(child: Text(e)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }
  }
}
