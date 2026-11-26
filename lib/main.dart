import 'package:flutter/material.dart';

void main() => runApp(const UpvcFactoryApp());

const navy = Color(0xFF17324D);
const teal = Color(0xFF168C87);
const bg = Color(0xFFF3F6F8);

class UpvcFactoryApp extends StatelessWidget {
  const UpvcFactoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UPVC Factory Pro',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: bg,
        colorScheme: ColorScheme.fromSeed(seedColor: teal),
        appBarTheme: const AppBarTheme(
          backgroundColor: navy, foregroundColor: Colors.white,
          centerTitle: false, elevation: 0,
        ),
        fontFamily: 'Roboto',
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('UPVC Factory Pro', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('إدارة المصنع والإنتاج', style: TextStyle(fontSize: 11, color: Colors.white70)),
          ]),
          actions: [
            IconButton(onPressed: () => _notice(context, 'الإشعارات ستُفعّل عند ربط النظام.'), icon: const Icon(Icons.notifications_none)),
          ],
        ),
        drawer: const AppDrawer(),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [navy, Color(0xFF285778)]),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('مرحباً بك', style: TextStyle(color: Colors.white70)),
                SizedBox(height: 6),
                Text('إدارة أعمال المصنع من مكان واحد', style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
                Text('نسخة أولية تجريبية — البيانات المعروضة توضيحية', style: TextStyle(color: Colors.white70, fontSize: 12)),
              ]),
            ),
            const SizedBox(height: 16),
            const Row(children: [
              Expanded(child: StatCard(title: 'طلبات جديدة', value: '—', icon: Icons.assignment_outlined)),
              SizedBox(width: 10),
              Expanded(child: StatCard(title: 'قيد التصنيع', value: '—', icon: Icons.precision_manufacturing_outlined)),
            ]),
            const SizedBox(height: 10),
            const Row(children: [
              Expanded(child: StatCard(title: 'جاهز للتسليم', value: '—', icon: Icons.task_alt)),
              SizedBox(width: 10),
              Expanded(child: StatCard(title: 'بانتظار المزامنة', value: '—', icon: Icons.sync)),
            ]),
            const SizedBox(height: 22),
            const Text('الوصول السريع', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: navy)),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 1.35,
              children: [
                QuickTile(icon: Icons.person_outline, title: 'العملاء', subtitle: 'بيانات العملاء', onTap: () => _open(context, const PlaceholderPage(title: 'العملاء', description: 'إضافة العملاء والبحث في بياناتهم.'))),
                QuickTile(icon: Icons.add_box_outlined, title: 'طلب جديد', subtitle: 'إدخال طلب تصنيع', onTap: () => _open(context, const NewOrderPage())),
                QuickTile(icon: Icons.window_outlined, title: 'المقاسات', subtitle: 'الأبواب والشبابيك', onTap: () => _open(context, const PlaceholderPage(title: 'المقاسات والتصميم', description: 'إدخال العرض والارتفاع ونوع الفتحة والتقسيمات.'))),
                QuickTile(icon: Icons.factory_outlined, title: 'متابعة الإنتاج', subtitle: 'مراحل التصنيع', onTap: () => _open(context, const PlaceholderPage(title: 'متابعة الإنتاج', description: 'متابعة الطلب من القص حتى التجميع والتسليم.'))),
                QuickTile(icon: Icons.content_cut, title: 'قوائم القص', subtitle: 'الكميات والهدر', onTap: () => _open(context, const PlaceholderPage(title: 'قوائم القص', description: 'ستُعرض هنا قوائم القص بعد ربط محرك الحسابات المعتمد.'))),
                QuickTile(icon: Icons.sync, title: 'المزامنة', subtitle: 'الاتصال بالكمبيوتر', onTap: () => _open(context, const PlaceholderPage(title: 'المزامنة', description: 'سيتم إعداد الربط الآمن مع نسخة الكمبيوتر في مرحلة لاحقة.'))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title, value;
  final IconData icon;
  const StatCard({super.key, required this.title, required this.value, required this.icon});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(icon, color: teal, size: 25), const SizedBox(height: 10),
      Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: navy)),
      Text(title, style: const TextStyle(fontSize: 12, color: Colors.black54)),
    ]),
  );
}

class QuickTile extends StatelessWidget {
  final IconData icon; final String title, subtitle; final VoidCallback onTap;
  const QuickTile({super.key, required this.icon, required this.title, required this.subtitle, required this.onTap});
  @override
  Widget build(BuildContext context) => InkWell(
    borderRadius: BorderRadius.circular(15), onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(icon, color: teal, size: 28), const SizedBox(height: 9),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: navy, fontSize: 15)),
        const SizedBox(height: 3), Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.black54)),
      ]),
    ),
  );
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) => Drawer(
    child: Directionality(textDirection: TextDirection.rtl, child: ListView(padding: EdgeInsets.zero, children: [
      const DrawerHeader(decoration: BoxDecoration(color: navy), child: Align(alignment: Alignment.bottomRight, child: Text('UPVC Factory Pro', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)))),
      _drawerItem(context, Icons.home_outlined, 'الرئيسية', const DashboardPage()),
      _drawerItem(context, Icons.people_outline, 'العملاء', const PlaceholderPage(title: 'العملاء', description: 'إدارة بيانات العملاء.')),
      _drawerItem(context, Icons.assignment_outlined, 'الطلبات', const PlaceholderPage(title: 'الطلبات', description: 'عرض ومتابعة الطلبات.')),
      _drawerItem(context, Icons.settings_outlined, 'الإعدادات', const PlaceholderPage(title: 'الإعدادات', description: 'إعدادات التطبيق والاتصال.')),
    ])),
  );
  Widget _drawerItem(BuildContext context, IconData icon, String title, Widget page) => ListTile(
    leading: Icon(icon), title: Text(title),
    onTap: () { Navigator.pop(context); if (page is! DashboardPage) _open(context, page); },
  );
}

class NewOrderPage extends StatefulWidget {
  const NewOrderPage({super.key});
  @override State<NewOrderPage> createState() => _NewOrderPageState();
}
class _NewOrderPageState extends State<NewOrderPage> {
  final customer = TextEditingController();
  final phone = TextEditingController();
  final width = TextEditingController();
  final height = TextEditingController();
  String type = 'شباك مفصلي';
  String opening = 'داخلي';
  @override
  void dispose() { customer.dispose(); phone.dispose(); width.dispose(); height.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: Scaffold(
      appBar: AppBar(title: const Text('إنشاء طلب جديد')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const Text('بيانات العميل', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: navy)),
        const SizedBox(height: 10),
        _field(customer, 'اسم العميل'),
        const SizedBox(height: 10), _field(phone, 'رقم الهاتف', keyboard: TextInputType.phone),
        const SizedBox(height: 22),
        const Text('بيانات المنتج', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: navy)),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: type, decoration: const InputDecoration(labelText: 'نوع المنتج', border: OutlineInputBorder()),
          items: ['شباك مفصلي', 'شباك سحاب', 'باب مفصلي', 'باب سحاب', 'Tilt & Turn'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (v) => setState(() => type = v ?? type),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: opening, decoration: const InputDecoration(labelText: 'اتجاه الفتح', border: OutlineInputBorder()),
          items: ['داخلي', 'خارجي', 'يمين', 'يسار', 'غير منطبق'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (v) => setState(() => opening = v ?? opening),
        ),
        const SizedBox(height: 10),
        Row(children: [
          Expanded(child: _field(width, 'العرض (مم)', keyboard: TextInputType.number)),
          const SizedBox(width: 10),
          Expanded(child: _field(height, 'الارتفاع (مم)', keyboard: TextInputType.number)),
        ]),
        const SizedBox(height: 18),
        FilledButton.icon(
          style: FilledButton.styleFrom(backgroundColor: teal, padding: const EdgeInsets.all(15)),
          onPressed: () => showDialog(context: context, builder: (_) => AlertDialog(
            title: const Text('تم إدخال البيانات التجريبية'),
            content: const Text('هذه النسخة تحفظ واجهة الإدخال فقط حالياً. لم يتم ربط قاعدة البيانات أو حسابات القص بعد.'),
            actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('حسناً'))],
          )),
          icon: const Icon(Icons.save_outlined), label: const Text('حفظ الطلب'),
        ),
      ]),
    ),
  );
  Widget _field(TextEditingController c, String label, {TextInputType keyboard = TextInputType.text}) =>
    TextField(controller: c, keyboardType: keyboard, decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()));
}

class PlaceholderPage extends StatelessWidget {
  final String title, description;
  const PlaceholderPage({super.key, required this.title, required this.description});
  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: Scaffold(appBar: AppBar(title: Text(title)), body: Center(
      child: Padding(padding: const EdgeInsets.all(28), child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.construction_outlined, size: 54, color: teal),
        const SizedBox(height: 16), Text(title, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: navy)),
        const SizedBox(height: 8), Text(description, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black54)),
        const SizedBox(height: 14), const Chip(label: Text('قيد التطوير')),
      ])),
    )),
  );
}

void _open(BuildContext context, Widget page) => Navigator.push(context, MaterialPageRoute(builder: (_) => page));
void _notice(BuildContext context, String message) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
