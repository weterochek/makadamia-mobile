import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp(websiteUrl: "https://mobile-site.onrender.com"));
}

class MyApp extends StatelessWidget {
  final String websiteUrl;
  final bool skipLaunch;

  const MyApp({Key? key, required this.websiteUrl, this.skipLaunch = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebsiteLauncher(websiteUrl: websiteUrl, skipLaunch: skipLaunch),
    );
  }
}

class WebsiteLauncher extends StatefulWidget {
  final String websiteUrl;
  final bool skipLaunch;

  const WebsiteLauncher({Key? key, required this.websiteUrl, this.skipLaunch = false}) : super(key: key);

  @override
  _WebsiteLauncherState createState() => _WebsiteLauncherState();
}

class _WebsiteLauncherState extends State<WebsiteLauncher> {
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    if (!widget.skipLaunch) {
      _launchWebsite();
    }
  }

  Future<void> _launchWebsite() async {
    try {
      final Uri url = Uri.parse(widget.websiteUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch ${widget.websiteUrl}';
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _errorMessage == null
            ? CircularProgressIndicator()
            : Text('Error: $_errorMessage'),
      ),
    );
  }
}
