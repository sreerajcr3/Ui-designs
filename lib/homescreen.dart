import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends StatefulWidget {
   final String questionText;
  final String? answerText;
  final bool enableHeading;

  const HomeScreen({super.key, required this.questionText, this.answerText, this.enableHeading=false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  YoutubePlayerController _controller=YoutubePlayerController(
    initialVideoId:'qA13mPWmSOk');
   bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    child: AppBar(
                      leading: Icon(Icons.arrow_back),
                      centerTitle: true,
                      title: Text('Dukaan Premium'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 100,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: _stackcontainer(),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, top: 20),
                    child: Text(
                      'Features',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.verified_outlined),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Custom domin name',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Get your own custom domain and build your brand on the internet',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.verified_outlined),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Verified seller badge',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Get green verified badge under your srore name and build trust',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.computer_outlined),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dukaan for PC',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Access all the exclusive premium features on Dukaan for PC',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.headset_mic_outlined),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Priority support',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Get your questions resolved with our priority customer support',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 7,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'What is Dukaan Premium?',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  ClipRRect(child: YoutubePlayer(controller: _controller)),
                  Column(
                    children: [
                      // ExpandedPanel(),
                      widget.enableHeading
                ? const Text(
                    'Frequently asked questions',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
            ListTileTheme(
              contentPadding: const EdgeInsets.all(0),
              child: Theme(
                data: ThemeData(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    widget.questionText,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      // fontFamily: 'Poppins',
                    ),
                  ),
                  trailing: Icon(
                    _isExpanded ? Icons.minimize : Icons.add,
                    color: Colors.black,
                    size: 25,
                  ),
                  onExpansionChanged: (isExpanded) {
                    setState(() {
                      _isExpanded = isExpanded;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        widget.answerText.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
                    ],
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

_stackcontainer() {
  return Container(
    decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
    height: 200,
    child: const Center(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: Icon(
                    Icons.backpack_rounded,
                    size: 40,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'dukaan',
                      style: TextStyle(fontSize: 32,fontWeight: FontWeight.w500),
                    ),
                    Text( 'PREMIUM',style: TextStyle(color: Color.fromARGB(255, 4, 133, 239)))
                  ],
                )
              ],
            ),
            Column(
             // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Get Dukaan Premium for',style: TextStyle(fontSize: 18)),
                 Text('₹4,999/year',style: TextStyle(fontSize: 18)),
                Text('All the advanced features for scalling your',style: TextStyle(color: Color.fromARGB(255, 129, 144, 157))),
                Text('bussiness',style: TextStyle(color: Color.fromARGB(255, 115, 139, 160)))
              ],
            ),
          ],
          
        ),
      ),
    ),
  );
}
