import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> buttons =[
    'C' , 'Del', '%', '/',
    '9' , '8', '7', 'x',
    '6' , '5', '4', '-',
    '3' , '2', '1', '+',
    '0' , '.', 'ANS', '=',
  ];

  bool isOperator (String x)
  {
    if (x =='%'|| x=='/' ||x=='x' ||x=='-' ||x=='+'|| x=='=')
    {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Column(
          children: [
            Expanded(child: Container()),
            Expanded(
                flex: 2,
                child: Container(

                  child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemBuilder:(BuildContext context,int index){
                      if(index==0){
                        return MyButtons(
                          buttonText: buttons[index],
                          color:Colors.green,
                          textColor:Colors.white,
                        );
                      }
                      else if(index==1){
                        return MyButtons(
                          buttonText: buttons[index],
                          color:Colors.red,
                          textColor:Colors.white,
                        );
                      }
                      else{
                        return MyButtons(
                          buttonText: buttons[index],
                          color:isOperator(buttons[index])? Colors.deepPurple:Colors.deepPurple[50],
                          textColor:isOperator(buttons[index])? Colors.white:Colors.deepPurple ,

                        );
                      }
                    },

                  ),

                )
            )
          ],
        ),
      ),


    );

  }

}
