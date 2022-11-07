import 'package:flutter/material.dart';

class InstagramProfileSliverHeader extends StatelessWidget {
  const InstagramProfileSliverHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                flex: 1,
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 40,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Flexible(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    DataColumn(stat: 20, text: 'Publicaciones'),
                    DataColumn(stat: 297, text: 'Seguidores'),
                    DataColumn(stat: 371, text: 'Siguiendo'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Nicos Fabro',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            '💻🚀🎸⚽️',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Editar perfil'),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Icon(Icons.person_add_alt),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: HighlitedStories(),
          ),
        ],
      ),
    );
  }
}

class HighlitedStories extends StatelessWidget {
  const HighlitedStories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Story(text: '🇬🇧', color: Colors.deepPurple),
        Story(text: '🇦🇹', color: Colors.pink),
        Story(text: '🎸', color: Colors.cyan),
        Story(text: 'Nuevo', color: Colors.transparent),
      ],
    );
  }
}

class Story extends StatelessWidget {
  const Story({required this.text, required this.color, Key? key})
      : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.19,
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor:
                color == Colors.transparent ? Colors.white : Colors.transparent,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 30,
              child: color == Colors.transparent ? const Icon(Icons.add) : null,
            ),
          ),
          const SizedBox(height: 10),
          Text(text),
        ],
      ),
    );
  }
}

class DataColumn extends StatelessWidget {
  const DataColumn({
    required this.stat,
    required this.text,
    Key? key,
  }) : super(key: key);

  final int stat;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.19,
      child: Column(
        children: [
          Text(
            '$stat',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(text, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
