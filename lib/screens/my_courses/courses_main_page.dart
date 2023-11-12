import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../colors.dart';
import '../videopostui.dart';
import 'card_view_details.dart';
import 'category_details.dart';


class CourseListScreen extends StatelessWidget {
  final List<String> categories = [
    "All Topics",
    "Technology",
    "Arts",
    "Engineering",
    "Marketing",
    "Business",
    "Marketing",
    "Design",
    "Music",
    "Development"
  ];

  void _navigateToCategoryPage(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 6),
            Container(
              height: 190.0,
              width: 550.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('images/CourseIntro10.jpg'))),
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        _navigateToCategoryPage(context, category);
                      },
                      child: Text(category),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(tuLightBlue), // Set your desired color
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Recommendation',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle "See All" button tap
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'See All',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 8),
            Container(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  int indexplus = index+1;
                  int slide1 = index+2;
                  return CourseCard(
                    courseTitle: 'Course $indexplus',
                    authorName: 'Author Name',
                    imageAssetPath: 'images/CourseIntro$slide1.jpg',
                  );
                },
              ),
            ),

            Row(
              children: [
                Text(
                  'Latest',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle "See All" button tap
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'See All',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 8),
            Container(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  int indexplus = index+1;
                  return CourseCard(
                    courseTitle: 'Course $indexplus',
                    authorName: 'Author Name',
                    imageAssetPath: 'images/CourseIntro$index.jpg',
                  );
                },
              ),
            ),

            SizedBox(height: 16),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.video_camera_front),
          backgroundColor: floatingplusbtn,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => videopost(),
              ),
            );
          },
        )
    );
  }
}

//----------------------------- Card2
//------------------------------
class CourseCard extends StatelessWidget {
  final String courseTitle;
  final String authorName;
  final String imageAssetPath;

  CourseCard({
    required this.courseTitle,
    required this.authorName,
    required this.imageAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailScreen(
                  ),
                ),
              );
            },
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imageAssetPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            courseTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            authorName,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailScreen(
                  ),
                ),
              );
            },
            child: Text('View Course'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(tuLightBlue), // Set your desired color
            ),
          ),
        ],
      ),
    );
  }
}

