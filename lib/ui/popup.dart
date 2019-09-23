import 'package:flutter/material.dart';

import '../core/utility.dart';

class Popup {


  static Future<void> showImageDialog(BuildContext context,
      {String title,
        Widget image,
        ButtonData btnHighlight,
        ButtonData btnNormal,
        bool barrierDismissible = true}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        List<Widget> _actions = new List();
        if (btnNormal != null) {
          _actions.add(btnNormal.buildNormal(context));
        }
        if (btnHighlight != null) {
          _actions.add(btnHighlight.buildHighlight(context));
        }

        return AlertDialog(
          title: Container(width: 64, height: 64, child: image),
          content: Text(
            title ?? '',
            style: Theme.of(context).textTheme.body2,
            textAlign: TextAlign.center,
          ),
          actions: _actions,
        );
      },
    );
  }

  static Future<void> showCustomDialog(BuildContext context,
      {String title,
        String message,
        ButtonData btnHighlight,
        ButtonData btnNormal,
        bool barrierDismissible = true}) async {
    List<Widget> _actions = new List();
    if (btnNormal != null) {
      _actions.add(btnNormal.buildNormal(context));
    }
    if (btnHighlight != null) {
      _actions.add(btnHighlight.buildHighlight(context));
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: Theme.of(context).textTheme.body2,
            textAlign: TextAlign.center,
          ),
          content: Text(
            message,
            style: Theme.of(context).textTheme.body1,
            textAlign: TextAlign.center,
          ),
          actions: _actions,
        );
      },
    );
  }

  static Future<void> showComplexDialog(BuildContext context,
      {String title,
        String body,
        Widget image,
        ButtonData btnHighlight,
        ButtonData btnNormal,
        bool closeButton = true,
        bool barrierDismissible = true}) async {

    return showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /// BorderTop
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                width: double.infinity,
                height: 20,
              ),

              /// Image
              image != null
                  ? Container(
                height: 100,
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    image,
                    closeButton? Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.black45,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ):Container(),
                  ],
                ),
              )
                  : Container(),
              Utility.stringIsNullOrEmpty(title)
                  ? Container()
                  : Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.body2,
                  textAlign: TextAlign.center,
                ),
              ),
              Utility.stringIsNullOrEmpty(body)
                  ? Container()
                  : Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Text(
                  body,
                  style: Theme.of(context).textTheme.body1,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                padding: EdgeInsets.only(top: 10, right: 10, bottom: 5),
                child: Row(
                  mainAxisAlignment: btnNormal == null
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.end,
                  children: <Widget>[
                    btnNormal != null
                        ? Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 40,
                      child: btnNormal.buildNormal(context),
                    )
                        : Container(),
                    btnHighlight != null
                        ? Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 40,
                      child: btnHighlight.buildHighlight(context),
                    )
                        : Container(),
                  ],
                ),
              ),

              /// Bottom
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                width: double.infinity,
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonData {
  ButtonData({this.title, this.callback});

  String title;
  VoidCallback callback;

  Widget buildNormal(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.body2,
      ),
      onPressed: () {
        Navigator.pop(context);
        if (callback != null) callback();
      },
    );
  }

  Widget buildHighlight(BuildContext context) {
    return RaisedButton(
      color: Colors.green,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.body2,
      ),
      onPressed: () {
        Navigator.pop(context);
        if (callback != null) callback();
      },
    );
  }
}