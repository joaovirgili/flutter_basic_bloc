import 'package:bloc/home-bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final HomeController homeBloc =
        BlocProvider.of<HomeController>(this.context);
    print("Criou o widget.");
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              StreamBuilder(
                stream: homeBloc.outCounter,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text('${snapshot.data}');
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: homeBloc.increment,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }
}
