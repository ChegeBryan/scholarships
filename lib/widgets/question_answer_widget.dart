import 'package:flutter/material.dart';

class QuestionAnswerWidget extends StatefulWidget {
  final String question;
  final String answer;
  final List<String> images;

  const QuestionAnswerWidget({
    Key key,
    @required this.question,
    @required this.answer,
    this.images,
  }) : super(key: key);

  @override
  _QuestionAnswerWidgetState createState() => _QuestionAnswerWidgetState();
}

class _QuestionAnswerWidgetState extends State<QuestionAnswerWidget> {
  bool _answerVisible = false;
  IconData _questionIcon = Icons.keyboard_arrow_down;

  void _toggleAnswer() {
    setState(() {
      _answerVisible = !_answerVisible;
      _answerVisible
          ? _questionIcon = Icons.keyboard_arrow_up
          : _questionIcon = Icons.keyboard_arrow_down;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F4F4),
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => _toggleAnswer(),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFEBEAEA),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      widget.question,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(_questionIcon),
                    onPressed: () => _toggleAnswer(),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: _answerVisible,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.answer,
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 16.0,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
