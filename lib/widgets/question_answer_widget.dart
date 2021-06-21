import 'package:flutter/material.dart';
import 'package:geopro/widgets/screenshots_viewer_wrapper.dart';
import 'package:transparent_image/transparent_image.dart';

class QuestionAnswerWidget extends StatefulWidget {
  final String question;
  final String answer;
  final List<String> screenshots;

  const QuestionAnswerWidget({
    Key key,
    @required this.question,
    @required this.answer,
    this.screenshots,
  }) : super(key: key);

  @override
  _QuestionAnswerWidgetState createState() => _QuestionAnswerWidgetState();
}

class _QuestionAnswerWidgetState extends State<QuestionAnswerWidget> {
  bool _answerVisible = false;
  IconData _questionIcon = Icons.keyboard_arrow_down;
  bool verticalGallery = false;

  void _toggleAnswer() {
    setState(() {
      _answerVisible = !_answerVisible;
      _answerVisible
          ? _questionIcon = Icons.keyboard_arrow_up
          : _questionIcon = Icons.keyboard_arrow_down;
    });
  }

  void open(BuildContext context, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScreenshotsViewerWrapper(
          screenshots: widget.screenshots,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: index,
          scrollDirection: verticalGallery ? Axis.vertical : Axis.horizontal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.screenshots);

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
                  Expanded(
                    child: Padding(
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
              child: Column(
                children: <Widget>[
                  Text(
                    widget.answer,
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 16.0,
                      height: 1.5,
                    ),
                  ),
                  Container(
                    height: 120.0,
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: GestureDetector(
                            onTap: () {
                              open(context, index);
                            },
                            child: Stack(
                              children: <Widget>[
                                Center(child: CircularProgressIndicator()),
                                Center(
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image: widget.screenshots[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      itemCount: widget.screenshots.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
