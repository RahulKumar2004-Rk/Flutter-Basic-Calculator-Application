import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
     debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  //    VARIABLES
  var input='';
  var output='';
  var opration='';
 var hideinput=false;
 var outputsize=34.0;
  onbuttonClick(value){



    if(value=="C"){
      input='';
      output='';
    }
    else if(value=="<"){
      if(input.isNotEmpty){
      input=input.substring(0,input.length-1);
      output=input;
      }
      if(input.isEmpty){
        output='';
      }

    }


    else if(value=="="){
      if(input.isNotEmpty){
      var userinput = input.replaceAll("X", "*");
      Parser p = Parser();
      Expression expresion = p.parse(userinput);
      ContextModel cm=ContextModel();
      var finalValue = expresion.evaluate(EvaluationType.REAL, cm);
      output=finalValue.toString();
      if(output.endsWith(".0")){
      output=output.substring(0,output.length-2);
      }
      }
      input=output;
      hideinput=true;
      outputsize=60;


    }

    else{

      input=input+value;
      hideinput=false;
      outputsize=34.0;


      var userinput = input.replaceAll("X", "*");
      Parser p = Parser();
      Expression expresion = p.parse(userinput);
      ContextModel cm=ContextModel();
      var finalValue = expresion.evaluate(EvaluationType.REAL, cm);
      output=finalValue.toString();
      if(output.endsWith(".0")){
        output=output.substring(0,output.length-2);
      }


    }
    setState(() {

    });
  }





  Widget button(String text, {bgdcolor = Colors.white12,txtcolur=Colors.white}) {
    return
      Expanded( child: Container(
      width: double.infinity,
      margin:const EdgeInsets.all(10),
     child: ElevatedButton(
          onPressed: ()=>onbuttonClick(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgdcolor,// Set background color her
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(39)),
          // Creates a circular shape
          padding: EdgeInsets.all(15.0), // Adjust padding as needede
        ),
          child: Text(text,
        style: TextStyle(fontSize: 29,
            fontWeight: FontWeight.bold,

            color:txtcolur
        ),
      ))),
    );

  }


  Widget bigbutton(String text, {bgdcolor = Colors.white12,txtcolur=Colors.white}) {
    return
    Container(
          width: 190,
          margin:const EdgeInsets.all(10),
          child: ElevatedButton(
              onPressed: () =>onbuttonClick(text),
              style: ElevatedButton.styleFrom(
                backgroundColor: bgdcolor,// Set background color her
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(39)),
                // Creates a circular shape
                padding: EdgeInsets.all(15.0), // Adjust padding as needede
              ),
              child: Text(text,
                style: TextStyle(fontSize: 29,
                    fontWeight: FontWeight.bold,

                    color:txtcolur
                ),
              )),
      );

  }

  Widget smallbutton(String text, {bgdcolor = Colors.white12,txtcolur=Colors.white}) {
    return
      Container(
        width: 100,

        child: ElevatedButton(
            onPressed: () =>onbuttonClick(text),
            style: ElevatedButton.styleFrom(
              backgroundColor: bgdcolor,// Set background color her
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
              // Creates a circular shape
              padding: EdgeInsets.all(8.0), // Adjust padding as needede
            ),
            child: Text(text,
              style: TextStyle(fontSize: 29,
                  fontWeight: FontWeight.bold,

                  color:txtcolur
              ),
            )),
      );

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,

      body:Column(
        children: [
         Expanded(child:  Container(
           width: double.infinity,
           child: Container(
             margin: EdgeInsets.all(20),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [

                 Text(
                   hideinput ?'':input
                   ,
                   style: TextStyle(fontSize: 55,color: Colors.white),),
                 Text(output,style: TextStyle(fontSize: outputsize,color: Colors.white70))
               ],
             ),
           ),


           )),
           Container(
             height: 10,
             child: SizedBox(
               height: 10,
             ),
           ),
          Row(
            children: [
              button("",bgdcolor: Colors.black),
              smallbutton("",bgdcolor: Colors.black),
              smallbutton("",bgdcolor: Colors.black),
              smallbutton( "<" ,bgdcolor: Color.fromRGBO(118, 16, 10, 100)),
            ],
          ),
          Row(
            children: [
              button("C",bgdcolor: Color.fromRGBO(70, 8, 8, 100),txtcolur: Color.fromRGBO(79, 24, 10, 100)),
              button("("),
              button(")" ),
              button("/" ,bgdcolor: Colors.orange),
            ],
          ),

          Row(children: [
            button("7"),
            button("8"),
            button("9" ),
            button("X" ,bgdcolor: Colors.orange),
          ],),
          Row(children: [
            button("4"),
            button("5"),
            button("6" ),
            button("-" ,bgdcolor: Colors.orange),
          ],),
          Row(children: [
            button("1"),
            button("2"),
            button("3" ),
            button("+" ,bgdcolor: Colors.orange),
          ],),
          Row(children: [
            bigbutton("0"),
            button("."),
            button("=",bgdcolor: Colors.green),
          ],),
        ],
      ),
         
    );


  }



}
