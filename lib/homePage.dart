import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TRIVIA APP',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.450,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.yellow),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizPage(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      'TAKE TRIVIA',
                      style: TextStyle(
                          fontSize: 18,
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
