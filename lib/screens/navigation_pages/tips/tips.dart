import 'package:flutter/material.dart';

List tips = [
  [
    'Go outside',
    'Walk and talk with someone you trust, to remind yourself that others want to help and support you. Your brain will process things better in the presence of sunlight and/or daylight.'
  ],
  [
    'Stick to a routine',
    'When life feels off track, forcing yourself to follow a schedule can help rein in feelings of hopelessness.'
  ],
  [
    'Track positive emotions',
    'Recognizing these moments, ones that you experience dozens of times a day, will shift you from a mindset of getting by to one of flourishing and reveling in life’s small pleasures.'
  ],
  [
    'Assess your mood fluctuations',
    'If you experience mood swings or an inability to regulate your emotions as well as you’d like to, you might benefit from consulting with a mental health professional.'
  ],
  [
    'Listen to Uplifting Music',
    'Music has a powerful effect on mood. Create playlists of songs that make you feel happy and energized, and listen to them when you need a mood boost.'
  ]
];

class personalTips extends StatelessWidget {
  const personalTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/PersonalTipsPageBg.jpg'),
                    fit: BoxFit.cover,
                    opacity: .8)),
          ),
          SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
                    child: const Text(
                      'PERSONAL TIPS',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff523037),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 2,
                    height: 0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: tips.length,
                      itemBuilder: (context, index){
                        return Container(
                          margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: const Color(0xffFFCFCF).withOpacity(.6),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  tips[index][0],
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                  tips[index][1],
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
          ),
        ],
      ),
    );
  }
}
