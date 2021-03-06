import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// void main() {
// WidgetsFlutterBinding.ensureInitialized();
//   runApp(HomePage());
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Words List',
      home: RandomEnglishWords(),
    );
  }
}

class RandomEnglishWords extends StatefulWidget {
  final wordPair = new WordPair.random();
  @override
  State<StatefulWidget> createState() {
    return new RandomEnglishWordsState();
  }
}

class RandomEnglishWordsState extends State<RandomEnglishWords> {
  final List<WordPair> _words = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final _biggerFont = new TextStyle(fontSize: 20, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('List of English words'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://franchiseindia.s3.ap-south-1.amazonaws.com/uploads/content/edu/art/english1-083866aacd.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList(
              delegate: SliverChildListDelegate([
                ListView.builder(itemBuilder: (context, index) {
                  if (index >= _words.length) {
                    _words.addAll(generateWordPairs().take(10));
                  }
                  return _buildRow(_words[index], index);
                }),
              ]),
              itemExtent: 500.0)
        ],
      ),
    );
  }

  Widget fourButtonSection = Container();

  Widget _buildRow(WordPair wordPair, int index) {
    final bool isSaved = _saved.contains(wordPair);
    return new ListTile(
        title: new Text(
          wordPair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: Icon(
          isSaved ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onTap: () {
          setState(() {
            if (isSaved) {
              _saved.remove(wordPair);
            } else {
              _saved.add(wordPair);
            }
          });
        });
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
      final List<Widget> divided =
          ListTile.divideTiles(tiles: tiles, context: context).toList();
      return Scaffold(
          appBar: AppBar(
            title: const Text("Saved list"),
          ),
          body: new ListView(
            children: divided,
          ));
    }));
  }
}
