import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'project_details_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _colorAnimationController;
  late Animation _colorTween;

  final List<Map<String, String>> projects = [
    {
      'title': 'AI Traffic Management',
      'description': 'A smart AI-based traffic system for urban areas.',
      'seniorName': 'John Doe',
      'seniorEmail': 'john.doe@example.com',
      'seniorStatus': 'Studying, 4th Year',
      'department': 'Computer Science',
    },
    {
      'title': 'Personal Expense Tracker',
      'description': 'An intuitive app to track and analyze personal expenses.',
      'seniorName': 'Jane Smith',
      'seniorEmail': 'jane.smith@example.com',
      'seniorStatus': 'Working, Software Engineer',
      'department': 'Information Technology',
    },
    {
      'title': 'Smart Home Automation',
      'description': 'IoT-based system for controlling home appliances.',
      'seniorName': 'Alice Johnson',
      'seniorEmail': 'alice.j@example.com',
      'seniorStatus': 'Studying, 3rd Year',
      'department': 'Electrical Engineering',
    },
    {
      'title': 'Augmented Reality Learning',
      'description': 'AR app for interactive educational experiences.',
      'seniorName': 'Bob Williams',
      'seniorEmail': 'bob.w@example.com',
      'seniorStatus': 'Working, AR Developer',
      'department': 'Computer Science',
    },
    {
      'title': 'Eco-friendly Waste Management',
      'description': 'Innovative system for efficient waste sorting and recycling.',
      'seniorName': 'Emma Davis',
      'seniorEmail': 'emma.d@example.com',
      'seniorStatus': 'Studying, 4th Year',
      'department': 'Environmental Engineering',
    },
    {
      'title': 'Blockchain for Supply Chain',
      'description': 'Implementing blockchain technology for transparent supply chain management.',
      'seniorName': 'Michael Brown',
      'seniorEmail': 'michael.b@example.com',
      'seniorStatus': 'Working, Blockchain Consultant',
      'department': 'Information Technology',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(),
        drawer: _buildDrawer(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(214, 193, 184, 184),
      elevation: 0,
      title: Text('Project Hub', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.nightlight_round),
      //     onPressed: () {
      //       // Toggle dark mode
      //     },
      //   ),
      //   IconButton(
      //     icon: Icon(Icons.translate),
      //     onPressed: () {
      //       // Change language
      //     },
      //   ),
      // ],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: Colors.white.withOpacity(0.9),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF3F51B5).withOpacity(0.8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile_pic.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'John Doe',
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'john.doe@example.com',
                    style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(Icons.person, 'Profile'),
            _buildDrawerItem(Icons.settings, 'Settings'),
            _buildDrawerItem(Icons.info_outline, 'About Us'),
            _buildDrawerItem(Icons.logout, 'Logout'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF3F51B5)),
      title: Text(title, style: GoogleFonts.poppins(color: Color(0xFF3F51B5))),
      onTap: () {
        // Handle drawer item tap
      },
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3F51B5), Color(0xFF303F9F)],
        ),
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discover Innovative Projects',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildSearchBar(),
                    SizedBox(height: 24),
                    _buildCategoryBar(),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ProjectCard(project: projects[index]);
                  },
                  childCount: projects.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search projects...',
        prefixIcon: Icon(Icons.search, color: Colors.white70),
        suffixIcon: Icon(Icons.mic, color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        hintStyle: GoogleFonts.poppins(color: Colors.white70),
      ),
      style: GoogleFonts.poppins(color: Colors.white),
    );
  }

  Widget _buildCategoryBar() {
    List<String> categories = ['All', 'AI', 'IoT', 'Mobile', 'Web', 'Blockchain'];
    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 8),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(categories[index]),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.2),
               // onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        // Add new project functionality
      },
      icon: Icon(Icons.add),
      label: Text('New Project'),
      backgroundColor: Color(0xFF303F9F),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Map<String, String> project;

  ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectDetailsScreen(project: project),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project['title']!,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3F51B5),
                ),
              ),
              SizedBox(height: 8),
              Text(
                project['description']!,
                style: GoogleFonts.poppins(color: Colors.black87),
              ),
              SizedBox(height: 8),
              Text(
                'By ${project['seniorName']} (${project['department']})',
                style: GoogleFonts.poppins(
                  fontStyle: FontStyle.italic,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '${project['seniorStatus']}',
                style: GoogleFonts.poppins(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}