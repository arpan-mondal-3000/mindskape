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
  ],
  [
    'Practice Self-Compassion',
    'Be kind to yourself, especially during difficult times. Treat yourself with the same kindness and understanding that you would offer to a friend.'
  ],
  [
    'Connect with Others',
    'Cultivate supportive relationships with friends, family, or community groups. Social connections provide emotional support and a sense of belonging.'
  ],
  [
    'Set Boundaries',
    'Learn to say no to activities or commitments that drain your energy or cause stress. Setting boundaries helps preserve your mental and emotional well-being.'
  ],
  [
    'Practice Mindfulness',
    'Incorporate mindfulness techniques such as meditation, deep breathing, or yoga into your daily routine to reduce stress and increase self-awareness.'
  ],
  [
    'Seek Professional Help',
    'Don\'t hesitate to reach out to a therapist or counselor if you\'re struggling with your mental health. Therapy can provide valuable support and coping strategies.'
  ],
  [
    'Engage in Hobbies',
    'Dedicate time to activities that bring you joy and fulfillment, whether it\'s painting, playing music, gardening, or any other hobby that helps you relax and unwind.'
  ],
  [
    'Limit Screen Time',
    'Reduce exposure to digital devices and social media, as excessive screen time can contribute to feelings of anxiety and overwhelm.'
  ],
  [
    'Practice Gratitude',
    'Take time each day to reflect on the things you\'re grateful for. Cultivating a gratitude mindset can foster positivity and resilience.'
  ],
  [
    'Stay Present',
    'Focus on the present moment rather than dwelling on the past or worrying about the future. Mindful awareness of the present can reduce stress and enhance overall well-being.'
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
