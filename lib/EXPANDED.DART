import 'package:flutter/material.dart';

class ExpandedPanel extends StatefulWidget {
  final String questionText;
  final String? answerText;
  final bool enableHeading;

  ExpandedPanel({
    required this.questionText,
    this.answerText,
    this.enableHeading = false,
  });

  @override
  State<ExpandedPanel> createState() => _ExpandedPanelState();
}

class _ExpandedPanelState extends State<ExpandedPanel> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.enableHeading
              ? const Text(
                  'Frequently asked questions',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                )
              : const SizedBox(),
          const SizedBox(
            height: 20,
          ),
          ListTileTheme(
            contentPadding: const EdgeInsets.all(0),
            child: Theme(
              data: ThemeData(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Text(
                  widget.questionText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    // fontFamily: 'Poppins',
                  ),
                ),
                trailing: Icon(
                  _isExpanded ? Icons.minimize : Icons.add,
                  color: Colors.black,
                  size: 25,
                ),
                onExpansionChanged: (isExpanded) {
                  setState(() {
                    _isExpanded = isExpanded;
                  });
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      widget.answerText.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.7,
                      ),
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