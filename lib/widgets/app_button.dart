import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  Function onPressed_f;
  bool showProgress;

  AppButton(this.text, {this.onPressed_f, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        onPressed: onPressed_f,
        color: Colors.deepPurpleAccent,
        child: showProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.black,
                  ),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
      ),
    );
  }
}
