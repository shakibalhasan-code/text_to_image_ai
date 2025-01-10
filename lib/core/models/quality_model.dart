class Quality {
  final String name;
  final String imageUrl;

  Quality({required this.name, required this.imageUrl});

  // Static method to get the list of qualities
  static List<Quality> getQualityList() {
    return [
      Quality(
          name: 'Realistic',
          imageUrl:
              'https://ai-pro.org/wp-content/uploads/2024/01/dream-photo-hd-1.png'),
      Quality(
          name: 'Cartoon',
          imageUrl:
              'https://cdn.pixabay.com/photo/2023/04/04/14/19/boy-7899447_1280.jpg'),
      Quality(
          name: 'Art',
          imageUrl:
              'https://impossibleimages.ai/wp-content/uploads/2023/02/Ten-misconceptions-about-AI-generated-art.jpg'),
    ];
  }
}
