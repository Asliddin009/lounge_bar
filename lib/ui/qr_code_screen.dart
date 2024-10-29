import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Lounge Bar',
            ),
            CupertinoButton(
              child: const Text("Забронировать столик"),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (context) => Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Контакты:',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          child: SelectableText(
                            '+7 991 819 70-71',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              const url = 'tel:+79918197071';
                              if (await canLaunchUrlString(url)) {
                                await launchUrlString(url);
                              }
                            },
                            child: const Text('Забронировать'))
                      ],
                    ),
                  ),
                );
              },
            ),
            CupertinoButton(
              child: const Text("Меню"),
              onPressed: () {},
            ),
            CupertinoButton(
              child: const Text("Наш сайт"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
