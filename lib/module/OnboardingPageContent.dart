class OnboardingPageContent {
  final String? logoURL;
  final String? imageURL;
  final String? heading;
  final String? subHeading;

  OnboardingPageContent({
    required this.logoURL,
    required this.imageURL,
    required this.heading,
    required this.subHeading,
  });
}

final List<OnboardingPageContent> onboardingData = [
  OnboardingPageContent(
    logoURL: "assets/images/light/logo.png",
    imageURL: "assets/images/light/image1.png",
    heading: "Everything You Need In One Place",
    subHeading:
        "No more wasting time and energy searching for the news you want.",
  ),
  OnboardingPageContent(
    logoURL: "assets/images/light/logo.png",
    imageURL: "assets/images/light/image2.png",
    heading: "Smart Filtering",
    subHeading:
        "With our smart filtering features you can organize your feed to fit your needs.",
  ),
  OnboardingPageContent(
    logoURL: "assets/images/light/logo.png",
    imageURL: "assets/images/light/image6.png",
    heading: "Personalized Content",
    subHeading: "News feed personalized accoding to your preference.",
  ),
];
