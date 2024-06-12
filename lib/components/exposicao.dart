import 'package:flutter/material.dart';

class Exposicao extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;

  const Exposicao({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  ExposicaoState createState() => ExposicaoState();
}

class ExposicaoState extends State<Exposicao> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(widget.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.description,
              maxLines: isExpanded ? null : 3,
              overflow:
                  isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(isExpanded ? 'Menos' : 'Ler mais'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
