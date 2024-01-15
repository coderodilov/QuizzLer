import 'package:flutter/material.dart';
import 'package:quizzler/quizbrain.dart';

void main() {
  runApp(const QuizzLer());
}

class QuizzLer extends StatelessWidget {
  const QuizzLer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuestionBrain quizBrain = QuestionBrain();
  List<Icon> scoreKeeper = [];

  void checkUserAnswer(bool userPickedAnswer){
    bool correctAnswer = quizBrain.getCorrectAnswer();
    if(correctAnswer == userPickedAnswer){
      scoreKeeper.add(const Icon(Icons.check, color: Colors.green,));
    } else {
      scoreKeeper.add(const Icon(Icons.close, color: Colors.red,));
    }
    setState(() {
      quizBrain.nextQuestion(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('QuizzLer', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               Expanded(
                flex: 5,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(quizBrain.getQuestion(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      elevation: 5,
                    ),
                    onPressed: () => checkUserAnswer(true),
                    child: const Text('True',
                        style: TextStyle(color: Colors.white, fontSize: 16)
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      elevation: 5,
                    ),
                    onPressed: () => checkUserAnswer(false),
                    child: const Text('False',
                        style: TextStyle(color: Colors.white, fontSize: 16)
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 12),
                  child: Row(
                    children: scoreKeeper,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
