import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:innovationfinale/screens/web_video_player/web_video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:video_player/video_player.dart';

import 'article_view.dart';
import 'colors.dart';


class WatchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: null, // Set the AppBar to null
        body: Column(
          children: [
            Container(
              color: tuLightBlue, // Set the background color
              child: TabBar(
                tabs: [
                  Tab(
                    text: 'Course',
                  ),
                  Tab(
                    text: 'Article',
                  ),
                ],
                labelColor: Colors.white, // Text color of the selected tab
                unselectedLabelColor: Colors.black, // Text color of unselected tabs
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Course tab content
                  MyCoursesPage(),
                  // Article tab content (blank for now)
                  SavedArticlesPage1(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class MyCoursesPage extends StatelessWidget {
  final List<Course> courses = [
    Course(
      'Introduction to Python',
      'Learn the basics of Python programming',
      'Udemy',
      6,
      'images/CourseIntro2.jpg',
    ),
    Course(
      'WordPress For Beginners',
      'Fast And Best Methods',
      'Jenius Ltd',
      1,
      'images/CourseIntro.jpg',
    ),
    Course(
      'Learn Bootstrap',
      'For Beginners',
      'C YouAccel Training',
      16,
      'images/CourseIntro5.jpg',
    ),
    Course(
      'Learn Python',
      'For Beginners',
      'Myan Myanmar',
      16,
      'images/CourseIntro3.jpg',
    ),
    Course(
      'Learn Java',
      'For Beginners',
      'Micro',
      16,
      'images/CourseIntro7.jpg',
    ),
    Course(
      'Learn React',
      'For Beginners',
      'MM Code',
      16,
      'images/CourseIntro10.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(5.0),
            child: ListTile(
              leading: Image.asset(courses[index].imagepath),
              title: Text(courses[index].title),
              subtitle: Text(courses[index].description),
              trailing: Text('${courses[index].progress}%'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CourseDetailsPage(course: courses[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Course {
  final String title;
  final String description;
  final String author;
  final int progress;
  final String imagepath;

  Course(
      this.title, this.description, this.author, this.progress, this.imagepath);
}

class CourseDetailsPage extends StatefulWidget {
  final Course course;

  const CourseDetailsPage({Key? key, required this.course}) : super(key: key);

  @override
  _CourseDetailsPageState createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 800,
                child: VideoPlaylistPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlaylistPage extends StatefulWidget {
  @override
  _VideoPlaylistPageState createState() => _VideoPlaylistPageState();
}

class _VideoPlaylistPageState extends State<VideoPlaylistPage> {
  List<String> lessonUrls = [
    'https://firebasestorage.googleapis.com/v0/b/sayrhein-f421e.appspot.com/o/nkpreviewshort.mp4?alt=media&token=c94e9fa2-95ea-470b-b103-5000ca047993&_gl=1*1y5lx6o*_ga*MTg3OTc5MDIwMC4xNjk1ODIxNDEx*_ga_CW55HF8NVT*MTY5Nzk5MTI4MC40LjEuMTY5Nzk5MTM4Mi4zNi4wLjA.',
    'https://firebasestorage.googleapis.com/v0/b/learningcourse-63cab.appspot.com/o/video%2Fnetworking%2FNwPart2.mp4?alt=media&token=33cea209-1d6a-4144-8b24-59fa927ab6a4&_gl=1*1jhyw9q*_ga*MTA5MDU5ODcwNS4xNjk3MDMxMjM3*_ga_CW55HF8NVT*MTY5NzI5MDU3OC4zLjEuMTY5NzI5MjQyNy41OS4wLjA',
    'https://firebasestorage.googleapis.com/v0/b/sayrhein-f421e.appspot.com/o/nkpreviewshort.mp4?alt=media&token=c94e9fa2-95ea-470b-b103-5000ca047993&_gl=1*1y5lx6o*_ga*MTg3OTc5MDIwMC4xNjk1ODIxNDEx*_ga_CW55HF8NVT*MTY5Nzk5MTI4MC40LjEuMTY5Nzk5MTM4Mi4zNi4wLjA.',
    'https://firebasestorage.googleapis.com/v0/b/sayrhein-f421e.appspot.com/o/nkpreviewshort.mp4?alt=media&token=c94e9fa2-95ea-470b-b103-5000ca047993&_gl=1*1y5lx6o*_ga*MTg3OTc5MDIwMC4xNjk1ODIxNDEx*_ga_CW55HF8NVT*MTY5Nzk5MTI4MC40LjEuMTY5Nzk5MTM4Mi4zNi4wLjA.',
    'https://firebasestorage.googleapis.com/v0/b/learningcourse-63cab.appspot.com/o/video%2Fnetworking%2FNwPart2.mp4?alt=media&token=33cea209-1d6a-4144-8b24-59fa927ab6a4&_gl=1*1jhyw9q*_ga*MTA5MDU5ODcwNS4xNjk3MDMxMjM3*_ga_CW55HF8NVT*MTY5NzI5MDU3OC4zLjEuMTY5NzI5MjQyNy41OS4wLjA',
    'https://firebasestorage.googleapis.com/v0/b/learningcourse-63cab.appspot.com/o/video%2Fnetworking%2FNwPart3.mp4?alt=media&token=0942c920-a7cd-4269-9d99-72c768934f54&_gl=1*1i8701c*_ga*MTA5MDU5ODcwNS4xNjk3MDMxMjM3*_ga_CW55HF8NVT*MTY5NzI5MDU3OC4zLjEuMTY5NzI5MjQ0NS40MS4wLjA',
  ];
  int currentLessonIndex = 0;
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(lessonUrls[currentLessonIndex])
      ..initialize().then((_) {
        setState(() {});
      });
  }

  void changeLesson(int index) {
    _controller!.pause();
    setState(() {
      currentLessonIndex = index;
      _controller =
      VideoPlayerController.network(lessonUrls[currentLessonIndex])
        ..initialize().then((_) {
          setState(() {});
        });
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: VisibilityDetector(
              key: Key(currentLessonIndex.toString()),
              onVisibilityChanged: (info) {
                if (info.visibleFraction == 0.0) {
                  // Video is not visible, pause it
                  _controller!.pause();
                } else {
                  // Video is visible, play it
                  _controller!.play();
                }
              },
              child: _controller!.value.isInitialized
                  ? Examples(controller: _controller)
                  : CircularProgressIndicator(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: lessonUrls.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Lesson ${index + 1}'),
                  onTap: () {
                    changeLesson(index);
                  },
                  trailing: Icon(Icons.remove_red_eye),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



class Examples extends StatefulWidget {
  final VideoPlayerController? controller;

  const Examples({Key? key, required this.controller}) : super(key: key);

  @override
  _ExamplesState createState() => _ExamplesState();
}

class _ExamplesState extends State<Examples> {
  @override
  Widget build(BuildContext context) {
    // return kIsWeb ? _buildWebView() : _buildMobileView();
    return _buildMobileView();
  }

  Widget _buildWebView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Container(
            child: WebVideoPlayer(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Container(
          child: WebVideoPlayer(),
        ),
      ),],
    );
  }
}
