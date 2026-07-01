import 'package:flutter/material.dart';

// ── COLORS ────────────────────────────────────────────────────────────────────
const kCream = Color(0xFFF7F2EA);
const kBrown = Color(0xFF3A2A1A);
const kGold = Color(0xFFC89433);
const kGoldLight = Color(0xFFE0B85A);
const kMuted = Color(0xFF9A8A75);
const kWhite = Colors.white;

class MyNestScreen extends StatefulWidget {
  const MyNestScreen({super.key});

  @override
  State<MyNestScreen> createState() => _MyNestScreenState();
}

class _MyNestScreenState extends State<MyNestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(),
              const SizedBox(height: 16),
              _buildHeroCard(),
              const SizedBox(height: 18),
              _buildSavingsCard(),
              const SizedBox(height: 16),
              _buildContinueJourneyBtn(),
              const SizedBox(height: 18),
              _buildNextUnlockCard(),
              const SizedBox(height: 14),
              _buildDailyContributionCard(),
              const SizedBox(height: 14),
              _buildNextLevelCard(),
              const SizedBox(height: 22),
              _buildMilestonesHeader(),
              const SizedBox(height: 14),
              _buildMilestonesRow(),
              const SizedBox(height: 18),
              // _buildEuphonyCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMilestonesRow() {
    final milestones = [
      _Milestone('Pre-flight Day', Icons.flight_takeoff, true, false),
      _Milestone('First Night', Icons.nights_stay_outlined, true, false),
      _Milestone('On My Way', Icons.card_travel_outlined, false, true),
      _Milestone('Taking High', Icons.landscape_outlined, false, false),
      _Milestone('Taking High', Icons.landscape_outlined, false, false),

    ];

    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: milestones.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) => _milestoneCard(milestones[i]),
      ),
    );
  }

  Widget _milestoneCard(_Milestone m) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(18),
        border: m.isCurrent ? Border.all(color: kGold, width: 1.5) : null,
        boxShadow: _softShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: kCream,
                  shape: BoxShape.circle,
                ),
                child: Icon(m.icon, color: kGold, size: 20),
              ),
              if (m.isDone)
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: kGold,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, size: 11, color: kWhite),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            m.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: 11,
              fontWeight: m.isCurrent ? FontWeight.w700 : FontWeight.w600,
              color: m.isCurrent ? kGold : kBrown,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }




  Widget _buildMilestonesHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Milestones',
            style: TextStyle(fontSize:20, fontWeight: FontWeight.w800, color: kBrown),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'View all',
                style: TextStyle(fontSize: 18, color: kGold, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 2),
              Icon(Icons.chevron_right, size: 16, color: kGold),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNextLevelCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: _softShadow,
        ),
        child: Row(
          children: [
            Container(
              width:50,
              height:50,
              decoration: BoxDecoration(
                color: kCream,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.emoji_events_outlined, color: kGold, size: 25),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NEXT LEVEL',
                    style: TextStyle(
                      fontSize:18,
                      letterSpacing: 1.2,
                      color: kGold,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Gold Traveller',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: kBrown),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '₹33,000 more to level up',
                    style: TextStyle(fontSize: 16, color: kMuted),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: kMuted, size: 22),
          ],
        ),
      ),
    );
  }

  // ── TOP BAR ──────────────────────────────────────────────────────────────
  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back button
          Row(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Color(0xFF5A4A3A),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          SizedBox(width:40,),
          // Title + Subtitle
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/logo.png",
                height: 40,
              ),
              const SizedBox(height: 4),
              const Text(
                "MY NEST",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFA88535),
                  letterSpacing: 2.5,
                ),
              ),
              const Text(
                'Your dreams. Our wings.',
                style: TextStyle(
                  color: Color(0xFFB68B2D),
                  fontSize: 10,
                  letterSpacing: 1.8,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          // Nest Balance
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    'assets/NEST.png',
                    fit: BoxFit.fill,
                    width: 20,
                    height: 20,
                  ),
                ),
                const SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Nest Balance",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8C8883),
                      ),
                    ),
                    Text(
                      '₹2,45,000',
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2F2F2F),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xFFB68B2D),
                  size: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── HERO CARD ────────────────────────────────────────────────────────────
  Widget _buildHeroCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF8A8A92),
                const Color(0xFF5A5258),
                const Color(0xFF2A2422),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/universe.png',
                  fit: BoxFit.cover,
                ),
              ),
              // soft top fade
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.55),
                      ],
                      stops: const [0.3, 1.0],
                    ),
                  ),
                ),
              ),
              // Tag
              Positioned(
                top: 14,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.4)),
                  ),
                  child: const Text(
                    'CURRENT · DREAM',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 1.2,
                      color: kGold,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              // Progress ring top right
              Positioned(
                top:50,
                right: 16,
                child: SizedBox(
                  width: 140,   // Increased from 100
                  height: 140,  // Increased from 100
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: CircularProgressIndicator(
                          value: 0.68,
                          strokeWidth: 8, // Thicker circle
                          backgroundColor: Colors.white.withOpacity(0.25),
                          valueColor: const AlwaysStoppedAnimation(kGoldLight),
                        ),
                      ),
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '68%',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              color: kBrown,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Saved',
                            style: TextStyle(
                              fontSize: 18,
                              color: kBrown,
                            ),
                          ),
                          Text(
                            'Per Day',
                            style: TextStyle(
                              fontSize: 15,
                              color: kBrown,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),              // Bottom text content
              Positioned(
                left: 18,
                right: 18,
                bottom: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Japan',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              height: 1.0,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'SPRING ESCAPE',
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1.4,
                              color:Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '"If you stand still at the crossroads,\nthe sakura will find you."',
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              color: Colors.white.withOpacity(0.85),
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height:50),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.75),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Play icon circle
                                // Container(
                                //   width: 32,
                                //   height: 32,
                                //   decoration: BoxDecoration(
                                //     shape: BoxShape.circle,
                                //     border: Border.all(
                                //       color: const Color(0xFFA88535),
                                //       width: 2.5,
                                //     ),
                                //   ),
                                //   child: const Icon(
                                //     Icons.play_arrow_rounded,
                                //     color: Color(0xFFA88535),
                                //     size:25,
                                //   ),
                                // ),

                                const SizedBox(width: 10),

                                const Text(
                                  "View Dream",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFA88535),
                                    letterSpacing: 0.3,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward,color: Color(0xFFA88535), size:25),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── SAVINGS CARD ─────────────────────────────────────────────────────────
  Widget _buildSavingsCard() {
    final steps = [
      ('Pre-Flight', true),
      ('First Night', true),
      ('On My Way', false), // current — special icon
      ('Taking Flight', false),
      ('Around There', false),
      ('Next Stop', false),
      ('Rest Day', false),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(22),
          boxShadow: _softShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PROGRESS TO JAPAN',
                      style: TextStyle(
                        fontSize:20,
                        letterSpacing: 1.2,
                        color: kMuted,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      '₹1,67,000',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: kBrown,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'of ₹2,45,000 goal',
                      style: TextStyle(fontSize: 15, color: kMuted),
                    ),
                  ],
                ),
                // SizedBox(
                //   width: 90,
                //   height: 90,
                //   child: Stack(
                //     alignment: Alignment.center,
                //     children: [
                //       SizedBox(
                //         width: 80,
                //         height: 80,
                //         child: CircularProgressIndicator(
                //           value: 0.68,
                //           strokeWidth: 6,
                //           backgroundColor: kCream,
                //           valueColor: const AlwaysStoppedAnimation(kGold),
                //         ),
                //       ),
                //       const Text(
                //         '68%',
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.w800,
                //           color: kBrown,
                //         ),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
            const SizedBox(height: 16),
            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: 0.68,
                minHeight: 8,
                backgroundColor: kCream,
                valueColor: const AlwaysStoppedAnimation(kGold),
              ),
            ),
            const SizedBox(height: 18),
            // Journey stepper
            Row(
              children: List.generate(steps.length, (i) {
                final step = steps[i];
                final isDone = step.$2 == true;
                final isCurrent = step.$2 == null;
                return Expanded(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          if (i != steps.length - 1)
                            Positioned(
                              left: 14,
                              right: -14,
                              child: Container(
                                height: 1.5,
                                color: isDone ? kGold : kCream,
                              ),
                            ),
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isDone
                                  ? kGold
                                  : isCurrent
                                  ? Colors.transparent
                                  : kCream,
                              gradient: isCurrent
                                  ? const LinearGradient(
                                colors: [Color(0xFFE85D8A), Color(0xFFFFA552)],
                              )
                                  : null,
                            ),
                            child: Icon(
                              isDone
                                  ? Icons.check
                                  : isCurrent
                                  ? Icons.flight_takeoff
                                  : Icons.circle,
                              size: isDone || isCurrent ? 14 : 6,
                              color: isDone || isCurrent ? kWhite : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        step.$1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: isDone || isCurrent ? kBrown : kMuted,
                          fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // ── CONTINUE JOURNEY BUTTON ──────────────────────────────────────────────
  Widget _buildContinueJourneyBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: kBrown,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: kBrown.withOpacity(0.3),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Progress Details',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: kWhite),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, size: 16, color: kWhite),
          ],
        ),
      ),
    );
  }

  // ── NEXT UNLOCK CARD ─────────────────────────────────────────────────────
  Widget _buildNextUnlockCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: _softShadow,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF1A3A2A), Color(0xFF0A1F15)],
                  ),
                ),
                child: const Icon(Icons.lock_outline, color: kGoldLight, size: 25),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NEXT UNLOCK',
                    style: TextStyle(fontSize: 18, color: kMuted, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Iceland',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: kBrown),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: List.generate(5, (i) {
                      return Icon(
                        Icons.star,
                        size: 25,
                        color: i < 4 ? kGold : kCream,
                      );
                    }),
                  ),
                ],
              ),
            ),
            const Text(
              '₹1,000\nmore to unlock',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16, color: kMuted, fontWeight: FontWeight.w600, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }

  // ── DAILY CONTRIBUTION CARD ──────────────────────────────────────────────
  Widget _buildDailyContributionCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: _softShadow,
        ),
        child: Row(
          children: [
            Container(
              width:50,
              height:50,
              decoration: BoxDecoration(
                color: kCream,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.wb_sunny_outlined, color: kGold, size: 25),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DAILY CONTRIBUTION',
                    style: TextStyle(fontSize: 18, color: kMuted, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    '₹1,000 / day',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: kBrown),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'On track · 28 days remaining',
                    style: TextStyle(fontSize: 16, color: kMuted),
                  ),
                ],
              ),
            ),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: kCream,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: kBrown, size: 18),
            ),
          ],
        ),
      ),
    );
  }

  // ── BOTTOM NAV ───────────────────────────────────────────────────────────
  Widget _buildBottomNav() {
    final items = [
      (Icons.home_outlined, 'Nest', true),
      (Icons.language_outlined, 'Globe', false),
      (Icons.menu_book_outlined, 'Journeys', false),
      (Icons.people_outline, 'Flocks', false),
      (Icons.person_outline, 'Profile', false),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: kCream,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -2)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            final isActive = item.$3;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(item.$1, size: 22, color: isActive ? kGold : kMuted),
                const SizedBox(height: 4),
                Text(
                  item.$2,
                  style: TextStyle(
                    fontSize: 10,
                    color: isActive ? kGold : kMuted,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  List<BoxShadow> get _softShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.06),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];
}


class _Milestone {
  final String title;
  final IconData icon;
  final bool isDone;
  final bool isCurrent;
  const _Milestone(this.title, this.icon, this.isDone, this.isCurrent);
}