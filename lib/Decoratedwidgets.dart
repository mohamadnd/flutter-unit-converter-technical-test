import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Textbox extends StatefulWidget {
  String hint;
  TextEditingController contorller;
  Function onChanged;
  Textbox(this.hint, {Key key, this.contorller, this.onChanged})
      : super(key: key);

  @override
  _TextboxState createState() => _TextboxState();
}

class _TextboxState extends State<Textbox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.]'))],
      controller: widget.contorller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.purple)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.orange[800])),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.orange[800])),
          labelText: widget.hint,
          labelStyle: TextStyle(color: Colors.grey)),
      style: TextStyle(fontSize: 18),
    );
  }
}

class ButtonCnv extends StatefulWidget {
  String text;
  Function ontap;
  Color color;
  int index;
  ButtonCnv(this.text, this.color, this.index, {Key key, this.ontap})
      : super(key: key);

  @override
  _ButtonCnvState createState() => _ButtonCnvState();
}

class _ButtonCnvState extends State<ButtonCnv> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  widget.ontap ,
      child: Container(
        alignment: Alignment.center,
        //margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Text(
          widget.text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),

        height: 50,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class Result extends StatefulWidget {
  double initialvalue;
  String selectedstart;
  String selectedend;
  double result;
  Function calculate;
  Result(this.initialvalue, this.selectedstart, this.result, this.selectedend,
      {Key key, this.calculate})
      : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.purple, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.initialvalue.toString(),
            style: TextStyle(color: Colors.purple, fontSize: 18),
          ),
          Text(
            widget.selectedstart.toString(),
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "equals",
            style: TextStyle(
                color: Colors.purple,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(
            widget.result.toStringAsFixed(4),
            style: TextStyle(color: Colors.purple, fontSize: 18),
          ),
          Text(
            widget.selectedend.toString(),
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
