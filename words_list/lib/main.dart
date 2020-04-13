import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

final wordPair = new WordPair.random();

class RandomEnglishWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomEnglishWordsState();
  }
}

class RandomEnglishWordsState extends State<RandomEnglishWords> {
  final _words = <WordPair>[];
  final _checkedWords = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('List of English words'),
      ),
      body: new ListView.builder(itemBuilder: (context, index) {
        if (index >= _words.length) {
          _words.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_words[index], index);
      }),
    );
  }

  Widget _buildRow(WordPair wordPair, int index) {
    final textColor = index % 2 == 0 ? Colors.red : Colors.blue;
    final isChecked = _checkedWords.contains(wordPair);
    return new ListTile(
        leading: new Icon(
            isChecked ? Icons.check_box : Icons.check_box_outline_blank,
            color: textColor),
        title: new Text(
          wordPair.asPascalCase,
          style: new TextStyle(fontSize: 20, color: textColor),
        ),
        onTap: () {
          setState(() {
            if (isChecked) {
              _checkedWords.remove(wordPair);
            } else {
              _checkedWords.add(wordPair);
            }
          });
        });
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    return MaterialApp(
      title: 'Words List',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Demo Home Page'),
        ),
        body: new Center(child: new RandomEnglishWords()),
      ),
    );
  }
}
