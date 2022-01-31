import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RowWithLinks extends StatelessWidget {
  RowWithLinks({
    Key? key,
    required this.mainText,
  }) : super(key: key);

  final String mainText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainText,
                style: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            child: const Text(
              "Email",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () => _launchURL(emailLaunchUri.toString()),
          ),
          const Text(
            " | ",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          InkWell(
            child: const Text(
              "Twitter",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () => _launchURL("https://twitter.com/"),
          ),
        ],
      ),
    );
  }

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'harsha@example.com',
  );

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
