import 'dart:html' as html;
import 'package:flutter/material.dart';

void main() => runApp(const App());
const bg = Color(0xff080a0e),
    panel = Color(0xff11151c),
    lime = Color(0xffcfff5b),
    muted = Color(0xffa8adb6),
    line = Color(0xff2b3038);
void open(String u) => html.window.open(u, '_blank');

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext c) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Yatheendra Panchumarthi',
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: bg,
      colorScheme: const ColorScheme.dark(primary: lime),
    ),
    home: const Home(),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final keys = List.generate(5, (_) => GlobalKey());
  late AnimationController a;
  @override
  void initState() {
    super.initState();
    a = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
    )..forward();
  }

  void go(int i) {
    final c = keys[i].currentContext;
    if (c != null)
      Scrollable.ensureVisible(c, duration: const Duration(milliseconds: 650));
  }

  @override
  Widget build(BuildContext c) => Scaffold(
    body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              header(),
              hero(),
              projects(),
              experience(),
              skills(),
              capstone(),
              contact(),
            ],
          ),
        ),
        IgnorePointer(
          child: AnimatedBuilder(
            animation: a,
            builder: (c, _) {
              if (a.isCompleted) return const SizedBox();
              final t = a.value;
              return Opacity(
                opacity:
                    (t < .25
                            ? t / .25
                            : t > .72
                            ? (1 - t) / .28
                            : 1.0)
                        .clamp(0.0, 1.0)
                        .toDouble(),
                child: Container(
                  color: bg,
                  alignment: Alignment.center,
                  child: const Logo(big: true),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
  Widget header() => Container(
    height: 78,
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1180),
        child: Row(
          children: [
            const Logo(),
            const SizedBox(width: 12),
            const Text(
              'Yatheendra Panchumarthi',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
            ),
            const Spacer(),
            if (MediaQuery.sizeOf(context).width > 800)
              for (final x in [
                ('Home', 0),
                ('Work', 1),
                ('Experience', 2),
                ('Skills', 3),
              ])
                TextButton(onPressed: () => go(x.$2), child: Text(x.$1)),
            FilledButton(onPressed: () => go(4), child: const Text('Contact')),
          ],
        ),
      ),
    ),
  );
  Widget hero() {
    final d = MediaQuery.sizeOf(context).width > 900;
    return Section(
      key: keys[0],
      child: Column(
        children: [
          Flex(
            direction: d ? Axis.horizontal : Axis.vertical,
            children: [
              Expanded(
                flex: d ? 11 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Label('FULL STACK MOBILE DEVELOPER · AI GENERALIST'),
                    const SizedBox(height: 22),
                    Text(
                      'I engineer products\npeople rely on.',
                      style: TextStyle(
                        fontSize: d ? 68 : 44,
                        height: .98,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -3,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'I’m Yatheendra Panchumarthi—a product-minded engineer building fast, dependable mobile and web experiences across EdTech, energy, healthcare, and commerce.',
                      style: TextStyle(
                        color: muted,
                        fontSize: 19,
                        height: 1.55,
                      ),
                    ),
                    const SizedBox(height: 28),
                    FilledButton(
                      onPressed: () => go(1),
                      child: const Text('Explore selected work ↘'),
                    ),
                  ],
                ),
              ),
              SizedBox(width: d ? 55 : 0, height: d ? 0 : 40),
              Expanded(
                flex: d ? 7 : 0,
                child: AspectRatio(
                  aspectRatio: .78,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      border: Border.all(color: lime, width: 2),
                      borderRadius: BorderRadius.circular(250),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(230),
                      child: Image.asset(
                        'assets/yatheendra.png',
                        fit: BoxFit.cover,
                        alignment: const Alignment(0, -.2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 55),
          Wrap(
            children: [
              for (final x in [
                ('5+', 'years building'),
                ('5K+', 'learners reached'),
                ('60%', 'faster loading'),
                ('45%', 'fewer crashes'),
              ])
                SizedBox(
                  width: d ? 280 : MediaQuery.sizeOf(context).width / 2 - 24,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: line)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          x.$1,
                          style: const TextStyle(
                            fontSize: 31,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(x.$2, style: const TextStyle(color: muted)),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget projects() {
    final data = [
      (
        'LearnFromMaps',
        'Cross-platform EdTech, progress tracking and AI workflows.',
        '5,000+',
      ),
      (
        'Renewable monitoring',
        'Real-time energy dashboards across 12+ installations.',
        '30%',
      ),
      (
        'Customer systems',
        'Payments, maps, scheduling and healthcare records.',
        '20%',
      ),
    ];
    return Section(
      key: keys[1],
      border: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Heading(
            '01 · SELECTED WORK',
            'Products engineered for real-world impact.',
          ),
          const SizedBox(height: 35),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              for (final x in data)
                Container(
                  width: MediaQuery.sizeOf(context).width > 900
                      ? 370
                      : MediaQuery.sizeOf(context).width - 48,
                  height: 320,
                  padding: const EdgeInsets.all(26),
                  decoration: BoxDecoration(
                    color: panel,
                    border: Border.all(color: line),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Label('SELECTED PRODUCT'),
                      const SizedBox(height: 28),
                      Text(
                        x.$1,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        x.$2,
                        style: const TextStyle(color: muted, height: 1.5),
                      ),
                      const Spacer(),
                      Text(
                        x.$3,
                        style: const TextStyle(
                          color: lime,
                          fontSize: 44,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget experience() => Section(
    key: keys[2],
    border: true,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading(
          '02 · EXPERIENCE',
          'Five years of shipping, optimizing, and leading.',
        ),
        const SizedBox(height: 30),
        for (final x in [
          (
            '2024 — Present',
            'Full Stack Mobile Developer (Principal)',
            'Heera Edutech Private Limited',
          ),
          ('2023 — 2024', 'Senior Software Developer', 'BitsSens Technologies'),
          ('2021 — 2022', 'Software Engineer', 'Irax Tech Private Limited'),
        ])
          ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            title: Text(
              x.$2,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            subtitle: Text(x.$3, style: const TextStyle(color: lime)),
            trailing: Text(x.$1, style: const TextStyle(color: muted)),
          ),
      ],
    ),
  );
  Widget skills() => Section(
    key: keys[3],
    border: true,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading('03 · CAPABILITIES', 'From interface to infrastructure.'),
        const SizedBox(height: 30),
        for (final x in [
          ('Mobile', 'Flutter, Dart, Android, iOS, GetX, BLoC'),
          (
            'Backend & data',
            'REST APIs, Firebase, GCP, SQL, SQLite, Drift ORM',
          ),
          (
            'AI & automation',
            'Prompt engineering, Custom GPTs, LLM workflows, MCP',
          ),
          (
            'Engineering',
            'Architecture, performance, CI/CD, Agile, mentorship',
          ),
        ])
          ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            title: Text(
              x.$1,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            subtitle: Text(x.$2, style: const TextStyle(color: muted)),
          ),
      ],
    ),
  );
  Widget capstone() => Container(
    color: lime,
    child: const Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '04 · AI/ML CAPSTONE',
            style: TextStyle(color: bg, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 18),
          Text(
            'Zepto Data & AI Platform',
            style: TextStyle(
              color: bg,
              fontSize: 50,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Python ETL, SQLite analytics, model evaluation, and semantic policy retrieval with MiniLM, Chroma, LangGraph, and FastAPI.',
            style: TextStyle(color: bg, fontSize: 18, height: 1.5),
          ),
        ],
      ),
    ),
  );
  Widget contact() => Section(
    key: keys[4],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label('AVAILABLE FOR IMPACTFUL WORK'),
        const SizedBox(height: 18),
        const Text(
          'Let’s build something\npeople rely on.',
          style: TextStyle(
            fontSize: 50,
            height: .98,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          children: [
            FilledButton(
              onPressed: () => open('mailto:yatheendra97@gmail.com'),
              child: const Text('yatheendra97@gmail.com ↗'),
            ),
            OutlinedButton(
              onPressed: () => open('https://github.com/Yatheendra379'),
              child: const Text('GitHub ↗'),
            ),
          ],
        ),
        const SizedBox(height: 55),
        const Divider(color: line),
        const Text(
          '© 2026 Yatheendra Panchumarthi',
          style: TextStyle(color: muted),
        ),
      ],
    ),
  );
}

class Logo extends StatelessWidget {
  const Logo({super.key, this.big = false});
  final bool big;
  @override
  Widget build(BuildContext c) {
    final s = big ? 126.0 : 42.0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: s,
          height: s,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: lime, width: 2),
            borderRadius: BorderRadius.circular(s * .27),
          ),
          child: Text(
            'YP',
            style: TextStyle(
              color: lime,
              fontSize: s * .38,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        if (big) ...[
          const SizedBox(height: 18),
          const Text(
            'YATHEENDRA PANCHUMARTHI',
            style: TextStyle(color: muted, letterSpacing: 4),
          ),
        ],
      ],
    );
  }
}

class Section extends StatelessWidget {
  const Section({super.key, required this.child, this.border = false});
  final Widget child;
  final bool border;
  @override
  Widget build(BuildContext c) => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 86),
    decoration: BoxDecoration(
      border: border ? const Border(top: BorderSide(color: line)) : null,
    ),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1180),
        child: child,
      ),
    ),
  );
}

class Label extends StatelessWidget {
  const Label(this.t, {super.key});
  final String t;
  @override
  Widget build(BuildContext c) => Text(
    t,
    style: const TextStyle(
      color: lime,
      fontSize: 12,
      fontWeight: FontWeight.w800,
      letterSpacing: 1.4,
    ),
  );
}

class Heading extends StatelessWidget {
  const Heading(this.k, this.t, {super.key});
  final String k, t;
  @override
  Widget build(BuildContext c) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Label(k),
      const SizedBox(height: 16),
      Text(
        t,
        style: const TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.w900,
          letterSpacing: -2,
        ),
      ),
    ],
  );
}
