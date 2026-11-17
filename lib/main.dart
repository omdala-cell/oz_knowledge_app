import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const OmdalazoneApp());
}

class OmdalazoneApp extends StatelessWidget {
  const OmdalazoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0A3D91)),
      useMaterial3: true,
    );

    return MaterialApp(
      title: 'OMDALAZONE - ສູນລວມຄວາມຮູ້ວິຊາການ',
      debugShowCheckedModeBanner: false,
      theme: baseTheme.copyWith(
        textTheme: GoogleFonts.notoSansLaoTextTheme(baseTheme.textTheme),
      ),
      home: const MainShellScreen(),
    );
  }
}

class SiteCategory {
  final String title;
  final String subtitle;
  final String url;
  final IconData icon;
  final Color color;
  final Color bgColor;

  const SiteCategory({
    required this.title,
    required this.subtitle,
    required this.url,
    required this.icon,
    required this.color,
    required this.bgColor,
  });
}

const List<SiteCategory> appCategories = [
  SiteCategory(
    title: 'ລະບົບການຊຳລະ',
    subtitle: 'ຄວາມຮູ້ວິຊາການ ດ້ານລະບົບການຊຳລະ',
    url: 'https://sites.google.com/view/ozpay-la/home',
    icon: Icons.credit_card_rounded,
    color: Color(0xFF1565C0),
    bgColor: Color(0xFFE3F2FD),
  ),
  SiteCategory(
    title: 'ການເງິນ-ເງິນຕາ ແລະ ທະນາຄານ',
    subtitle: 'ຄວາມຮູ້ວິຊາການ ດ້ານການເງິນ-ເງິນຕາ',
    url: 'https://sites.google.com/view/ozbank/home',
    icon: Icons.account_balance_rounded,
    color: Color(0xFF283593),
    bgColor: Color(0xFFE8EAF6),
  ),
  SiteCategory(
    title: 'ການຫັນເປັນດິຈິຕອນ',
    subtitle: 'ຄວາມຮູ້ວິຊາການ ດ້ານການຫັນເປັນດິຈິຕອນ',
    url: 'https://sites.google.com/view/ozdx-la/home',
    icon: Icons.hub_rounded,
    color: Color(0xFF00695C),
    bgColor: Color(0xFFE0F2F1),
  ),
  SiteCategory(
    title: 'ດ້ານນິຕິກຳ',
    subtitle: 'ຄວາມຮູ້ວິຊາການ ດ້ານນິຕິກຳ ແລະ ລະບຽບ',
    url: 'https://sites.google.com/view/ozreg-la/home',
    icon: Icons.gavel_rounded,
    color: Color(0xFF5D4037),
    bgColor: Color(0xFFEFEBE9),
  ),
  SiteCategory(
    title: 'ຂໍ້ມູນຂ່າວສານສິນເຊື່ອ',
    subtitle: 'ຄວາມຮູ້ວິຊາການ ດ້ານຂໍ້ມູນຂ່າວສານສິນເຊື່ອ',
    url: 'https://sites.google.com/view/ozcib-la/home',
    icon: Icons.query_stats_rounded,
    color: Color(0xFFD84315),
    bgColor: Color(0xFFFBE9E7),
  ),
  SiteCategory(
    title: 'ປະກັນໄພເງິນຝາກ',
    subtitle: 'ຄວາມຮູ້ວິຊາການ ດ້ານປະກັນໄພເງິນຝາກ',
    url: 'https://sites.google.com/view/ozdi-la/home',
    icon: Icons.verified_user_rounded,
    color: Color(0xFF2E7D32),
    bgColor: Color(0xFFE8F5E9),
  ),
];

class MainShellScreen extends StatefulWidget {
  const MainShellScreen({super.key});

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  int _selectedIndex = 0;
  String _searchQuery = '';

  void _openCategory(SiteCategory category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewScreen(initialCategory: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _buildHomeTab(),
      _buildSearchTab(),
      _buildBookmarksTab(),
      _buildProfileTab(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FA),
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFF0A3D91).withValues(alpha: 0.12),
        onDestinationSelected: (idx) => setState(() => _selectedIndex = idx),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded, color: Color(0xFF0A3D91)),
            label: 'ໜ້າຫຼັກ',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_rounded),
            selectedIcon: Icon(Icons.search_rounded, color: Color(0xFF0A3D91)),
            label: 'ຄົ້ນຫາ',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school_rounded, color: Color(0xFF0A3D91)),
            label: 'ການຮຽນ',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded, color: Color(0xFF0A3D91)),
            label: 'ໂປຣໄຟລ໌',
          ),
        ],
      ),
    );
  }

  // 1. ໜ້າຫຼັກ (Home Tab) ຕາມ UX/UI ໃໝ່
  Widget _buildHomeTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header & Banner ສີຟ້າເຂັ້ມພ້ອມຂອບສີຄຳ
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 48, 20, 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF062863), Color(0xFF0D47A1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: Column(
              children: [
                // ແຖວ Brand OMDALAZONE + ກະດິ່ງແຈ້ງເຕືອນ
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 36),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Text(
                            'OZ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'omdalazone',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        const Icon(Icons.notifications_none_rounded,
                            color: Colors.white, size: 28),
                        Positioned(
                          right: 2,
                          top: 2,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.circle,
                            ),
                            child: const Text(
                              '1',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'ສູນລວມຄວາມຮູ້ວິຊາການ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'ແຫຼ່ງຮຽນຮູ້ສຳລັບພະນັກງານຂະແໜງການເງິນ-ເງິນຕາ',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 18),
                // ກ່ອງ Banner ຍ່ອຍ Digital Knowledge Platform
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                        color: const Color(0xFFFFD54F).withValues(alpha: 0.6),
                        width: 1.2),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 4,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFCA28),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DIGITAL KNOWLEDGE PLATFORM',
                              style: TextStyle(
                                color: Color(0xFFFFE082),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'ຮຽນຮູ້  •  ວິເຄາະ  •  ນຳໃຊ້',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.auto_awesome_rounded,
                          color: Color(0xFFFFD54F), size: 32),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ຫົວຂໍ້ ຄັງຄວາມຮູ້ວິຊາການ
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 20, 18, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 20,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D47A1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'ຄັງຄວາມຮູ້ວິຊາການ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A2540),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => setState(() => _selectedIndex = 1),
                  child: const Row(
                    children: [
                      Text('ເບິ່ງທັງໝົດ',
                          style: TextStyle(
                              color: Color(0xFF0D47A1),
                              fontWeight: FontWeight.w600)),
                      Icon(Icons.chevron_right_rounded,
                          color: Color(0xFF0D47A1)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ຕາຕະລາງ 6 ໝວດໝູ່ແບບ Horizontal Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.55,
              ),
              itemCount: appCategories.length,
              itemBuilder: (context, index) {
                final item = appCategories[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => _openCategory(item),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: item.bgColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(item.icon, color: item.color, size: 24),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Color(0xFF1A1A1A),
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.subtitle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 10.5,
                                  color: Colors.grey.shade600,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // ສ່ວນ ບົດຮຽນແນະນຳ (Featured Card ດ້ານລຸ່ມ)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: const BoxDecoration(
                    color: Color(0xFF0D47A1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.menu_book_rounded,
                          color: Colors.white, size: 16),
                      SizedBox(width: 6),
                      Text(
                        'ບົດຮຽນແນະນຳ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => _openCategory(appCategories[0]),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(18),
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE3F2FD),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(Icons.auto_stories_rounded,
                              color: Color(0xFF0D47A1), size: 36),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'ພື້ນຖານລະບົບການຊຳລະ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0A2540),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'ບົດຮຽນວິຊາການ • ກົດເພື່ອເຂົ້າອ່ານເນື້ອໃນ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey.shade600),
                              ),
                              const SizedBox(height: 10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: LinearProgressIndicator(
                                  value: 0.65,
                                  minHeight: 7,
                                  backgroundColor: Colors.grey.shade200,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          Color(0xFF1565C0)),
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
            ),
          ),
        ],
      ),
    );
  }

  // 2. ໜ້າຄົ້ນຫາ (Search Tab)
  Widget _buildSearchTab() {
    final filtered = appCategories
        .where((c) =>
            c.title.contains(_searchQuery) || c.subtitle.contains(_searchQuery))
        .toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ຄົ້ນຫາຄວາມຮູ້ວິຊາການ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A2540)),
            ),
            const SizedBox(height: 12),
            TextField(
              onChanged: (val) => setState(() => _searchQuery = val),
              decoration: InputDecoration(
                hintText: 'ພິມຊື່ໝວດໝູ່ທີ່ຕ້ອງການຄົ້ນຫາ...',
                prefixIcon: const Icon(Icons.search_rounded),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: filtered.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final item = filtered[index];
                  return ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    leading: CircleAvatar(
                      backgroundColor: item.bgColor,
                      child: Icon(item.icon, color: item.color),
                    ),
                    title: Text(item.title,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(item.subtitle,
                        style: const TextStyle(fontSize: 12)),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        size: 16),
                    onTap: () => _openCategory(item),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 3. ໜ້າການຮຽນ (Learning Tab)
  Widget _buildBookmarksTab() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ຫຼັກສູດ ແລະ ບົດຮຽນທັງໝົດ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A2540)),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: appCategories.length,
                itemBuilder: (context, index) {
                  final item = appCategories[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    color: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: item.bgColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(item.icon, color: item.color, size: 28),
                      ),
                      title: Text(item.title,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(item.subtitle),
                      trailing: ElevatedButton(
                        onPressed: () => _openCategory(item),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: item.color,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('ເຂົ້າອ່ານ'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 4. ໜ້າໂປຣໄຟລ໌ / ກ່ຽວກັບ (Profile Tab)
  Widget _buildProfileTab() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 44,
              backgroundColor: Color(0xFF0D47A1),
              child: Text(
                'OZ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'OMDALAZONE',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A2540)),
            ),
            const Text(
              'Digital Knowledge Platform',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 24),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.info_outline_rounded,
                          color: Color(0xFF0D47A1)),
                      title: Text('ກ່ຽວກັບແອັບພລິເຄຊັນ'),
                      subtitle: Text(
                          'ສູນລວມຄວາມຮູ້ວິຊາການດ້ານການເງິນ-ການທະນາຄານ, ລະບົບການຊຳລະ, ການຫັນເປັນດິຈິຕອນ, ນິຕິກຳ, ຂໍ້ມູນຂ່າວສານສິນເຊື່ອ ແລະ ປະກັນໄພເງິນຝາກ.'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.verified_rounded,
                          color: Color(0xFF2E7D32)),
                      title: Text('ເວີຊັນແອັບ'),
                      subtitle: Text('Version 2.0 (UX/UI Edition)'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  final SiteCategory initialCategory;
  const WebViewScreen({super.key, required this.initialCategory});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  late SiteCategory currentCategory;
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    currentCategory = widget.initialCategory;
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            if (mounted) {
              setState(() {
                isLoading = true;
                hasError = false;
              });
            }
          },
          onPageFinished: (_) {
            if (mounted) setState(() => isLoading = false);
          },
          onWebResourceError: (_) {
            if (mounted) {
              setState(() {
                isLoading = false;
                hasError = true;
              });
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(currentCategory.url));
  }

  void _switchCategory(SiteCategory newCategory) {
    Navigator.pop(context);
    if (newCategory.url == currentCategory.url) return;
    setState(() {
      currentCategory = newCategory;
      isLoading = true;
      hasError = false;
    });
    _controller.loadRequest(Uri.parse(newCategory.url));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (await _controller.canGoBack()) {
          await _controller.goBack();
        } else {
          if (context.mounted) Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            currentCategory.title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: currentCategory.color,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              icon: const Icon(Icons.home_rounded),
              tooltip: 'ກັບໜ້າຫຼັກ',
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              tooltip: 'ໂຫຼດໃໝ່',
              onPressed: () => _controller.reload(),
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: currentCategory.color),
                child: const SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.menu_book_rounded,
                          color: Colors.white, size: 40),
                      SizedBox(height: 10),
                      Text(
                        'ໝວດໝູ່ຄວາມຮູ້ວິຊາການ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: appCategories.length,
                  itemBuilder: (context, index) {
                    final item = appCategories[index];
                    final isSelected = item.url == currentCategory.url;
                    return ListTile(
                      leading: Icon(item.icon, color: item.color),
                      title: Text(
                        item.title,
                        style: TextStyle(
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? item.color : Colors.black87,
                        ),
                      ),
                      selected: isSelected,
                      selectedTileColor: item.color.withValues(alpha: 0.1),
                      onTap: () => _switchCategory(item),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            if (!hasError) WebViewWidget(controller: _controller),
            if (hasError)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.wifi_off_rounded,
                          size: 60, color: Colors.grey),
                      const SizedBox(height: 16),
                      const Text(
                        'ບໍ່ສາມາດເຊື່ອມຕໍ່ອິນເຕີເນັດໄດ້\nກະລຸນາກວດສອບສັນຍານຂອງທ່ານ',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () => _controller.reload(),
                        icon: const Icon(Icons.refresh),
                        label: const Text('ລອງໃໝ່ອີກຄັ້ງ'),
                      ),
                    ],
                  ),
                ),
              ),
            if (isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
