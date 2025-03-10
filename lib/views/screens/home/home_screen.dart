import 'dart:typed_data';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heroicons/heroicons.dart';
import 'package:simple_image_genarator/core/models/quality_model.dart';
import 'package:simple_image_genarator/core/services/my_shared_preference.dart';
import 'package:simple_image_genarator/getx/image_generate_state.dart';
import 'package:simple_image_genarator/utils/style.dart';
import 'package:simple_image_genarator/views/glob_widgets/gradiunt_container.dart';
import 'package:simple_image_genarator/views/screens/home/items/quality_item.dart';
import 'package:stability_image_generation/stability_image_generation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImageGenerateState _imageGenerateState = Get.put(ImageGenerateState());
  final MySharedServices _sharedServices = Get.put(MySharedServices());

  final TextEditingController promptController = TextEditingController();

  final List<Quality> qualityList = Quality.getQualityList();
  final List<String> resoList = [
    '16:9',
    '1:1',
    '21:9',
    '2:3',
    '3:2',
    '4:5',
    '5:4',
    '9:16',
    '9:21'
  ];

  String selectedResolution = '1:1';
  String selectedQuality = 'Anime';
  ImageAIStyle _imageAIStyle = ImageAIStyle.anime;

  final _key = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    promptController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      // floatingActionButton: InkWell(
      //   borderRadius: BorderRadius.circular(50),
      //   onTap: (){
      //
      //   },
      //   child: CircleAvatar(
      //     radius: 20,
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.circular(50),
      //       child: Image(
      //         height: 60,
      //         width: 60,
      //           image: NetworkImage('https://gifdb.com/images/high/color-wheel-pixel-art-jg040923kswcmf9v.gif')),
      //     ),
      //   ),
      // ),
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
                            style: titleText,
                          ),
                          const Spacer(),
                          Obx((){
                            return _sharedServices.isLoading.value ? Center(child: CircularProgressIndicator(),) : Container(
                              decoration: BoxDecoration(
                                  color: secondaryColor.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: (){

                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      HeroIcon(HeroIcons.percentBadge,color: Colors.white,size: 18,),
                                      const SizedBox(width: 5),
                                      Text(_sharedServices.userPoint.value.toString(),style: bodyText.copyWith(color: Colors.white,fontWeight: FontWeight.bold))
                                    ],),
                                ),
                              ),
                            );

                          }),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Form(
                        key: _key,
                          child: TextFormField(
                        controller: promptController,
                        maxLines: 4,
                        onChanged: (text){
                          if(text.isEmpty){
                            return;
                          }
                        },

                        validator: (value){
                          if(value ==null || value.isEmpty){
                            return 'enter something..';
                          }
                          return null;
                        },
                        decoration: InputDecoration(

                          hintText: 'Write something...',
                          hintStyle: bodyText.copyWith(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white10,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),

                        ),

                      )),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Obx(() {
                  return _imageGenerateState.isLoading.value
                      ? SizedBox(
                          width: double.infinity,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                FadeAnimatedText('Getting prompt..'),
                                FadeAnimatedText('Sending Data..'),
                                FadeAnimatedText('Generating Image..'),
                              ],
                              onTap: () {
                                print("Tap Event");
                              },
                            ),
                          ),
                        )
                      : _imageGenerateState.generatedImage.value != null
                          ? Column(
                              children: [
                                Image.memory(
                                    _imageGenerateState.generatedImage.value!),
                                ElevatedButton(onPressed: () async {
                                  await _imageGenerateState
                                      .saveImageToGallery();
                                }, child: Obx(() {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      _imageGenerateState.isDownloading.value
                                          ? SizedBox()
                                          : HeroIcon(
                                              HeroIcons.arrowDown,
                                              size: 24,
                                              color: Colors.white,
                                            ),
                                      const SizedBox(width: 10),
                                      Text(
                                        _imageGenerateState.isDownloading.value
                                            ? 'Saving..'
                                            : 'Save to Gallery',
                                        style: titleText,
                                      ),
                                    ],
                                  );
                                }))
                              ],
                            )
                          : const Text(
                              'No image generated yet',
                              style: TextStyle(color: Colors.white),
                            );
                }),
                const SizedBox(height: 20),
                generate_body(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column generate_body(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose Quality',
          style: titleText,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: qualityList.length,
            itemBuilder: (context, index) {
              final quality = qualityList[index];
              _imageAIStyle = quality.style;
              final isSelected = quality.name == selectedQuality;

              return QualityItem(
                onTap: () {
                  setState(() {
                    selectedQuality = quality.name;
                  });
                },
                isSelected: isSelected,
                imageUrl: quality.imageUrl,
                name: quality.name,
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Resolution',
          style: titleText,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? secondaryColor : Colors.white10,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: isSelected ? secondaryColor : Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      reso,
                      style: titleText.copyWith(
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
            onPressed: () async{
              if(_key.currentState!.validate()){
                print('proccesing');
                final prompt = promptController.text.trim();
                if (prompt.isNotEmpty &&
                    selectedQuality.isNotEmpty &&
                    selectedResolution.isNotEmpty) {
                  await _imageGenerateState.generate(
                      prompt, _imageAIStyle, selectedResolution);
                } else {
                  Get.snackbar('Empty Fields', 'Please fill up all fields');
                }
              }else{
                return;
              }
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
                  style: titleText,
                ),
              ],
            ),
          ),
        ),

        // SizedBox(
        //   width: double.infinity,
        //   child: TextButton(onPressed: (){}, child: Text('Get More Credit Now',style: bodyText.copyWith(fontSize: 12))),
        // )
      ],
    );
  }
}
