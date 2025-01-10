import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:simple_image_genarator/core/models/quality_model.dart';
import 'package:simple_image_genarator/utils/style.dart';
import 'package:simple_image_genarator/views/glob_widgets/gradiunt_container.dart';
import 'package:simple_image_genarator/views/screens/home/items/quality_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Quality> qualityList = Quality.getQualityList();
  final List<String> resoList = ['512x512', '1024x1024'];
  String selectedResolution = '512x512';
  final TextEditingController promptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                GradientContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          HeroIcon(HeroIcons.sparkles,
                              size: 22, color: foregroundColor),
                          const SizedBox(width: 10),
                          Text(
                            'Write Your Prompt Here',
                            style: titleBoldText.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: promptController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Write something...',
                          hintStyle: titleBoldText.copyWith(
                              fontSize: 14, color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white10,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Choose Quality',
                  style:
                      titleBoldText.copyWith(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: qualityList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final quality = qualityList[index];
                      return QualityItem(
                        imageUrl: quality.imageUrl,
                        name: quality.name,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Resolution',
                  style:
                      titleBoldText.copyWith(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: resoList.length,
                    itemBuilder: (context, index) {
                      final reso = resoList[index];
                      final isSelected = selectedResolution == reso;
                      return GestureDetector(
                        onTap: () => setState(() {
                          selectedResolution = reso;
                        }),
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? secondaryColor : Colors.white10,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color:
                                    isSelected ? secondaryColor : Colors.grey),
                          ),
                          child: Center(
                            child: Text(
                              reso,
                              style: titleBoldText.copyWith(
                                fontSize: 16,
                                color: isSelected ? Colors.white : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: size.width,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Handle Generate button press
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeroIcon(
                          HeroIcons.sparkles,
                          size: 24,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Generate Now',
                          style: titleBoldText.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
