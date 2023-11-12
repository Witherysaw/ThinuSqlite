import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

Future<Uint8List?> loadImageAsUint8List(String imagePath) async {
  try {
    final File file = File(imagePath);
    if (await file.exists()) {
      final img.Image? image = img.decodeImage(file.readAsBytesSync());
      if (image != null) {
        final Uint8List uint8List = Uint8List.fromList(img.encodePng(image));
        return uint8List;
      }
    }
  } catch (e) {
    print('Error loading and converting image: $e');
  }
  return null;
}


List<Map<String, dynamic>> defaultArticles = [
  {
    'poster': 'John Doe',
    'title': 'Introduction to Java',
    'content': 'Java, a versatile and widely-used programming language, has been a cornerstone of software development for over two decades. Whether you\'re a beginner looking to learn your first programming language or an experienced developer expanding your skill set, Java is an excellent choice. In this introductory article, we\'ll explore the basics of Java and why it\'s a popular language in the world of software development.\n\n'
        'What is Java?\n\n'
        'Java is an object-oriented, high-level programming language originally developed by James Gosling and his team at Sun Microsystems in the mid-1990s. It was designed with the goal of being platform-independent, meaning that Java programs can run on various operating systems without modification. This portability is achieved through the use of the Java Virtual Machine (JVM), which interprets and executes Java code.\n\n'
        'Why Choose Java?\n\n'
        'Platform Independence: As mentioned earlier, Java\'s ability to run on multiple platforms is one of its most significant advantages. You can write a Java program on one operating system and run it on Windows, macOS, or Linux without changes.\n\n'
        'Object-Oriented: Java follows an object-oriented programming (OOP) paradigm, making it easier to manage and organize code. OOP encourages the use of objects, which are instances of classes that encapsulate data and behavior.\n\n'
        'Large Standard Library: Java comes with a vast standard library that provides pre-built classes and methods for common tasks. This library simplifies many programming tasks and saves developers time.\n\n'
        'Strong Community and Ecosystem: Java has a large and active developer community, which means abundant resources, libraries, and frameworks are available to assist in your projects.',
    'img': null, // You can provide image data here if needed
  },
  {
    'poster': 'Alice Smith',
    'title': 'Basic Web Technologies',
    'content': 'In today\'s digital age, the World Wide Web is an integral part of our daily lives. We use it for everything from shopping and entertainment to communication and information retrieval. Behind the scenes, a set of fundamental technologies powers this vast network of interconnected web pages. In this article, we\'ll take a closer look at some of these basic web technologies that make the internet work.\n\n'
        '1. HTML (Hypertext Markup Language)\n\n'
        'HTML is the backbone of the web. It\'s a markup language used to structure the content of web pages. With HTML, you define headings, paragraphs, links, images, and more.\n\n'
        '2. CSS (Cascading Style Sheets)\n\n'
        'CSS is responsible for the visual presentation of web pages. It controls the layout, colors, fonts, and overall design.\n\n'
        '3. JavaScript\n\n'
        'JavaScript is a scripting language that adds interactivity to web pages. It allows you to create dynamic elements and respond to user actions.',
    'img': null,
  },
  {
    'poster': 'Bob Johnson',
    'title': 'Basic Marketing Strategies',
    'content': 'Marketing is a fundamental aspect of any business or organization. It involves promoting products, services, or ideas to attract and retain customers or clients. While marketing can be a complex field, here are some basic marketing strategies to get you started:\n\n'
        '1. Know Your Target Audience: The first step in any marketing strategy is understanding your target audience. Who are your potential customers? What are their needs, preferences, and behaviors? Once you have a clear picture, you can tailor your marketing efforts to resonate with them.\n\n'
        '2. Establish a Strong Online Presence: In the digital age, having an online presence is crucial. Create a user-friendly website and maintain active social media profiles to connect with your audience. Utilize search engine optimization (SEO) techniques to improve your online visibility.\n\n'
        '3. Content Marketing: Content is king. Provide valuable content that educates, entertains, or solves problems for your audience. This can include blog posts, videos, infographics, and more. Quality content can position you as an industry expert and attract customers.\n\n'
        '4. Email Marketing: Email remains a powerful tool for reaching your audience. Send regular newsletters and promotions to your subscribers, but be sure to respect their privacy and preferences.\n\n'
        '5. Networking and Partnerships: Building relationships with other businesses and organizations can open up new marketing opportunities. Collaborate with partners to reach a wider audience.\n\n'
        '6. Analyze and Adapt: Marketing is an evolving field. Use analytics tools to track the performance of your marketing efforts. If a strategy is not working, be ready to adapt and try something new.\n\n'
        'Remember that effective marketing takes time and effort. Be patient and consistent in your efforts, and you\'ll see the benefits of your marketing strategies over time.',
    'img': null,
  },
];

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE articles(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    poster TEXT,
    title TEXT,
    content TEXT,
    img BLOB,
    liked TEXT DEFAULT "FALSE",
    saved TEXT DEFAULT "FALSE",
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  )
  """);
  }

  static Future<void> checkAndInsertDefaultArticles() async {
    final defaultArticlesInserted = await _hasDefaultArticles();

    if (!defaultArticlesInserted) {
      await insertDefaultArticles();
    }
  }

  static Future<bool> _hasDefaultArticles() async {
    final articles = await getItems();
    return articles.isNotEmpty;
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'thinu.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<void> insertDefaultArticles() async {
    final db = await SQLHelper.db();

    for (final article in defaultArticles) {
      await db.insert('articles', article,
          conflictAlgorithm: sql.ConflictAlgorithm.ignore);
    }
  }

  // Create new item (journal)
  static Future<int> createItem(
      String poster, String title, String description, Uint8List? img) async {
    final db = await SQLHelper.db();

    final data = {
      'poster': poster,
      'title': title,
      'content': description,
      'img': img, // Store the selected image as a BLOB
    };

    final id = await db.insert('articles', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('articles', orderBy: "id DESC");
  }

  // Read saved items
  static Future<List<Map<String, dynamic>>> getSavedArticles() async {
    final db = await SQLHelper.db();
    return db.query('articles',
        where: "saved = ?", whereArgs: ["TRUE"], orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('articles', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateLike(int id, String liked) async {
    final db = await SQLHelper.db();

    final data = {'liked': liked, 'createdAt': DateTime.now().toString()};

    final result =
        await db.update('articles', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<int> updateSaved(int id, String saved) async {
    final db = await SQLHelper.db();

    final data = {'saved': saved, 'createdAt': DateTime.now().toString()};

    final result =
        await db.update('articles', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Update an item by id
  static Future<int> updateItem(int id, String poster, String title,
      String? description, Uint8List? img) async {
    final db = await SQLHelper.db();

    final data = {
      'poster': poster,
      'title': title,
      'content': description,
      'img': img,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('articles', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("articles", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
