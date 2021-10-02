import 'package:flutter/material.dart';
import 'package:flutter_scoped_model_1/models/user.dart';
import 'package:scoped_model/scoped_model.dart';

class ChangeNamePage extends StatelessWidget {
  ChangeNamePage({Key key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change name page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ScopedModelDescendant<User>(
          builder: (context, widget, model) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _nameController,
                ),
                RaisedButton(
                  child: Text('Change name'),
                  onPressed: () {
                    model.changeName(_nameController.text);
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
