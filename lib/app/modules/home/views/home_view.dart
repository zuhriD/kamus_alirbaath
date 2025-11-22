import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamus_alirbaath/app/theme/app_theme.dart';
import '../controllers/home_controller.dart';

// Brand colors inspired by Al Irtibaath logo
const Color brandPrimary = Color(0xFF5D4B8A); // deep purple (text arab)
const Color brandSecondary = Color(0xFFC8A6D1); // soft lavender (wing)
const Color brandAccent = Color(0xFFE8D6F5); // pale lavender background

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🧭 Bottom Navigation untuk 3 menu
      bottomNavigationBar: Obx(() {
        final index = controller.currentTab.value;
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: index,
            onTap: controller.changeTab,
            backgroundColor: Colors.white,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: brandPrimary,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_rounded),
                label: 'Instruksi',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info_rounded),
                label: 'Tentang Aplikasi',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: 'Profil',
              ),
            ],
          ),
        );
      }),

      body: Stack(
        children: [
          // 🎨 Animated gradient background (nuansa logo)
          AnimatedContainer(
            duration: const Duration(seconds: 3),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [brandPrimary, brandSecondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // 🌙 Nuansa islami – lengkungan kubah tipis di bagian atas
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.18,
              child: SizedBox(
                height: 160,
                child: CustomPaint(painter: _MosqueArchPainter()),
              ),
            ),
          ),

          // ✨ Decorative circles
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            left: -100,
            child: Container(
              width: 360,
              height: 360,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.04),
              ),
            ),
          ),

          // 🔀 Konten per-tab
          SafeArea(
            child: Obx(() {
              final index = controller.currentTab.value;
              if (index == 1) {
                return _buildInstructionTab(context);
              } else if (index == 2) {
                return _buildAboutTab(context);
              } else if (index == 3) {
                return _buildProfileTab(context);
              }
              // default: Home
              return _buildHomeTab(context);
            }),
          ),
        ],
      ),
    );
  }

  // Tentang kami Tab
  Widget _buildAboutTab(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Text(
                "Tentang Aplikasi",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Penjelasan mengenai tujuan, fungsi, dan karakter aplikasi Al-Irtibaath.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.85),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // CONTENT
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: brandAccent.withOpacity(0.97),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                // 🔹 Modern Highlight Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: brandPrimary.withOpacity(0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Apa itu Al-Irtibaath?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: kTextDark,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Al-Irtibaath adalah aplikasi kamus kolokasi bahasa Arab yang dikembangkan sebagai media yang memudahkan pengguna memilih dan menggunakan kata secara tepat sesuai konteks. "
                        "Aplikasi ini hadir sebagai solusi atas minimnya sumber belajar kolokasi bahasa Arab.",
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.6,
                          color: kTextDark,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Features highlight
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: brandPrimary.withOpacity(0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Untuk Siapa?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: kTextDark,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Aplikasi ini dapat digunakan oleh semua kalangan yang ingin belajar atau memperdalam pemahaman tentang kolokasi bahasa Arab—tanpa memandang latar belakang atau tingkat kemampuan.",
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.6,
                          color: kTextDark,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Limitations & improvement
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: brandPrimary.withOpacity(0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Keterbatasan & Harapan",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: kTextDark,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Pengembang menyadari bahwa aplikasi ini masih memiliki keterbatasan, terutama pada cakupan kosakata yang kemungkinan belum mencakup seluruh kolokasi. "
                        "Penyajian data, contoh kalimat, dan sistematika aplikasi juga masih membutuhkan penyempurnaan.",
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.6,
                          color: kTextDark,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Oleh karena itu, masukan dan koreksi dari pengguna maupun para ahli sangat diharapkan agar Al-Irtibaath dapat terus berkembang dan memberikan manfaat yang lebih besar.",
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.6,
                          color: kTextDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ===================== HOME TAB =====================

  Widget _buildHomeTab(BuildContext context) {
    return Column(
      children: [
        // 📱 Header Section
        Container(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
          child: Column(
            children: [
              // 🔹 Banner logo Al Irtibaath
              Container(
                height: 90,
                width: double.infinity / 2,
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/icons/logo_home.png", //
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),

              // Sub-title kecil
              Text(
                "Kamus Kolokasi Bahasa Arab",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.9),
                  letterSpacing: 0.6,
                ),
              ),

              const SizedBox(height: 24),

              // 🔍 Modern Search Box
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.20),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.4),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search_rounded,
                            color: Colors.white.withOpacity(0.9),
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: controller.searchC,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                hintText: 'ابحث عن كلمة... Cari kata...',
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 15,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              onChanged: controller.searchWord,
                            ),
                          ),
                          // Clear button
                          ValueListenableBuilder<TextEditingValue>(
                            valueListenable: controller.searchC,
                            builder: (context, value, child) {
                              if (value.text.isNotEmpty) {
                                return IconButton(
                                  icon: Icon(
                                    Icons.clear_rounded,
                                    color: Colors.white.withOpacity(0.9),
                                    size: 22,
                                  ),
                                  onPressed: () {
                                    controller.searchC.clear();
                                    controller.searchWord('');
                                  },
                                );
                              }
                              return const SizedBox(width: 4);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // 📚 Results Section
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: brandAccent.withOpacity(0.95),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Obx(() {
              final results = controller.filteredWords;

              if (controller.searchText.value.isEmpty) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const SizedBox(height: 12),

                      Icon(
                        Icons.search_rounded,
                        size: 80,
                        color: Colors.purple[100],
                      ),
                      const SizedBox(height: 16),

                      Text(
                        "Mulai mencari kata",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.purple[400],
                        ),
                      ),
                      const SizedBox(height: 8),

                      Text(
                        "Ketik kata Arab atau Indonesia.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.purple[200],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // 🔹 Expandable Konsep Kolokasi
                      const _KolokasiConceptExpandable(),
                    ],
                  ),
                );
              }

              if (results.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off_rounded,
                        size: 80,
                        color: Colors.purple[100],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Tidak ada hasil ditemukan",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.purple[400],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Coba kata kunci lain",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.purple[200],
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: results.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, i) {
                  final word = results[i];
                  return TweenAnimationBuilder(
                    duration: Duration(milliseconds: 250 + (i * 40)),
                    tween: Tween<double>(begin: 0, end: 1),
                    curve: Curves.easeOutCubic,
                    builder: (context, double value, child) {
                      return Transform.translate(
                        offset: Offset(0, 20 * (1 - value)),
                        child: Opacity(opacity: value, child: child),
                      );
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => controller.openDetail(word),
                        borderRadius: BorderRadius.circular(20),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: brandPrimary.withOpacity(0.10),
                                blurRadius: 15,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                // Number badge
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [brandPrimary, brandSecondary],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '1', // akan diganti di builder
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),

                                // Content
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        word.arti,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: kTextDark,
                                          height: 1.3,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          word.kolokasi,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(
                                            fontFamily: 'Amiri',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: brandPrimary,
                                            height: 1.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 8),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 16,
                                  color: Colors.grey[400],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ),
      ],
    );
  }

  // ===================== INSTRUKSI TAB =====================

  Widget _buildInstructionTab(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Text(
                "Instruksi Penggunaan",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Ikuti langkah berikut untuk menggunakan Kamus Kolokasi Al-Irtibaath.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.85),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: brandAccent.withOpacity(0.97),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: const [
                _InstructionStep(
                  icon: Icons.play_circle_fill_rounded,
                  title: "1. Masuk ke Aplikasi",
                  desc:
                      "Setelah membuka Al-Irtibaath, akan muncul welcome screen dengan logo aplikasi. Silakan tunggu beberapa saat hingga masuk ke halaman utama.",
                ),
                _InstructionStep(
                  icon: Icons.dashboard_customize_rounded,
                  title: "2. Menu",
                  desc:
                      "Setelah tampilan utama terbuka, pengguna akan menemukan beberapa menu navigasi yang memudahkan akses ke berbagai fitur aplikasi.",
                ),
                _InstructionStep(
                  icon: Icons.search_rounded,
                  title: "3. Pencarian Kolokasi",
                  desc:
                      "Ketik kata kunci yang ingin dicari pada kolom pencarian. Pengguna dapat melakukan pencarian dengan memasukkan kata kunci dalam bahasa Arab atau bahasa Indonesia sesuai kebutuhan.",
                ),
                _InstructionStep(
                  icon: Icons.list_alt_rounded,
                  title: "4. Hasil Pencarian",
                  desc:
                      "Setelah mengetik kata kunci, aplikasi akan menampilkan kolokasi atau pasangan kata lengkap dengan makna dan contoh kalimat penggunaannya.",
                ),
                _InstructionStep(
                  icon: Icons.wifi_off_rounded,
                  title: "5. Mode Offline",
                  desc:
                      "Aplikasi Al-Irtibaath dapat digunakan tanpa koneksi internet, sehingga tetap praktis kapan pun dan di mana pun.",
                ),
                _InstructionStep(
                  icon: Icons.person_rounded,
                  title: "6. Informasi Pengembang",
                  desc:
                      "Informasi mengenai tim pengembang dapat dilihat melalui menu Profil Pengembang.",
                ),
                _InstructionStep(
                  icon: Icons.info_rounded,
                  title: "7. Tentang Aplikasi",
                  desc:
                      "Menu Tentang Aplikasi berisi penjelasan singkat mengenai tujuan pengembangan, fungsi utama, serta kelebihan dan keterbatasan aplikasi Al-Irtibaath sebagai kamus kolokasi bahasa Arab.",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ===================== PROFIL TAB (BARU, 3 KARTU) =====================

  Widget _buildProfileTab(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Text(
                "Profil Pengembang & Pembimbing",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Informasi singkat tentang pengembang dan dosen pembimbing aplikasi Al-Irtibaath.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.85),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: brandAccent.withOpacity(0.97),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              children: const [
                SizedBox(height: 32),
                ProfileCard(
                  photoAsset: 'assets/icons/image_3.jpg',
                  name: 'Herlina Aulia',
                  idLabel: 'NIM',
                  idValue: '240231818552',
                  address: 'Jl. Joyosuko 60A, Malang',
                  email: 'herlina.aulia.2402318@students.um.ac.id',
                ),
                SizedBox(height: 50),
                ProfileCard(
                  photoAsset: 'assets/icons/image_1.jpg',
                  name: 'Prof. Dr. Moh. Ainin, M.Pd',
                  idLabel: 'NIP',
                  idValue: '196004011987011001',
                  address: 'Jl. Simpang Sunan Kalijaga V No. 3, Malang',
                  email: 'moh.ainin.fs@um.ac.id',
                ),
                SizedBox(height: 50),
                ProfileCard(
                  photoAsset: 'assets/icons/image_2.jpg',
                  name: 'Dr. Moh. Khasairi, M.Pd',
                  idLabel: 'NIP',
                  idValue: '196109021986011001',
                  address: 'Jl. Gading Pesantren 45B, Malang',
                  email: 'moh.khasairi.fs@um.ac.id',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _KolokasiConceptExpandable extends StatefulWidget {
  const _KolokasiConceptExpandable();

  @override
  State<_KolokasiConceptExpandable> createState() =>
      _KolokasiConceptExpandableState();
}

class _KolokasiConceptExpandableState extends State<_KolokasiConceptExpandable>
    with SingleTickerProviderStateMixin {
  bool expanded = false;

  late AnimationController _controller;
  late Animation<double> _arrowAnim;
  late Animation<double> _expandAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _arrowAnim = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _expandAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
  }

  void toggle() {
    setState(() {
      expanded = !expanded;
      expanded ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: brandPrimary.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // HEADER (tappable)
          InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: toggle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Row(
                children: [
                  // Icon
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: brandSecondary.withOpacity(.25),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.lightbulb_rounded,
                      color: brandPrimary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Title
                  const Expanded(
                    child: Text(
                      "Konsep Dasar Kolokasi",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: kTextDark,
                      ),
                    ),
                  ),

                  // Animated arrow
                  RotationTransition(
                    turns: _arrowAnim,
                    child: const Icon(
                      Icons.expand_more_rounded,
                      color: Colors.grey,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // BODY (expandable)
          SizeTransition(
            sizeFactor: _expandAnim,
            axisAlignment: -1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Kolokasi adalah kecenderungan kata-kata tertentu untuk muncul bersama secara teratur dalam suatu bahasa, di mana pilihan kata yang berpasangan tidak selalu didasarkan pada logika, tetapi terbentuk dari kebiasaan pemakaian (Baker, 1997).",
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.6,
                      color: kTextDark,
                    ),
                  ),
                  SizedBox(height: 8),

                  Text(
                    "Menurut Benson & Ilson (1997), kolokasi dibagi menjadi dua:",
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.6,
                      fontWeight: FontWeight.w700,
                      color: kTextDark,
                    ),
                  ),
                  SizedBox(height: 8),

                  Text(
                    "• Kolokasi gramatikal → gabungan kata dengan preposisi. Contoh bahasa Arab: سعيد بـ (bahagia dengan), ثقة بـ (percaya terhadap), راضٍ عن (puas terhadap).",
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.6,
                      color: kTextDark,
                    ),
                  ),
                  SizedBox(height: 6),

                  Text(
                    "• Kolokasi leksikal → kata yang lazim muncul bersama karena kebiasaan bahasa. Contoh: اتخاذ قرار (mengambil keputusan), أتاح الفرصة (memberi kesempatan), مطر غزير (hujan lebat).",
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.6,
                      color: kTextDark,
                    ),
                  ),
                  SizedBox(height: 8),

                  Text(
                    "Kolokasi-kolokasi tersebut muncul secara alami sesuai kebiasaan penutur bahasa Arab.",
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.6,
                      color: kTextDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ===================== WIDGET KECIL & PAINTER =====================

class _InstructionStep extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _InstructionStep({
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: brandPrimary.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: brandSecondary.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: brandPrimary, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: kTextDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Kartu profil modern: foto bulat menempel di atas kartu + border halus
class ProfileCard extends StatelessWidget {
  final String photoAsset;
  final String name;
  final String idLabel; // NIM / NIP
  final String idValue;
  final String address;
  final String email;

  const ProfileCard({
    super.key,
    required this.photoAsset,
    required this.name,
    required this.idLabel,
    required this.idValue,
    required this.address,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Card utama
        Container(
          padding: const EdgeInsets.fromLTRB(16, 56, 16, 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.grey.shade300, width: 1.2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            children: [
              // Nama
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: kTextDark,
                ),
              ),
              const SizedBox(height: 4),
              Container(width: 80, height: 1, color: Colors.grey.shade400),
              const SizedBox(height: 6),
              Text(
                '$idLabel: $idValue',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 16),

              // Info baris 1: alamat
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 18,
                    color: kTextDark,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      address,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade800,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Info baris 2: email
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.email_outlined, size: 18, color: kTextDark),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      email,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade800,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Foto bulat di atas kartu
        Positioned(
          top: -40,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [brandSecondary, brandPrimary],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: CircleAvatar(backgroundImage: AssetImage(photoAsset)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Painter untuk lengkungan kubah (nuansa islami halus)
class _MosqueArchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white.withOpacity(0.6)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.4;

    final width = size.width;
    final height = size.height;

    // Outer arch
    final path =
        Path()
          ..moveTo(0, height)
          ..quadraticBezierTo(
            width * 0.25,
            height * 0.25,
            width * 0.5,
            height * 0.15,
          )
          ..quadraticBezierTo(width * 0.75, height * 0.25, width, height);
    canvas.drawPath(path, paint);

    // Inner arch
    final innerPaint =
        Paint()
          ..color = Colors.white.withOpacity(0.35)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.0;

    final innerPath =
        Path()
          ..moveTo(width * 0.05, height)
          ..quadraticBezierTo(
            width * 0.25,
            height * 0.3,
            width * 0.5,
            height * 0.22,
          )
          ..quadraticBezierTo(width * 0.75, height * 0.3, width * 0.95, height);
    canvas.drawPath(innerPath, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
