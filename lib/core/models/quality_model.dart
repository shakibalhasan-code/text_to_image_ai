import 'package:simple_image_genarator/utils/cons.dart';
import 'package:stability_image_generation/stability_image_generation.dart';

class Quality {
  final String name;
  final String imageUrl;
  final ImageAIStyle style;

  Quality({required this.name, required this.imageUrl, required this.style});

  static List<Quality> getQualityList() {
    return [
      Quality(name: 'Anime', imageUrl: imageAnime, style: ImageAIStyle.anime),
      Quality(
          name: 'Detailed',
          imageUrl: imageDetailed,
          style: ImageAIStyle.moreDetails),
      Quality(
          name: 'Cyberpunk',
          imageUrl: imageCyberpunk,
          style: ImageAIStyle.cyberPunk),
      Quality(
          name: 'Kandinsky Painter',
          imageUrl: imageKandinsky,
          style: ImageAIStyle.kandinskyPainter),
      Quality(
          name: 'Aivazovsky Painter',
          imageUrl: imageAvazovskyAvif,
          style: ImageAIStyle.aivazovskyPainter),
      Quality(
          name: 'Malevich Painter',
          imageUrl: imageMalevich,
          style: ImageAIStyle.malevichPainter),
      Quality(
          name: 'Picasso Painter',
          imageUrl: imagePicasso,
          style: ImageAIStyle.picassoPainter),
      Quality(
          name: 'Goncharova Painter',
          imageUrl: imageGoncharova,
          style: ImageAIStyle.goncharovaPainter),
      Quality(
          name: 'Classicism',
          imageUrl: imageClassicism,
          style: ImageAIStyle.classicism),
      Quality(
          name: 'Renaissance',
          imageUrl: imageRenaissance,
          style: ImageAIStyle.renaissance),
      Quality(
          name: 'Oil Painting',
          imageUrl: imageOilpaintingJpg,
          style: ImageAIStyle.oilPainting),
      Quality(
          name: 'Pencil Drawing',
          imageUrl: imagePencil,
          style: ImageAIStyle.pencilDrawing),
      Quality(
          name: 'Digital Painting',
          imageUrl: imageDigitalPainting,
          style: ImageAIStyle.digitalPainting),
      Quality(
          name: 'Medieval Style',
          imageUrl: imageMedieval,
          style: ImageAIStyle.medievalStyle),
      Quality(
          name: '3D Rendering',
          imageUrl: image3d,
          style: ImageAIStyle.render3D),
      Quality(
          name: 'Cartoon', imageUrl: imageCartoon, style: ImageAIStyle.cartoon),
      Quality(
          name: 'Soviet Cartoon',
          imageUrl: imageSoviet,
          style: ImageAIStyle.sovietCartoon),
      Quality(
          name: 'Studio Photo',
          imageUrl: imageStudio,
          style: ImageAIStyle.studioPhoto),
      Quality(
          name: 'Portrait Photo',
          imageUrl: imagePortrait,
          style: ImageAIStyle.portraitPhoto),
      Quality(
          name: 'Khokhloma Painter',
          imageUrl: imageKhokhloma,
          style: ImageAIStyle.khokhlomaPainter),
      Quality(
          name: 'Christmas',
          imageUrl: imageChristmas,
          style: ImageAIStyle.christmas),
    ];
  }

  static Quality? getQualityByName(String name) {
    return getQualityList().firstWhere((quality) => quality.name == name,
        orElse: () =>
            Quality(name: '', imageUrl: '', style: ImageAIStyle.anime));
  }
}
