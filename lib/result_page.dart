import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_page.dart';

class ResultPage extends StatefulWidget {
  int score;
  ResultPage({Key key, this.score}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score Is',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '${widget.score}/100',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.480,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xffF4D925)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizPage(),
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Text(
                      'RETAKE TRIVIA',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigoAccent),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
