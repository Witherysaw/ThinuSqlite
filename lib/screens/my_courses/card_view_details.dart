
import 'package:flutter/material.dart';
import 'package:innovationfinale/screens/quiz.dart';
import '../default_player/default_player.dart';
import '../web_video_player/web_video_player.dart';
import '../colors.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Preview'),
        backgroundColor: tuDarkBlue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the CoursesPage when the back button is pressed
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Preview
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                child: VideoPlayerScreen(),
                color: Colors.grey, // Placeholder for video preview
              ),
            ),
            // Title and Info
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Building Web Applications - Intermediate Level',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Text('Learn how to build a secure ecommerce application'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star_border),
                    ],
                  ),
                  const Row(
                    children: [
                      Text('344 ratings, 100 students'),
                    ],
                  ),
                  SizedBox(height: 16),
                  const Text(
                    'Created by TS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.purple),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: Colors.black,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('Myanmar'),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.subtitles, color: Colors.black, size: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('Myanmar'),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.warning, color: Colors.black, size: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('Last updated 3/2023'),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12, // Grey background color
                      borderRadius:
                      BorderRadius.circular(10.0), // Set the border radius
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'What You\'ll Learn',
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        // List of sentences with "right" icons
                        _buildLearnListItem('How to build a back end API'),
                        _buildLearnListItem('How to build a front end website'),
                        _buildLearnListItem('How to build microservices'),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.0),
                  // Lessons Section
                  Card(
                    elevation: 4, // Adjust the elevation as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Curriculum',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  '10 Lessons | 100m total length',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          // -------------------------------------Lesson Details
                          // ------------------------------------------
                          // -----------------------------------------
                          Container(
                            height: 250, // Adjust the height as needed
                            child: CoursePage(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

//---------------------------------- This course includes
                  // -------------------------------------

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12, // Grey background color
                      borderRadius:
                      BorderRadius.circular(16.0), // Set the border radius
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'This course includes',
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Icon(Icons.video_library_rounded,
                                color: Colors.black, size: 17),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('100 minutes on-demand video'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.quiz_outlined,
                                color: Colors.black, size: 17),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('2 Quiz'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.file_open,
                                color: Colors.black, size: 17),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('25 Support files'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.mobile_friendly,
                                color: Colors.black, size: 17),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('Access on mobile and desktop'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.price_change,
                                color: Colors.black, size: 17),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('Certificate of completion'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  //---------------------------------- Requirements
                  // -------------------------------------
                  // ------------------------------------------

                  Card(
                    elevation:
                    3, // You can adjust the elevation for the shadow effect
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          16.0), // Set the border radius for the card
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Requirements',
                            style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: [
                              Icon(Icons.arrow_right,
                                  color: Colors.black, size: 17),
                              Expanded(
                                // Wrap the text in an Expanded widget
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'A basic understanding of the programming language',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: [
                              Icon(Icons.arrow_right,
                                  color: Colors.black, size: 17),
                              Expanded(
                                // Wrap the text in an Expanded widget
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'A basic understanding of HTML, CSS and JavaScript',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: [
                              Icon(Icons.arrow_right,
                                  color: Colors.black, size: 17),
                              Expanded(
                                // Wrap the text in an Expanded widget
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                      'A basic understanding of SQL Syntax'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  //---------------------------------- Description
                  // -------------------------------------
                  // ------------------------------------------
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12, // Grey background color
                      borderRadius:
                      BorderRadius.circular(16.0), // Set the border radius
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'This course is the followup to Building Modern Web Applications in here. In this course, we go further than we did the first time around. We will build a sample E-Commerce application that consists of multiple, separate applications.',
                          style: TextStyle(fontSize: 15.0, height: 1.5),
                        ),
                        SizedBox(height: 5),

                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  //---------------------------------- Instructor
                  // -------------------------------------
                  // ------------------------------------------
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Instructor Title
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Instructor',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // Instructor Info
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'John Doe',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple),
                              ),
                              Text('Ph.D.'),
                              SizedBox(height: 8.0),
                              const Row(
                                children: [
                                  CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage: AssetImage(
                                        'images/CourseIntro.jpg'), // Replace with instructor's image
                                  ),
                                  SizedBox(width: 16.0),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Instructor Rating: 4.7'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Reviews: 863'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Students: 2,345'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Courses: 12'),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),
                              Container(
                                width: 330, // Adjust the width as needed
                                child: const Text(
                                  'I have twenty years of experience in professional software development, and twenty years of experience as a University professor. As an entrepreneur, I have worked with a broad range of clients, including Thomson.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    height:
                                    1.5, // This sets the line height (line spacing)
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),

                            ],
                          ),
                        ),

                        // View Profile Button
                        Center(
                          child: SizedBox(
                            width: 200.0, // Set the desired width
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                              ),
                              child: Text('View Profile'),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        // Student Feedback Title

                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Rating',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              _buildRatingBar('5 Stars', 5), // 95% rating
                              _buildRatingBar('4 Stars', 4), // 80% rating
                              _buildRatingBar('3 Stars', 3), // 60% rating
                              _buildRatingBar('2 Stars', 2), // 40% rating
                              _buildRatingBar('1 Star', 1), // 20% rating
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLearnListItem(String text) {
    return Row(
      children: [
        const Icon(
          Icons.check,
          color: Colors.black,
          size: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(text),
        ),
      ],
    );
  }

  Widget _buildRatingBar(String label, double rating) {
    final int filledStars = rating.floor();
    final bool hasHalfStar = (rating - filledStars) >= 0.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8.0),
        Row(
          children: [
            // Filled stars
            for (int i = 0; i < filledStars; i++)
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              ),

            // Half star if necessary
            if (hasHalfStar)
              const Icon(
                Icons.star_half,
                color: Colors.yellow,
                size: 20,
              ),

            // Empty stars to complete 5 stars
            for (int i = 0; i < (5 - filledStars - (hasHalfStar ? 1 : 0)); i++)
              const Icon(
                Icons.star_border,
                color: Colors.black,
                size: 20,
              ),

            SizedBox(width: 16.0),
            Text('$rating / 5.0'), // Display rating out of 5
          ],
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}

//-------------------------------------------------video--------------------------
//-------------------------------------------------

// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({super.key});
//
//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//
//     //---------------------------URL video link -----------------------
//     _controller = VideoPlayerController.networkUrl(
//       Uri.parse(
//         'https://firebasestorage.googleapis.com/v0/b/learningcourse-63cab.appspot.com/o/video%2Fnetworking%2FNwPart1.mp4?alt=media&token=b8f58fe4-677b-4e71-ad9c-744eed278685&_gl=1*1no0qhe*_ga*MTA5MDU5ODcwNS4xNjk3MDMxMjM3*_ga_CW55HF8NVT*MTY5NzI5MDU3OC4zLjEuMTY5NzI5MjI2OC41MC4wLjA',
//       ),
//     );
//
//     //---------------------------Local video link -----------------------
//     //_controller = VideoPlayerController.asset('videos/musicbox.mov');
//
//     _initializeVideoPlayerFuture = _controller.initialize();
//
//     _controller.setLooping(true);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: FutureBuilder(
//           future: _initializeVideoPlayerFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(_controller),
//               );
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             if (_controller.value.isPlaying) {
//               _controller.pause();
//             } else {
//               _controller.play();
//             }
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
// }
class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final List<Map<String, dynamic>> samples = [
    {'name': 'Default player', 'widget': DefaultPlayer()},
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_buildWebView(),
    );
  }

  Widget _buildWebView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: WebVideoPlayer(),
          ),
        ),
      ],
    );
  }

}

// ------------------------ Lesson details -----------
//----------------------------------------

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);
  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    int itemCount = 5; // Total number of sections, including quizzes
    List<Widget> sectionWidgets = [];

    for (int i = 1; i <= itemCount; i++) {
      sectionWidgets.add(
        ListTile(
          title: Text('Section $i'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Examples(sectionIndex: i),
              ),
            );
          },
          trailing: Icon(
            Icons.remove_red_eye,
            color: Colors.green,
            size: 20,
          ),
        ),
      );

      // Add a quiz after every 2 sections
      if (i % 2 == 0 && i < itemCount) {
        sectionWidgets.add(
            ListTile(
              title: Text('Quiz'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(),
                  ),
                );
              },
              trailing: Icon(
                Icons.school,
                color: Colors.blue,
                size: 20,
              ),
            )
        );
      }
    }

    return Scaffold(
      body: ListView(
        children: sectionWidgets,
      ),
    );
  }
}



//----------------------- default video player
//-----------------------------

class Examples extends StatefulWidget {
  const Examples({Key? key, required int sectionIndex}) : super(key: key);

  @override
  _ExamplesState createState() => _ExamplesState();
}

class _ExamplesState extends State<Examples> {
  final List<Map<String, dynamic>> samples = [
    {'name': 'Default player', 'widget': DefaultPlayer()},
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Wrap your widget tree with MaterialApp
      home: Scaffold(
        appBar: AppBar(
          title: Text('Video'),
          backgroundColor: tuDarkBlue,
        ),
        body:_buildWebView(),
      ),
    );
  }

  Widget _buildWebView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.close), // Add your close icon here
              onPressed: () {
                // Navigate back to the main page
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: WebVideoPlayer(),
          ),
        ),
      ],
    );
  }

  // Widget _buildMobileView() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: <Widget>[],
  //   );
  // }
}