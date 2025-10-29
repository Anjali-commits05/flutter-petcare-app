import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Care',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.yellow,
      ),
      home: const NightStayScreen(),
    );
  }
}

class NightStayScreen extends StatefulWidget {
  const NightStayScreen({Key? key}) : super(key: key);

  @override
  State<NightStayScreen> createState() => _NightStayScreenState();
}

class _NightStayScreenState extends State<NightStayScreen> {
  int _selectedIndex = 1;
  String _selectedTab = 'Night Stay';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  child: Image.asset(
                    'assets/careservice.jpg',
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                
                Positioned(
                  top: 16,
                  left: 12,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.yellow),
                    onPressed: () {},
                  ),
                ),
               
                Positioned(
                  top: 16,
                  right: 12,
                  child: IconButton(
                    icon: const Icon(Icons.note_alt_rounded, color: Colors.yellow),
                    onPressed: () {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

          
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(50),
                  
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildTabButton('PawPrints', 'PawPrints'),
                    ),
                    Expanded(
                      child: _buildTabButton('Night Stay', 'Night Stay'),
                    ),
                    Expanded(
                      child: _buildTabButton('Customers', 'Customers'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

          
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.pets, color: Colors.black),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Day Care',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Offer daytime care services for pets',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.check_circle, color: Colors.green),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "What's included in your price?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildTag('Give medicines'),
                      _buildTag('Feeding'),
                      _buildTag('Bath & dry'),
                      _buildTag('Out door walks'),
                      _buildTag('Grooming'),
                      _buildTag('Training'),
                      _buildTag('Playing'),
                      _buildTag('Nail trimming'),
                      _buildTag('Vet assistance'),
                    ],
                  ),

                  const SizedBox(height: 20),

                  
                  const Text(
                    'What is your price per night?',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),

                
                  _buildPriceRow('Price Per Night', '14'),
                  const SizedBox(height: 12),
                  _buildPriceRow('Pawfront Fees & Taxes', '2'),
                  const SizedBox(height: 12),
                  _buildPriceRow('You will receive', '12'),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),

    
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pets),
                label: 'Sitter',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Agenda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money),
                label: 'Earning',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chats',
              ),
            ],
          ),
          
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedAlign(
              alignment: _getBallAlignment(_selectedIndex),
              duration: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, String tabName) {
    bool isSelected = _selectedTab == tabName;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = tabName;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    String capitalizedText =
        text[0].toUpperCase() + text.substring(1).toLowerCase();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        capitalizedText,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildPriceRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            '$value CHF',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  AlignmentGeometry _getBallAlignment(int index) {
    switch (index) {
      case 0:
        return Alignment(-0.8, 0);
      case 1:
        return Alignment(-0.25, 0);
      case 2:
        return Alignment(0.3, 0);
      case 3:
        return Alignment(0.8, 0);
      case 4:
        return Alignment(1.35, 0);
      default:
        return Alignment(-0.25, 0);
    }
  }
}