import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';

class FlutterMentionsScreen extends StatelessWidget {
  final _key = GlobalKey<FlutterMentionsState>();

  FlutterMentionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: Scaffold(
        appBar: AppBar(title: const Text('Flutter Mentions')),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ElevatedButton(
                child: const Text('Get Text'),
                onPressed: () {
                  log(_key.currentState!.controller!.markupText);
                },
              ),
              ElevatedButton(
                child: const Text('Append'),
                onPressed: () => _key.currentState!.controller!.text += "yes",
              ),
              FlutterMentions(
                key: _key,
                maxLines: 5,
                minLines: 1,
                decoration: const InputDecoration(hintText: 'hello'),
                mentions: [
                  Mention(
                    trigger: '@',
                    style: const TextStyle(color: Colors.amber),
                    data: [
                      {
                        'id': '61as61fsa',
                        'display': 'fayeedP',
                        'full_name': 'Fayeed Pawaskar',
                        'photo':
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                      },
                      {
                        'id': '61asasgasgsag6a',
                        'display': 'khaled',
                        'full_name': 'DJ Khaled',
                        'photo':
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                      },
                      {
                        'id': 'asfgasga41',
                        'display': 'markT',
                        'full_name': 'Mark Twain',
                        'photo':
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                      },
                      {
                        'id': 'asfsaf451a',
                        'display': 'JhonL',
                        'full_name': 'Jhon Legend',
                        'photo':
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                      },
                    ],
                    matchAll: false,
                    suggestionBuilder: (data) {
                      return ListTile(
                        dense: true,
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(data['photo']),
                        ),
                        title: Text(data['full_name']),
                        subtitle: Text('@${data['display']}'),
                      );
                    },
                  ),
                  Mention(
                    trigger: '#',
                    disableMarkup: true,
                    style: const TextStyle(color: Colors.blue),
                    data: [
                      {'id': 'reactjs', 'display': 'reactjs'},
                      {'id': 'javascript', 'display': 'javascript'},
                    ],
                    matchAll: true,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
