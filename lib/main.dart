import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BackPage(),
    );
  }
}

class BackPage extends StatefulWidget {
  BackPage({Key key}) : super(key: key);

  @override
  _BackPageState createState() => _BackPageState();
}

class _BackPageState extends State<BackPage> {

  var working = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          child: (working) ? CircularProgressIndicator() 
            : RaisedButton(
              onPressed: doWork,
              child: Text("Trabajo Pesado"),
            ),
        ),
      ),
    );
  }


  doWork() async{
    setState(() {
      working = true;
    });

    int n = await compute(heavyWork,1000000000, debugLabel: "PRUEBA");

    setState(() {
      working = false;
    });

    print(n);
  }

  static Future<int> heavyWork(int value) async{
    int n = 1;
    debugPrint("Start");
    for (var i = 0; i < value; i++) {
      n = n +1;
    }
    debugPrint("Finished");
    return n;
  }

}

