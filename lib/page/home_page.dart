import 'package:flutter/material.dart';
import 'parking_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const Color _primary = Color(0xFF5142FF);
  static const Color _ink = Color(0xFF19172E);
  static const Color _muted = Color(0xFF8A87A6);
  static const Color _bg = Color(0xFFF7F6FF);

  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> parkingAreas = [
    {
      'name': 'Area parkir EduTech',
      'location': 'Sebelah taman Edutech FILKOM UB',
      'image': 'assets/images/parkir_edutech.png',
    },
    {
      'name': 'Area parkir FILKOM',
      'location': 'Belakang Gedung A FILKOM UB',
      'image': 'assets/images/parkir_filkom.png',
    },
    {
      'name': 'Area parkir FTP',
      'location': 'Belakang Gedung D dan E FTP UB',
      'image': '',
    },
    {
      'name': 'Area parkir PLD',
      'location': 'Belakang Gedung PLD UB',
      'image': '',
    },
  ];

  String searchQuery = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredAreas = parkingAreas.where((area) {
      final name = area['name']!.toLowerCase();
      final location = area['location']!.toLowerCase();
      return name.contains(searchQuery) || location.contains(searchQuery);
    }).toList();

    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: logo SIP dan profil
              Row(
                children: [
                  Image.asset(
                    'assets/images/LOGO SIP.png',
                    width: 110,
                    height: 48,
                    fit: BoxFit.contain,
                    alignment: Alignment.centerLeft,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, '/profile'),
                    customBorder: const CircleBorder(),
                    child: Container(
                      width: 44,
                      height: 44,
                      padding: const EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: _softShadow,
                      ),
                      child: Image.asset(
                        'assets/images/Vector.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Sapaan pengguna
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                    letterSpacing: -0.5,
                    color: _ink,
                  ),
                  children: const [
                    TextSpan(text: 'Halo Venelope 👋\n'),
                    TextSpan(text: 'mau '),
                    TextSpan(
                      text: 'parkir',
                      style: TextStyle(color: _primary),
                    ),
                    TextSpan(text: ' di mana hari ini?'),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // Search bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: _softShadow,
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value.toLowerCase().trim();
                    });
                  },
                  style: const TextStyle(fontSize: 14, color: _ink),
                  decoration: InputDecoration(
                    hintText: 'Cari area parkir...',
                    hintStyle: const TextStyle(fontSize: 14, color: _muted),
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: _primary,
                      size: 22,
                    ),
                    suffixIcon: searchQuery.isEmpty
                        ? null
                        : IconButton(
                            icon: const Icon(
                              Icons.close_rounded,
                              color: _muted,
                              size: 20,
                            ),
                            onPressed: () {
                              searchController.clear();
                              setState(() => searchQuery = '');
                            },
                          ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Menu Peta dan Rekomendasi
              Row(
                children: [
                  Expanded(
                    child: _HomeMenuCard(
                      title: 'Peta',
                      subtitle: 'Area parkir UB',
                      iconPath: 'assets/images/ei_location.png',
                      onTap: () => Navigator.pushNamed(context, '/map'),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _HomeMenuCard(
                      title: 'Rekomendasi',
                      subtitle: 'Tempat parkir',
                      iconPath: 'assets/images/griddy-icons_time-back.png',
                      onTap: () =>
                          Navigator.pushNamed(context, '/recommendation'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 26),

              // Judul section
              Row(
                children: [
                  const Text(
                    'Area Parkir',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: _ink,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0x1F5142FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${filteredAreas.length}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: _primary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Daftar area parkir
              ...filteredAreas.map((area) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _ParkingAreaCard(
                    name: area['name']!,
                    location: area['location']!,
                    imagePath: area['image']!,
                    onTap: () {
                         if (area['name'] == 'Area parkir EduTech') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ParkingPage(areaName: 'EduTech'),
                            ),
                          );
                          return;
                        }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          content: Text('Kamu memilih ${area['name']}'),
                        ),
                      );
                    },
                  ),
                );
              }),

              if (filteredAreas.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 44,
                          color: _muted,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Area parkir tidak ditemukan.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: _muted, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

const List<BoxShadow> _softShadow = [
  BoxShadow(
    color: Color(0x145142FF),
    blurRadius: 18,
    offset: Offset(0, 6),
  ),
];

// Widget menu Peta dan Rekomendasi
class _HomeMenuCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final VoidCallback onTap;

  const _HomeMenuCard({
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Ink(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: _softShadow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: const Color(0x1F5142FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(iconPath, fit: BoxFit.contain),
              ),
              const SizedBox(height: 14),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF19172E),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8A87A6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget kartu foto area parkir
class _ParkingAreaCard extends StatelessWidget {
  final String name;
  final String location;
  final String imagePath;
  final VoidCallback onTap;

  const _ParkingAreaCard({
    required this.name,
    required this.location,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Ink(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: _softShadow,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 84,
                  height: 84,
                  child: imagePath.isEmpty
                      ? Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF5142FF), Color(0xFF8B80FF)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Icon(
                            Icons.local_parking_rounded,
                            color: Colors.white,
                            size: 32,
                          ),
                        )
                      : Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF19172E),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 1),
                          child: Icon(
                            Icons.location_on_rounded,
                            size: 14,
                            color: Color(0xFF5142FF),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            location,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              height: 1.3,
                              color: Color(0xFF8A87A6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Color(0xFFBDB9E0),
              ),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }
}