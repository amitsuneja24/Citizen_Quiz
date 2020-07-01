import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:citizen_quiz/model/questions.dart';


class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List questions = [
    Questions.name(
        "The Republic of India is the largest country in South Asia.", true),
    Questions.name(
        'India is the second most populous democracy in the world.', false),
    Questions.name('Mumbai is the capital city of India.', false),
    Questions.name('India is surrounded by Indian Ocean in the south.', true),
    Questions.name(
        'India shares borders with 6 countries including Indonesia.', false)
  ];

  var _color1 = Colors.green.shade100;
  var _color2 = Colors.green.shade100;
  int i = 0;

  _checkAnswer(bool isCorrect, BuildContext context) {
    if (isCorrect != questions[i].isCorrect) {
      setState(() {
        if (isCorrect) {
          _color1 = Colors.red.shade500;
          _color2 = Colors.green.shade100;
        } else {
          _color2 = Colors.red.shade500;
          _color1 = Colors.green.shade100;
        }
      });
      var snackBar1 = SnackBar(
        content: Text(
          'Incorrect',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17),
        ),
        backgroundColor: Colors.red.shade500,
        duration: Duration(seconds: 1),
      );
      Scaffold.of(context).showSnackBar(snackBar1);
    } else {
      setState(() {
        if (isCorrect) {
          _color1 = Colors.green.shade500;
          _color2 = Colors.green.shade100;
        } else {
          _color2 = Colors.green.shade500;
          _color1 = Colors.green.shade100;
        }
      });
      var snackBar2 = SnackBar(
        content: Text(
          'Correct',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17),
        ),
        backgroundColor: Colors.green.shade500,
        duration: Duration(seconds: 1),
      );
      Scaffold.of(context).showSnackBar(snackBar2);
    }
  }

  _forward() {
    if (i < 4)
      setState(() {
        ++i;
        _color1 = _color2 = Colors.green.shade100;
      });
    else
      setState(() {
        i = 0;
        _color1 = _color2 = Colors.green.shade100;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        //backgroundColor: Colors.green,
        title: Text('True Citizen Quiz'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            children: <Widget>[
              Center(
                  child: Image.asset(
                    'assets/images/flag.jpg',
                    width: 250,
                    height: 200,
                  )),
              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                width: 350,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Colors.grey,
                        width: 0.6,
                        style: BorderStyle.solid)),
                child: Text(
                  questions[i].question,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'True',
                        style: TextStyle(
                            color: Colors.blueGrey.shade700, fontSize: 20),
                      ),
                      margin: EdgeInsets.only(top: 20),
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: _color1,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Colors.green.shade700,
                            width: 0.6,
                            style: BorderStyle.solid),
                      ),
                    ),
                    onTap: () => _checkAnswer(true, context),
                  ),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'False',
                        style: TextStyle(
                            color: Colors.blueGrey.shade700, fontSize: 20),
                      ),
                      margin: EdgeInsets.only(top: 20, left: 30),
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: _color2,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Colors.green.shade700,
                            width: 0.6,
                            style: BorderStyle.solid),
                      ),
                    ),
                    onTap: () => _checkAnswer(false, context),
                  ),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.forward,
                        color: Colors.blueGrey.shade700,
                      ),
                      margin: EdgeInsets.only(top: 20, left: 30),
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Colors.green.shade700,
                            width: 0.6,
                            style: BorderStyle.solid),
                      ),
                    ),
                    onTap: () => _forward(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
