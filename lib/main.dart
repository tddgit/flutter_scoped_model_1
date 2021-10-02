import 'package:flutter/material.dart';
import 'package:flutter_scoped_model_1/change_name_page.dart';
import 'package:flutter_scoped_model_1/models/user.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(
    MyApp(
      user: User(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
    this.user,
  }) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: user,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: ScopedModelDescendant<User>(builder: (context, child, model) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  model.name,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            );
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<Widget>(
              builder: (context) => ChangeNamePage(),
            ),
          ),
          child: Icon(Icons.add),
        ));
  }
}
