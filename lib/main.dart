import 'dart:async';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String randomNumber = '00';
  int _count = 0;

  int seconds = 00;
  String digitSeconds = "00";
  Timer? timer;
  bool started = false;
  List laps = [];


  void _incrementCount(){
    setState(() {
      if(randomNumber==digitSeconds){
        _count++;
      }
    });
  }





  void stop(){
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void reset(){
    timer!.cancel();
    setState(() {
      seconds = 00;
      digitSeconds = "00";
      started = false;
    });
  }

  void addlaps(){
    String lap = "$digitSeconds";
    setState(() {
      laps.add(lap);
    });
  }

  void start(){
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localseconds = seconds + 1;

      if(localseconds > 60){
        localseconds--;
      }
      setState(() {
        seconds = localseconds;
        digitSeconds = (seconds >= 10) ? "$seconds":"0$seconds";
      });
    });
  }




  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Color(0xFF1C2757),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text( 'Success Quiz', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 34.0)),
        centerTitle: true,
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.notifications, color: Colors.white,))],
        leading: IconButton(onPressed: (){}, icon: IconButton(icon: const Icon(Icons.menu, color: Colors.white), onPressed: (){},),),
      ),

      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: NetworkImage("data:image/jpeg;base64,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"),
                fit: BoxFit.cover)
        ),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 430,
                      color: Colors.black12,
                    ),

                    Positioned(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 220, top: 145),
                            child: Text('$randomNumber',
                                style: TextStyle(color: Colors.white, fontSize: 89.0, fontWeight: FontWeight.bold,)
                            ),
                          ),
                          Container(padding: EdgeInsets.only(left:645, top: 145),
                            child: Text('$digitSeconds',
                                style: TextStyle(color: Colors.white, fontSize: 89.0, fontWeight: FontWeight.bold,)),
                          ),


                        ],
                      ),

                    ),
                  ]

              ),

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: RawMaterialButton(
                          onPressed: (){
                            setState(() {
                              randomNumber = (Random().nextInt(60) + 00).toString();
                              if(randomNumber == digitSeconds){
                                _incrementCount();
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    actions: [
                                      TextButton(
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Close'),
                                      ),

                                    ],
                                    title: const Text('Notification'),
                                    contentPadding: const EdgeInsets.all(25.0),
                                    content: Text('Success and Total Number of Success : $_count'),
                                  ),
                                );
                              }
                              else{
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    actions: [
                                      TextButton(
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                    title: const Text('Notification'),
                                    contentPadding: const EdgeInsets.all(25.0),
                                    content: const Text('Try Again'),
                                  ),
                                );
                              };

                            });

                          },
                          fillColor: Color(0xFF1C2757),
                          shape: const StadiumBorder(
                            side: BorderSide(color: Colors.white),
                          ),
                          child: Text('Randomize', style: TextStyle(color: Colors.white),),

                        ),
                      ),

                      Expanded(child: RawMaterialButton(
                        onPressed: (){
                          (!started)? start() : stop();
                        },
                        fillColor: Color(0xFF1C2757),
                        shape: const StadiumBorder(
                          side: BorderSide(color: Colors.white),
                        ),
                        child: Text((!started)? "Start": "Pause", style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ),
                      Expanded(child: RawMaterialButton(
                        onPressed: (){
                          reset();
                        },
                        fillColor: Color(0xFF1C2757),
                        shape: const StadiumBorder(
                          side: BorderSide(color: Colors.white),
                        ),
                        child: Text("Reset", style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ),
                    ]
                ),
              ),
            ],

          ),



        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}