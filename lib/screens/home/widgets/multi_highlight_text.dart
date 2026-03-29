import 'package:flutter/material.dart';
import 'package:portfolio/styles/app_colors.dart';

class MultiHighlightText extends StatelessWidget {
  final String text;
  final Map<String, TextStyle> highlights;
  final TextStyle defaultStyle;

  const MultiHighlightText({
    super.key,
    required this.text,
    required this.highlights,
    required this.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans = [];
    int start = 0;

    while (start < text.length) {
      int matchIndex = text.length;
      String? matchedWord;

      for (var word in highlights.keys) {
        int index = text.indexOf(word, start);
        if (index >= 0 && index < matchIndex) {
          matchIndex = index;
          matchedWord = word;
        }
      }

      if (matchedWord != null && matchIndex > start) {
        spans.add(
          TextSpan(
            text: text.substring(start, matchIndex),
            style: defaultStyle,
          ),
        );
      }

      if (matchedWord != null) {
        spans.add(TextSpan(text: matchedWord, style: highlights[matchedWord]));
        start = matchIndex + matchedWord.length;
      } else {
        spans.add(TextSpan(text: text.substring(start), style: defaultStyle));
        break;
      }
    }

    return SelectableText.rich(
      TextSpan(children: spans),
      selectionColor: AppColors.cardBackgroundDimmed,
      contextMenuBuilder: (context, editableTextState) {
        return AdaptiveTextSelectionToolbar.editableText(
          editableTextState: editableTextState,
        );
      },
    );
  }
}
