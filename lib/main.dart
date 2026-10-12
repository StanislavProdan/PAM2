import 'package:flutter/material.dart';

void main() => runApp(const LearnlyApp());

class MyApp extends LearnlyApp {
  const MyApp({super.key});
}

class LearnlyApp extends StatelessWidget {
  const LearnlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learnly',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xfff8f9fc),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff3e5df5),
          brightness: Brightness.light,
        ),
      ),
      home: const HomePage(),
    );
  }
}

const navy = Color(0xff202343);
const blue = Color(0xff3f5df5);
const orange = Color(0xffff7108);
const muted = Color(0xff9294a2);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: IndexedStack(
          index: selectedTab == 0 ? 0 : 1,
          children: [_homeContent(context), _profileContent(context)],
        ),
      ),
    );
  }

  Widget _homeContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 260,
            padding: const EdgeInsets.fromLTRB(24, 22, 24, 0),
            decoration: const BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '9:41',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.signal_cellular_alt,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.wifi, size: 16, color: Colors.white),
                        SizedBox(width: 5),
                        Icon(Icons.battery_full, size: 19, color: Colors.white),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 29),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Kristin',
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Let's start learning",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() => selectedTab = 1),
                      child: _avatar(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _progressCard(),
              ],
            ),
          ),
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _promoCard(context),
                const SizedBox(height: 26),
                const Text(
                  'Learning Plan',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: navy,
                  ),
                ),
                const SizedBox(height: 13),
                _learningPlan(),
                const SizedBox(height: 15),
                _meetupCard(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 22, 24, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'My Profile',
                style: TextStyle(
                  color: navy,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () => _showProfileMessage(
                  'Setările vor fi disponibile în curând.',
                ),
                icon: const Icon(Icons.settings_outlined, color: navy),
                tooltip: 'Settings',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x193f5df5),
                  blurRadius: 14,
                  offset: Offset(0, 7),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Color(0xffffe5df),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.face_3,
                    color: Color(0xff763c32),
                    size: 48,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kristin Miller',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'kristin.miller@email.com',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      _showProfileMessage('Poți edita profilul în curând.'),
                  icon: const Icon(Icons.edit_outlined, color: Colors.white),
                  tooltip: 'Edit profile',
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const Text(
            'Your learning stats',
            style: TextStyle(
              color: navy,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _statCard('46', 'Minutes learned', Icons.timer_outlined),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _statCard(
                  '7',
                  'Courses joined',
                  Icons.menu_book_outlined,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _statCard(
                  '12',
                  'Day streak',
                  Icons.local_fire_department_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Account',
            style: TextStyle(
              color: navy,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x09000000),
                  blurRadius: 12,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                _profileAction(
                  icon: Icons.person_outline,
                  title: 'Personal information',
                  onTap: () =>
                      _showProfileMessage('Profilul tău este actualizat.'),
                ),
                _profileAction(
                  icon: Icons.notifications_none,
                  title: 'Notifications',
                  onTap: () => _showProfileMessage('Notificările sunt active.'),
                ),
                _profileAction(
                  icon: Icons.help_outline,
                  title: 'Help center',
                  onTap: () => _showProfileMessage(
                    'Centrul de ajutor se va deschide în curând.',
                  ),
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard(String value, String label, IconData icon) {
    return Container(
      height: 112,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x09000000),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: orange, size: 23),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: navy,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            maxLines: 2,
            style: const TextStyle(color: muted, fontSize: 10, height: 1.2),
          ),
        ],
      ),
    );
  }

  Widget _profileAction({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLast = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : const Border(bottom: BorderSide(color: Color(0xfff0f0f4))),
        ),
        child: Row(
          children: [
            Icon(icon, color: blue, size: 23),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: navy,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: muted),
          ],
        ),
      ),
    );
  }

  void _showProfileMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _avatar() => Container(
    width: 48,
    height: 48,
    decoration: const BoxDecoration(shape: BoxShape.circle),
    child: CustomPaint(painter: _AvatarPainter()),
  );

  Widget _progressCard() => GestureDetector(
    onTap: () => _showMessage('Aici vei vedea progresul tău detaliat.'),
    child: Container(
      height: 102,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: const [
          BoxShadow(
            color: Color(0x17000000),
            blurRadius: 14,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Learned today',
                style: TextStyle(color: muted, fontSize: 12),
              ),
              Text('My courses', style: TextStyle(color: blue, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                '46min',
                style: TextStyle(
                  color: navy,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 4),
              Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Text(
                  '/ 60min',
                  style: TextStyle(color: muted, fontSize: 10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: .77,
              minHeight: 6,
              backgroundColor: Color(0xffeeeefa),
              valueColor: AlwaysStoppedAnimation(orange),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _promoCard(BuildContext context) => SizedBox(
    height: 152,
    child: ListView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(
          width: 250,
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xffcceeff),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                const SizedBox(
                  width: 190,
                  child: Text(
                    'What do you want to learn today?',
                    style: TextStyle(
                      color: navy,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.15,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CourseOverviewPage(),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orange,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      minimumSize: const Size(0, 32),
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -4,
                  bottom: -19,
                  child: SizedBox(
                    width: 132,
                    height: 132,
                    child: CustomPaint(painter: _LearningPainter()),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CourseOverviewPage()),
          ),
          child: Container(
            width: 250,
            decoration: BoxDecoration(
              color: const Color(0xffdff8f4),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Icon(
                Icons.menu_book_rounded,
                color: Color(0xff54bca9),
                size: 42,
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _learningPlan() => GestureDetector(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CourseOverviewPage()),
    ),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x09000000),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          _planRow('Packaging Design', '40/48', .83, true),
          const SizedBox(height: 14),
          _planRow('Product Design', '6/24', .25, false),
        ],
      ),
    ),
  );

  Widget _planRow(String title, String count, double progress, bool done) =>
      Row(
        children: [
          SizedBox(
            width: 27,
            height: 27,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 3,
              color: done ? const Color(0xff777777) : const Color(0xffe9eaf5),
              backgroundColor: const Color(0xfff3f3fa),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: navy,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(count, style: const TextStyle(color: navy, fontSize: 13)),
        ],
      );

  Widget _meetupCard() => GestureDetector(
    onTap: () =>
        _showMessage('Întâlnirile offline vor fi disponibile în curând.'),
    child: Container(
      height: 118,
      padding: const EdgeInsets.fromLTRB(21, 22, 10, 10),
      decoration: BoxDecoration(
        color: const Color(0xffecd9ff),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Meetup',
                  style: TextStyle(
                    fontSize: 23,
                    color: Color(0xff4e1590),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Off-line exchange of learning experience',
                  style: TextStyle(fontSize: 11, color: Color(0xff4e1590)),
                ),
              ],
            ),
          ),
          Container(
            width: 76,
            height: 76,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0x44ffffff),
            ),
            child: const Icon(Icons.groups, size: 53, color: Color(0xffff9e40)),
          ),
        ],
      ),
    ),
  );

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

class CourseOverviewPage extends StatefulWidget {
  const CourseOverviewPage({super.key});

  @override
  State<CourseOverviewPage> createState() => _CourseOverviewPageState();
}

class _CourseOverviewPageState extends State<CourseOverviewPage> {
  bool lessonsSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fc),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Course Overview',
          style: TextStyle(
            color: navy,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 14, 24, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _courseHero(),
            const SizedBox(height: 27),
            const Text(
              'React Front To back',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.access_time, size: 16, color: muted),
                SizedBox(width: 4),
                Text(
                  '6h 30min  ·  7 lessons',
                  style: TextStyle(color: muted, fontSize: 13),
                ),
                Spacer(),
                Icon(Icons.star, color: Color(0xffffbf00), size: 18),
                Text(
                  ' 4.9',
                  style: TextStyle(color: orange, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                Expanded(
                  child: _tab(
                    'Lessons',
                    lessonsSelected,
                    () => setState(() => lessonsSelected = true),
                  ),
                ),
                Expanded(
                  child: _tab(
                    'Description',
                    !lessonsSelected,
                    () => setState(() => lessonsSelected = false),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 9),
            if (lessonsSelected)
              ...[
                ('Introduction to React', '04:28 min'),
                ('Understanding React', '06:12 min'),
                ('Create first React project', '43:58 min'),
                ('Build React', '26:48 min'),
              ].asMap().entries.map(
                (entry) => _lesson(entry.key, entry.value.$1, entry.value.$2),
              )
            else
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 22),
                child: Text(
                  'Învață bazele React prin lecții practice, exemple clare și proiecte construite pas cu pas.',
                  style: TextStyle(color: muted, fontSize: 14, height: 1.5),
                ),
              ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () =>
                        _showMessage('Cursul este disponibil gratuit.'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                      side: const BorderSide(color: Color(0xffeeeeee)),
                      backgroundColor: Colors.white,
                      foregroundColor: orange,
                    ),
                    child: const Text(
                      'Free',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: () => _showMessage('Te-ai înscris la curs!'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                      backgroundColor: orange,
                      foregroundColor: Colors.white,
                      elevation: 0,
                    ),
                    child: const Text(
                      'Enroll Now',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _courseHero() => GestureDetector(
    onTap: () => _showMessage('Videoclipul cursului pornește aici.'),
    child: Container(
      height: 204,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xffa05bf1), Color(0xff5943ce)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            top: 8,
            left: 0,
            right: 0,
            child: Text(
              'SPOKEN ENGLISH',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 150,
              height: 150,
              child: CustomPaint(painter: _CoursePersonPainter()),
            ),
          ),
          Center(
            child: Container(
              width: 53,
              height: 53,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.play_arrow, color: orange, size: 33),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 70,
            right: 70,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '📺 75 Videos',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                  SizedBox(width: 18),
                  Text(
                    '🖥 35 Class',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _tab(String label, bool active, VoidCallback onTap) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.only(bottom: 9),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: active ? orange : const Color(0xffe9e9ed),
            width: active ? 2 : 1,
          ),
        ),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: active ? orange : const Color(0xffc7c7ca),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  Widget _lesson(int index, String title, String duration) => Opacity(
    opacity: index == 3 ? .35 : 1,
    child: InkWell(
      onTap: () => _showMessage('$title a fost selectată.'),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: index == 0 ? orange : Colors.white,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x10000000),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.play_arrow,
                size: 23,
                color: index == 0 ? Colors.white : orange,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: navy,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    duration,
                    style: const TextStyle(color: muted, fontSize: 13),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: orange, size: 27),
          ],
        ),
      ),
    ),
  );

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

class _AvatarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(
      center,
      size.width / 2,
      Paint()..color = const Color(0xffffe6df),
    );

    final skin = Paint()..color = const Color(0xff8f3e2d);
    canvas.drawCircle(center.translate(0, 2), size.width * .22, skin);
    canvas.drawOval(
      Rect.fromCenter(
        center: center.translate(0, -size.height * .12),
        width: size.width * .46,
        height: size.height * .28,
      ),
      Paint()..color = const Color(0xff2f2426),
    );

    final shirt = Path()
      ..moveTo(size.width * .22, size.height)
      ..quadraticBezierTo(
        size.width * .22,
        size.height * .64,
        size.width * .5,
        size.height * .62,
      )
      ..quadraticBezierTo(
        size.width * .78,
        size.height * .64,
        size.width * .78,
        size.height,
      )
      ..close();
    canvas.drawPath(shirt, Paint()..color = const Color(0xffee5c35));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _LearningPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final skin = const Color(0xffd86a3d);
    final hair = const Color(0xffe78338);

    paint.color = hair;
    canvas.drawCircle(
      Offset(size.width * .65, size.height * .43),
      size.width * .2,
      paint,
    );
    paint.color = skin;
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * .66, size.height * .49),
        width: size.width * .24,
        height: size.height * .28,
      ),
      paint,
    );

    final arm = Path()
      ..moveTo(size.width * .48, size.height * .67)
      ..quadraticBezierTo(
        size.width * .58,
        size.height * .53,
        size.width * .62,
        size.height * .35,
      )
      ..lineTo(size.width * .72, size.height * .38)
      ..quadraticBezierTo(
        size.width * .72,
        size.height * .67,
        size.width * .9,
        size.height * .79,
      )
      ..lineTo(size.width * .82, size.height * .98)
      ..quadraticBezierTo(
        size.width * .58,
        size.height * .85,
        size.width * .48,
        size.height * .67,
      )
      ..close();
    paint.color = const Color(0xff2956bc);
    canvas.drawPath(arm, paint);
    paint.color = skin;
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * .5, size.height * .2),
        width: size.width * .12,
        height: size.height * .35,
      ),
      paint,
    );
    paint.color = const Color(0xffe74b27);
    canvas.drawCircle(
      Offset(size.width * .78, size.height * .88),
      size.width * .12,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _CoursePersonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * .42);
    final paint = Paint()..style = PaintingStyle.fill;
    paint.color = const Color(0xffc98b70);
    canvas.drawCircle(center, size.width * .18, paint);
    paint.color = const Color(0xff5e3327);
    canvas.drawOval(
      Rect.fromCenter(
        center: center.translate(0, -size.height * .08),
        width: size.width * .4,
        height: size.height * .28,
      ),
      paint,
    );
    paint.color = const Color(0xff405163);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * .24,
          size.height * .56,
          size.width * .52,
          size.height * .48,
        ),
        const Radius.circular(18),
      ),
      paint,
    );
    paint.color = const Color(0xffd2a486);
    canvas.drawLine(
      Offset(size.width * .42, size.height * .64),
      Offset(size.width * .36, size.height),
      Paint()
        ..color = paint.color
        ..strokeWidth = size.width * .12
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawLine(
      Offset(size.width * .58, size.height * .64),
      Offset(size.width * .64, size.height),
      Paint()
        ..color = paint.color
        ..strokeWidth = size.width * .12
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
