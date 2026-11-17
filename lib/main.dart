import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const KnowledgeHubApp());
}

class KnowledgeHubApp extends StatelessWidget {
  const KnowledgeHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D47A1)),
      useMaterial3: true,
    );

    return MaterialApp(
      title: 'ສູນລວມຄວາມຮູ້ວິຊາການ',
      debugShowCheckedModeBanner: false,
      theme: baseTheme.copyWith(
        textTheme: GoogleFonts.notoSansLaoTextTheme(baseTheme.textTheme),
      ),
      home: const MainDashboardScreen(),
    );
  }
}

class SiteCategory {
  final String title;
  final String subtitle;
  final String url;
  final IconData icon;
  final Color color;

  const SiteCategory({
    required this.title,
    required this.subtitle,
    required this.url,
    required this.icon,
    required this.color,
  });
}

const List<SiteCategory> appCategories = [
  SiteCategory(
    title: 'ລະບົບການຊໍາລະ',
    subtitle: 'ຄວາມຮູ້ວິຊາການ ດ້ານລະບົບການຊໍາລະ',
    url: 'https://sites.google.com/view/ozpay-la/home',
    icon: Icons.payment_rounded,
    color: Color(0xFF1565C0),
  ),
  SiteCategory(
    title: 'ການເງິນ-ເງິນຕາ ແລະ ທະນາຄານ',
    subtitle: 'ຄວາມຮູ້ວິຊາການ ດ້ານການເງິນ-ເງິນຕາ ແລະ ທະນາຄານ',
    url: 'https://sites.google.com/view/ozbank/home',
    icon: Icons.account_balance_rounded,
    color: Color(0xFF283593),
  ),
  SiteCategory(
    title: 'ການຫັນເປັນດິຈິຕອນ',
    subtitle: 'ຄວາມຮູ້ວິຊາການ ດ້ານການຫັນເປັນດິຈິຕອນ',
    url: 'https://sites.google.com/view/ozdx-la/home',
    icon: Icons.hub_rounded,
    color: Color(0xFF00695C),
  ),
  SiteCategory(
    title: 'ດ້ານນິຕິກໍາ',
    subtitle: 'ຄວາມຮູ້ວິຊາການ ດ້ານນິຕິກໍາ',
    url: 'https://sites.google.com/view/ozreg-la/home',
    icon: Icons.gavel_rounded,
    color: Color(0xFF4E342E),
  ),
  SiteCategory(
    title: 'ຂໍ້ມູນຂ່າວສານສິນເຊື່ອ',
    subtitle: 'ຄວາມຮູ້ວິຊາການ ດ້ານວຽກງານຂໍ້ມູນຂ່າວສານສິນເຊື່ອ',
    url: 'https://sites.google.com/view/ozcib-la/home',
    icon: Icons.query_stats_rounded,
    color: Color(0xFFD84315),
  ),
  SiteCategory(
    title: 'ປະກັນໄພເງິນຝາກ',
    subtitle: 'ຄວາມຮູ້ວິຊາການ ດ້ານວຽກງານປະກັນໄພເງິນຝາກ',
    url: 'https://sites.google.com/view/ozdi-la/home',
    icon: Icons.verified_user_rounded,
    color: Color(0xFF2E7D32),
  ),
];

class MainDashboardScreen extends StatelessWidget {
  const MainDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        title: const Text(
          'ສູນລວມຄວາມຮູ້ວິຊາການ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: const BoxDecoration(
              color: Color(0xFF0D47A1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: const Text(
              'ເລືອກໝວດໝູ່ຄວາມຮູ້ວິຊາການທີ່ທ່ານຕ້ອງການສຶກສາ',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.90,
                ),
                itemCount: appCategories.length,
                itemBuilder: (context, index) {
                  final item = appCategories[index];
                  return Card(
                    elevation: 2,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WebViewScreen(initialCategory: item),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: item.color.withValues(alpha: 0.12),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(item.icon, size: 32, color: item.color),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              item.title,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              item.subtitle,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11.5,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
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
            if (mounted) {
              setState(() => isLoading = false);
            }
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
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
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
                      Icon(Icons.menu_book_rounded, color: Colors.white, size: 40),
                      SizedBox(height: 10),
                      Text(
                        'ໝວດໝູ່ຄວາມຮູ້ວິຊາການ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
