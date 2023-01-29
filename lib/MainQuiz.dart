import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz/Question.dart';
import 'Result.dart';
class MainQuiz extends StatefulWidget {
  const MainQuiz({Key key}) : super(key: key);
  @override
  State<MainQuiz> createState() => _MainQuizState();
}

class _MainQuizState extends State<MainQuiz> {

  List<Question> question = [
   Question(ques: "Afg is in the heart of Asia", ans: true,),
    Question(ques: "Pakistan is a in the soud of Afrca ?", ans: false),
    Question(ques: "Flutter uses Java lang?", ans: false),
    Question(ques: "Computer is a human?", ans: true),
    Question(ques: "Animals drink Alchol", ans: false),
  ];


  List<Icon> judge = [];


  Random random =  Random();


  int turn = 0;
  int correct =0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    turn = random.nextInt(4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Padding(padding: EdgeInsets.all(15),
            child: Center(
              child:  Text(question[turn].q,

              style: TextStyle(fontSize: 24),
              ),
            )   ),
          ),
         Expanded(
           flex: 1,
           child: InkWell(
             onTap: (){
               if(question[turn].answer==true){
                 judge.add(  Icon(Icons.check, color: Colors.green),);

               if( turn < question.length-1){
                 setState(() {
                   question[turn].used = true;
                   turn ++;
                   correct++;
                 });
                 checkRand(turn);
               }else{
                Navigator.push(context, MaterialPageRoute(builder: (context) => Result(correct: correct,incorrect: (question.length-correct)),));
                 setState(() {
                   turn = 0;
                   judge.removeRange(0, 5);
                 });
               }

               }else{
                 judge.add( Icon(Icons.close,color: Colors.red,));
                 if( turn < question.length-1){
                   setState(() {
                     turn ++;
                     question[turn].used = true;

                   });
                   checkRand(turn);
                 }else{
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Result(correct: correct,incorrect: (question.length-correct)),));

                   setState(() {
                     turn = 0;
                     judge.removeRange(0, 5);
                   });
                 }
               }
             },
             child:  const Padding(
               padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
               child: SizedBox(
                 width: double.infinity,
                 child: Card(
                     color: Colors.green,
                     child: Center(
                       child:  Text('True',style: TextStyle(fontSize: 22)),
                     )
                 ),
               ),
             ),
           ),

         ),
          Expanded(
              flex: 1,
              child: InkWell(
                child:  const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                        color: Colors.red,
                        child: Center(
                          child:  Text('False',style: TextStyle(fontSize: 22)),
                        ),
                    ),
                  ),
                ),
                onTap: (){
                  if(question[turn].answer ==true){
                    judge.add( Icon(Icons.close,color: Colors.red,)  );
                    if( turn < question.length-1){
                      setState(() {
                        turn ++;
                        question[turn].used = true;
                      });
                      checkRand(turn);
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Result(correct: correct,incorrect: (question.length-correct)),));
                      setState(() {
                        turn = 0;
                        judge.removeRange(0, 5);
                      });
                    }
                  }else{
                    judge.add(Icon(Icons.check, color: Colors.green),);
                    if( turn < question.length-1){
                      setState(() {
                        turn ++;
                        correct++;
                        question[turn].used = true;
                      });
                      checkRand(turn);
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Result(correct: correct,incorrect: (question.length-correct)),));
                      setState(() {
                        turn = 0;
                        judge.removeRange(0, 5);
                      });
                    }
                  }
                },
              ),

            ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: judge
            ),
          ),
        ],
      ),
    );
  }

  checkRand(int ind){
    Random r  = Random();
    int temp = r.nextInt(4);
    if(temp ==ind){
      turn = r.nextInt(4);
    }
  }

}
