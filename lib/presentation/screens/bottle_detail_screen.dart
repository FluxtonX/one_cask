import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_cask/models/bottle.dart';
import 'package:one_cask/pallete.dart';

class BottleDetailScreen extends StatelessWidget {
  final Bottle bottle;

  const BottleDetailScreen({super.key, required this.bottle});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Pallete.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    Text(
                      'Genesis Collection',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/${bottle.image}',
                        height: 300,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(24),
                        color: const Color(0XFF122329),
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bottle ${bottle.details.bottle}',
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${bottle.name} ${bottle.year} Year old',
                              style: GoogleFonts.ebGaramond(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Pallete.yellowColor,
                              ),
                            ),
                            Text(
                              '#${bottle.cask}',
                              style: GoogleFonts.ebGaramond(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Pallete.yellowColor,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0E1C21),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TabBar(
                                dividerColor: Colors.transparent,
                                indicatorColor: Colors.transparent,
                                indicatorSize: TabBarIndicatorSize.tab,
                                labelColor: Colors.black,
                                unselectedLabelColor: const Color(0xFFCCCCCC),
                                indicator: BoxDecoration(
                                  color: Pallete.yellowColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                isScrollable: false,
                                labelPadding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                tabs: const [
                                  Tab(
                                    child: Text(
                                      'Details',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Tasting notes',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'History',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              height: 400,
                              child: TabBarView(
                                children: [
                                  ListView(
                                    padding: EdgeInsets.zero,
                                    children: [
                                      _buildDetailItem(
                                          'Distillery', bottle.distillery),
                                      _buildDetailItem('Region', bottle.region),
                                      _buildDetailItem(
                                          'Country', bottle.country),
                                      _buildDetailItem('Type', bottle.type),
                                      _buildDetailItem(
                                          'Age statement', bottle.ageStatement),
                                      _buildDetailItem('Filled', bottle.filled),
                                      _buildDetailItem(
                                          'Bottled', bottle.bottled),
                                      _buildDetailItem(
                                          'Cask number', bottle.caskNumber),
                                      _buildDetailItem('ABV', bottle.abv),
                                      _buildDetailItem('Size', bottle.size),
                                      _buildDetailItem('Finish', bottle.finish),
                                    ],
                                  ),
                                  ListView(
                                    padding: EdgeInsets.zero,
                                    children: [
                                      Container(
                                        color: Pallete.botomBarColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 100),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            size: 50,
                                            Icons.play_arrow_rounded,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        'Tasting notes\nby Charles MacLean MBE',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white70,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 10),
                                      _buildTastingItem('Nose',
                                          bottle.details.tastingNotes.nose),
                                      _buildTastingItem('Palate',
                                          bottle.details.tastingNotes.palate),
                                      _buildTastingItem('Finish',
                                          bottle.details.tastingNotes.finish),
                                      const SizedBox(height: 20),
                                      const Text(
                                        'Your notes',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white70,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      _buildTastingItem('Nose',
                                          bottle.details.tastingNotes.yourNose),
                                      _buildTastingItem(
                                          'Palate',
                                          bottle
                                              .details.tastingNotes.yourPalate),
                                      _buildTastingItem(
                                          'Finish',
                                          bottle
                                              .details.tastingNotes.yourFinish),
                                    ],
                                  ),
                                  ListView(
                                    padding: EdgeInsets.zero,
                                    children: bottle.history
                                        .map((entry) => _buildHistoryItem(
                                              entry.title,
                                              entry.description,
                                              entry.attachments,
                                            ))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Pallete.yellowColor,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              '+ Add to my collection',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
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

  Widget _buildDetailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTastingItem(String category, List<String> descriptions) {
    return Container(
      color: const Color(0xFF0E1C21),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: GoogleFonts.ebGaramond(
              fontSize: 22,
              color: const Color(0XFFE7E9EA),
              fontWeight: FontWeight.w500,
            ),
          ),
          ...descriptions.map((desc) => Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  desc,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(
      String title, String description, List<String> attachments) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            color: Pallete.botomBarColor,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.attach_file,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Attachments',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: attachments
                      .map((attachment) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              width: 90,
                              height: 90,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  attachment,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
