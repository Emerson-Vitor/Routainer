import 'package:autoscript/pages/home_page.dart';
import 'package:autoscript/widgets/cardScript.dart';
import 'package:flutter/material.dart';

class ScrollBarWidgetState extends StatefulWidget {
  @override
  _ScrollBarWidgetStateState createState() => _ScrollBarWidgetStateState();
}

class _ScrollBarWidgetStateState extends State<ScrollBarWidgetState> {
  final ScrollController _scrollController = ScrollController();
  bool _isDragging = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final viewportHeight = _scrollController.position.viewportDimension;
      final thumbHeight = _calculateThumbHeight(viewportHeight, maxScroll);

      setState(() {
        _scrollController.jumpTo(
          _scrollController.offset +
              details.primaryDelta! *
                  maxScroll /
                  (viewportHeight - thumbHeight),
        );
      });
    }
  }

  double _calculateThumbHeight(double viewportHeight, double maxScroll) {
    final minThumbHeight = 48.0;
    final thumbHeight =
        viewportHeight * viewportHeight / (viewportHeight + maxScroll);
    return thumbHeight < minThumbHeight ? minThumbHeight : thumbHeight;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        setState(() {});
        return false;
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height, // Definindo altura
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: 1, // Altere este valor para testar com mais itens
                itemBuilder: (BuildContext context, int index) {
                  return CardScript_widget(script: scriptteste);
                },
              ),
            ),
            Container(
              width: 30, 
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onVerticalDragUpdate: _onVerticalDragUpdate,
                      onVerticalDragStart: (_) =>
                          setState(() => _isDragging = true),
                      onVerticalDragEnd: (_) =>
                          setState(() => _isDragging = false),
                      child: Material(
                        elevation: 20,
                        child: Container(
                          width: 20,
                          // Background color of the scrollbar
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff193549),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: AnimatedContainer(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: _isDragging
                                  ? Color(0xffEECD59).withOpacity(0.8)
                                  : Color(0xffEECD59),
                            ),
                            duration: Duration(milliseconds: 100),
                            margin: EdgeInsets.only(
                              top: (_scrollController.hasClients &&
                                      _scrollController.offset > 0)
                                  ? (_scrollController.offset *
                                      (_scrollController.position
                                              .viewportDimension -
                                          _calculateThumbHeight(
                                              _scrollController.position
                                                  .viewportDimension,
                                              _scrollController
                                                  .position.maxScrollExtent)) /
                                      _scrollController.position.maxScrollExtent)
                                  : 0,
                            ),
                            height: _scrollController.hasClients
                                ? _calculateThumbHeight(
                                    _scrollController
                                        .position.viewportDimension,
                                    _scrollController.position.maxScrollExtent,
                                  )
                                : 48.0, // Default thumb height
                            width: 20,
                            // Thumb color of the scrollbar
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
