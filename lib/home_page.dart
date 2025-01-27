import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E), // Background color
      appBar: AppBar(
        backgroundColor: Color(0xFF1E1E1E),
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png', // Replace with your logo path
              height: 40,
            ),
            Spacer(),
            Icon(Icons.menu, color: Colors.white),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Section
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: Color(0xFF4E594A), // Match the card background
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Aryan,',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Pancakes for breakfast!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Let’s make it amazing!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Let’s brainstorm with Grocio AI',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Reminders Section
            Text(
              'Reminders:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),

            // Reminder Cards
            Expanded(
              child: ListView(
                children: [
                  ReminderCard(
                    title: 'Eggs',
                    location: 'Fridge',
                    date: 'Jun 10, 2024',
                    time: '9:41 AM',
                  ),
                  ReminderCard(
                    title: 'Bagels',
                    location: 'Top Shelf A',
                    date: 'Jun 10, 2024',
                    time: '9:41 AM',
                  ),
                  ReminderCard(
                    title: 'Apples',
                    location: 'Fridge',
                    date: 'Count: 1',
                    time: '',
                  ),
                ],
              ),
            ),

            // Bottom Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Grocery List
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Grocery List',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to My Pantry
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'My Pantry',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1E1E1E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Grocio AI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Items',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'My Pantry',
          ),
        ],
        onTap: (index) {
          // Handle navigation logic
        },
      ),
    );
  }
}

class ReminderCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  final String time;

  const ReminderCard({super.key, 
    required this.title,
    required this.location,
    required this.date,
    this.time = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          if (location.isNotEmpty) ...[
            SizedBox(height: 8),
            Text(location, style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
          SizedBox(height: 8),
          Row(
            children: [
              if (date.isNotEmpty)
                Text(
                  date,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              if (time.isNotEmpty) ...[
                SizedBox(width: 8),
                Text(
                  time,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
