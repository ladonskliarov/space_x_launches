// ignore_for_file: avoid_multiple_declarations_per_line

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

///Card widget for launch data
class LaunchCardWidget extends StatefulWidget {
  ///Constructor
  const LaunchCardWidget({
    required this.date,
    required this.time,
    required this.missionName,
    required this.launchSiteName,
    required this.wikiPage,
    super.key,
  });

  ///Class fields
  final String date, time, missionName, launchSiteName;
  ///Wikipedia page field
  final String? wikiPage;

  @override
  State<LaunchCardWidget> createState() => _LaunchCardWidgetState();
}

class _LaunchCardWidgetState extends State<LaunchCardWidget> {

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(widget.wikiPage ?? 'https://google.com'),
      builder: (context, followLink) =>
      InkWell(
        onTap: (){
          if(widget.wikiPage != null){
            followLink!();
          }
        },
        child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff1C1C1C),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.date,
                          style: const TextStyle(
                            fontSize: 16, color: Color(0xffBAFC54),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(widget.time,
                          style: const TextStyle(
                            fontSize: 16, color: Color(0xffC5C5C5),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 1),
                        Text(widget.missionName,
                          style: const TextStyle(
                            fontSize: 20, color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(widget.launchSiteName,
                          style: const TextStyle(
                            fontSize: 16, color: Color(0xffA5A5A5),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
          ),
        ),
      ),
    );
  }
}
