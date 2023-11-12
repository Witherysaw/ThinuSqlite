import 'package:flutter/material.dart';
import 'colors.dart';

class Subscription {
  final String title;
  final String monthlyPrice;
  final String yearlyPrice;
  final String description;
  final String duration;
  final String numberOfFeatures;

  Subscription(
      this.title, this.monthlyPrice, this.yearlyPrice, this.description, this.duration, this.numberOfFeatures);
}

class SubscriptionPlans extends StatelessWidget {
  final List<Subscription> subscriptions = [
    Subscription("Bronze", "Free", "Free", "Limited to Basic Courses ", "No Download ability", "Include Ads"),
    Subscription("Silver", "17,500 MMK", "180,000 MMK", "Full Access to All Courses", "15 Downloads", "Ad-Free Experience"),
    Subscription("Gold", "22,500 MMK", "225,000 MMK", "Access to Live Chat", "Access to exclusive webinars", "Unlimted Downloads"),
  ];

  SubscriptionPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Subscription Plans'),
          backgroundColor: Colors.indigo,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const  Center(
                child: Text(
                  'Choose a Subscription Plan',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: subscriptions.map((subscription) {
                    return SubscriptionCard(subscription: subscription);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      );
  }
}

class SubscriptionCard extends StatelessWidget {
  final Subscription subscription;

  SubscriptionCard({required this.subscription});

  Color getStarColor(String title) {
    if (title == "Bronze") {
      return Colors.brown; // You can change this to the desired color for Bronze
    } else if (title == "Silver") {
      return Colors.grey; // You can change this to the desired color for Silver
    } else if (title == "Gold") {
      return Colors.amber; // You can change this to the desired color for Gold
    } else {
      return Colors.deepPurple; // Default color for unknown titles
    }
  }

  @override
  Widget build(BuildContext context) {
    Color starColor = getStarColor(subscription.title);

    return GestureDetector(
      onTap: () {
        _showSubscriptionDetails(context);
      },
      child: Card(
        color: Colors.white70,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.star,
                color: starColor,
                size: 40.0,
              ),
              const SizedBox(height: 10.0),
              Text(
                subscription.title,
                style: const TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Monthly: ${subscription.monthlyPrice}',
                style: const TextStyle(fontSize: 20.0, color: Colors.black87),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Yearly: ${subscription.yearlyPrice}',
                style: const TextStyle(fontSize: 20.0, color: Colors.black87),
              ),
              const SizedBox(height: 10.0),
              Text(
                ' ${subscription.duration}',
                style: const TextStyle(fontSize: 18.0, color: Colors.black87),
              ),
              const SizedBox(height: 10.0),
              Text(
                '${subscription.numberOfFeatures}',
                style: const TextStyle(fontSize: 18.0, color: Colors.black87),
              ),
              const SizedBox(height: 10.0),
              Center(
                child: Text(
                  '${subscription.description}',
                  style: const TextStyle(fontSize: 18.0, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 10.0),
              Tooltip(
                message: 'Subscribe to ${subscription.title}',
                child: subscription.title == "Bronze"
                    ? SizedBox() // Replace the button with an empty SizedBox for the "Silver" subscription
                    : ElevatedButton(
                  onPressed: () {
                    _handleSubscriptionPurchase(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                  ),
                  child: const Text('Subscribe', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSubscriptionDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubscriptionDetails(subscription: subscription)),
    );
  }

  void _handleSubscriptionPurchase(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 10),
            Text('Processing subscription...'),
          ],
        ),
      ),
    );

    // Simulate a delay for subscription processing (replace with actual logic)
    Future.delayed(const Duration(seconds: 2), () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Subscription ${subscription.title} successful!'),
          duration: const Duration(seconds: 3),
        ),
      );
    });
  }
}

class SubscriptionDetails extends StatefulWidget {
  final Subscription subscription;

  SubscriptionDetails({required this.subscription});

  @override
  _SubscriptionDetailsState createState() => _SubscriptionDetailsState();


}

class _SubscriptionDetailsState extends State<SubscriptionDetails> {
  bool showMonthly = true;
  Color getStarColor(String title) {
    if (title == "Bronze") {
      return Colors.brown; // You can change this to the desired color for Bronze
    } else if (title == "Silver") {
      return Colors.grey; // You can change this to the desired color for Silver
    } else if (title == "Gold") {
      return Colors.amber; // You can change this to the desired color for Gold
    } else {
      return Colors.deepPurple; // Default color for unknown titles
    }
  }

  String getText(String title) {
    if (title == "Bronze") {
      return "Our free version offers access to a range of fundamental courses, allowing you to kickstart your learning journey without any cost.\nPlease note that downloading for offline use is available in the premium version.\n As a free user, you'll encounter occasional ads within the app. These ads help support the availability of free content to a wide audience."; // You can change this to the desired color for Bronze
    } else if (title == "Silver") {
      return "In our silver version for unrestricted access to our entire course catalog. Explore a wide range of subjects and learning materials to suit your interests and needs.\nWith the silver version, you can download up to 15 course materials for offline use. This flexibility allows you to continue learning even when you're not connected to the internet.\nSay goodbye to interruptions. The premium version ensures an ad-free learning experience, allowing you to focus on your studies without any distractions."; // You can change this to the desired color for Silver
    } else if (title == "Gold") {
      return "Connect with instructors and fellow learners through live chat, making your learning experience more engaging and personalized.\n With the gold version, you gain entry to exclusive webinars and live sessions conducted by experts in various fields.\nIn the gold version, there are no restrictions on downloads. You can save an unlimited number of course materials for offline access, giving you the flexibility to study on your terms, wherever you are."; // You can change this to the desired color for Gold
    } else {
      return ""; // Default color for unknown titles
    }
  }

  String content = '';


  @override
  Widget build(BuildContext context) {
    content = getText(widget.subscription.title);
    Color starColor = getStarColor(widget.subscription.title);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Details'),
        backgroundColor: tuDarkBlue,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("images/articlebgbg.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.darken,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Icon(
                  Icons.star,
                  color: starColor,
                  size: 40.0,
                ),
                const SizedBox(height: 16.0),
                Text(
                  widget.subscription.title,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 16.0),
                Text(
                  showMonthly
                      ? 'Monthly: ${widget.subscription.monthlyPrice}'
                      : 'Yearly: ${widget.subscription.yearlyPrice}',
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '$content',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                // const SizedBox(height: 16.0),
                // Text(
                //   '${widget.subscription.numberOfFeatures}',
                //   style: const TextStyle(fontSize: 20, color: Colors.white),
                // ),
                // const SizedBox(height: 16.0),
                // Text(
                //   widget.subscription.description,
                //   style: const TextStyle(fontSize: 20, color: Colors.white),
                // ),
                const SizedBox(height: 16.0),
                Center(
                  child: widget.subscription.title == "Bronze"
                      ? SizedBox() // Replace the button with an empty SizedBox for the "Silver" subscription
                      : ElevatedButton(
                    onPressed: () {
                      _handleSubscriptionPurchase(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                    ),
                    child: const Text('Subscribe', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showMonthly = !showMonthly;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                  child: Text(
                      showMonthly ? 'Show Yearly' : 'Show Monthly',
                      style: const TextStyle(color: Colors.white, fontSize: 20)),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSubscriptionPurchase(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 10),
            Text('Processing subscription...'),
          ],
        ),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Subscription ${widget.subscription.title} successful!'),
          duration: const Duration(seconds: 3),
        ),
      );
    });
  }
}