import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                child: _Header(),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _AppointmentCard(),
                    const SizedBox(height: 20),
                    _SearchBar(),
                    const SizedBox(height: 24),
                    _Categories(),
                    const SizedBox(height: 32),
                    _NearDoctorSection(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF8696BB),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Hi James',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0D1B34),
              ),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage('assets/images/239_1061.png'),
        ),
      ],
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/schedule');
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF4894FD),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/239_950.png'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Imran Syahir',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'General Doctor',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color(0xFFCBE1FF),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: Colors.white24, height: 1),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined,
                        color: Colors.white, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      'Sunday, 12 June',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time_filled_outlined,
                        color: Colors.white, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      '11:00 - 12:00 AM',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFAFAFA),
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xFF8696BB),
        ),
        hintText: 'Search doctor or health issue',
        hintStyle: GoogleFonts.poppins(
          fontSize: 15,
          color: const Color(0xFF8696BB),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}

class _Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _CategoryItem(
            icon: Icons.coronavirus_outlined,
            label: 'Covid 19',
            onTap: () {}),
        _CategoryItem(
            icon: Icons.person_add_alt_1_outlined,
            label: 'Doctor',
            onTap: () {}),
        _CategoryItem(
            icon: Icons.medication_outlined, label: 'Medicine', onTap: () {}),
        _CategoryItem(
            icon: Icons.local_hospital_outlined,
            label: 'Hospital',
            onTap: () {}),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _CategoryItem(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(icon, color: const Color(0xFF4894FD), size: 32),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: const Color(0xFF8696BB),
            ),
          ),
        ],
      ),
    );
  }
}

class _NearDoctorSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Near Doctor',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0D1B34),
          ),
        ),
        const SizedBox(height: 16),
        _DoctorCard(
          imageUrl: 'assets/images/239_1036.png',
          name: 'Dr. Joseph Brostito',
          specialty: 'Dental Specialist',
          distance: '1.2 KM',
          rating: '4,8 (120 Reviews)',
          status: 'Open at 17.00',
          statusColor: const Color(0xFF4894FD),
          ratingColor: const Color(0xFFFEAF52),
          onTap: () {},
        ),
        const SizedBox(height: 16),
        _DoctorCard(
          imageUrl: 'assets/images/239_1013.png',
          name: 'Dr. Imran Syahir',
          specialty: 'General Doctor',
          distance: '1.2 KM',
          rating: '4,8 (120 Reviews)',
          status: 'Open at 17.00',
          statusColor: const Color(0xFF4894FD),
          ratingColor: const Color(0xFFFEAF52),
          onTap: () {},
        ),
      ],
    );
  }
}

class _DoctorCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String specialty;
  final String distance;
  final String rating;
  final String status;
  final Color statusColor;
  final Color ratingColor;
  final VoidCallback onTap;

  const _DoctorCard({
    required this.imageUrl,
    required this.name,
    required this.specialty,
    required this.distance,
    required this.rating,
    required this.status,
    required this.statusColor,
    required this.ratingColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0x0A5975A7),
              blurRadius: 20,
              offset: const Offset(2, 12),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(imageUrl),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0D1B34),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        specialty,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color(0xFF8696BB),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                        color: Color(0xFF8696BB), size: 16),
                    const SizedBox(width: 8),
                    Text(
                      distance,
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: const Color(0xFF8696BB)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(color: Color(0xFFF5F5F5), height: 1),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.star, color: Color(0xFFFEAF52), size: 20),
                const SizedBox(width: 6),
                Text(
                  rating,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: ratingColor,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.access_time_outlined,
                    color: Color(0xFF4894FD), size: 20),
                const SizedBox(width: 6),
                Text(
                  status,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: statusColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _BottomNavItem(
              icon: Icons.home,
              label: 'Home',
              isActive: true,
              onTap: () {},
            ),
            _BottomNavItem(
              icon: Icons.calendar_today_outlined,
              onTap: () {
                context.push('/schedule');
              },
            ),
            _BottomNavItem(
              icon: Icons.chat_bubble_outline,
              onTap: () {},
            ),
            _BottomNavItem(
              icon: Icons.person_outline,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String? label;
  final bool isActive;
  final VoidCallback onTap;

  const _BottomNavItem({
    required this.icon,
    this.label,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: isActive
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF63B4FF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(icon, color: const Color(0xFF63B4FF)),
                  const SizedBox(width: 8),
                  Text(
                    label!,
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF63B4FF),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.all(12),
              child: Icon(
                icon,
                color: const Color(0xFF8696BB),
              ),
            ),
    );
  }
}