// ignore_for_file: file_names

class HomeContainer {
  final String? avatorImagURL;
  final String? name;
  final String? time;
  final String? imagURL;
  final String? title;
  final String? note;
  final String? numbers;

  HomeContainer({
    this.avatorImagURL,
    this.name,
    this.time,
    this.imagURL,
    this.title,
    this.note,
    this.numbers,
  });
}

class MegazinContainer {
  final String? avatorImagURL;
  final String? name;
  final String? time;
  final String? imagURL;
  final String? downSize;
  final String? numbers;

  MegazinContainer({
    this.avatorImagURL,
    this.name,
    this.time,
    this.imagURL,
    this.downSize,
    this.numbers,
  });
}

class ChannelCatagories {
  final String? imagURL;
  final String? name;

  ChannelCatagories({this.imagURL, this.name});
}

final List<String> label_1 = [
  "For You",
  "Treading",
  "Politics",
  "Business",
  "Sports",
  "Art",
  "Entertainments",
];
final List<String> listOfPreferance = [
  "Politics",
  "Business",
  "Sports",
  "Healths",
  "Technologys",
  "Entertainments",
];

final List<String> label_2 = [
  "Magazine",
  "NewsPaper",
  "Article",
];

final List<String> displayType = [
  "Light Mode",
  "Dark Mode",
  "System Mode",
];

final List<String> label_3 = [
  "Saved",
  "Recent",
  "Subscribed",
];
final List<String> label_4 = [
  "All",
  "Politics",
  "Business",
  "Sports",
  "Art",
  "Entertainments",
  "Treading",
];

List<HomeContainer> container_1 = [
  HomeContainer(
    avatorImagURL: "assets/images/logo/walta_.png",
    name: "Walta",
    time: "Published 1h ago",
    imagURL: "assets/images/images_7.png",
    title: "Ethiopia, DP World Agrees to Enhance Logistic Sector",
    note:
        "Minister of Transport and Logistics, Dagmawit Moges held a discussion"
        "with DP World chairman and CEO Sultan Ahmed Bin Sulayem.The two discussed "
        "the progress of the countries’ joint initiatives and agreed on ways of "
        "enhancing cooperation in the logistics sector.",
    numbers: "121",
  ),
  HomeContainer(
    avatorImagURL: "assets/images/logo/nahoo_.png",
    name: "Nahoo",
    time: "Published 7h ago",
    imagURL: "assets/images/images_6.png",
    title: "China Donates 2.2 Mln Doses COVID Vaccines to Ethiopia",
    note:
        "Minister of Health, Dr. Lia Tadesse, and Chinese Ambassador to Ethiopia,"
        "Zhao Zhiyuan signed a Memorandum of Understanding for a handover of 2.2 million "
        "doses of Sino-pharm COVID-19 vaccines to the People and Government of China "
        "have donated to Ethiopia.",
    numbers: "2",
  ),
  HomeContainer(
    avatorImagURL: "assets/images/logo/nahoo_.png",
    name: "LinkUp",
    time: "Published 7h ago",
    imagURL: "assets/images/images_1.png",
    title: "Longest Lunar Eclipse in Centuries Coming",
    note:
        "The peak of the partial eclipse will take place in the predawn hours "
        "on Friday when 97% of the moon will be eclipsed by the Earth’s shadow. "
        "The previous longest partial eclipse took place in 2018 and lasted less than "
        "two hours, while this will last for several hours.",
    numbers: "32",
  ),
  HomeContainer(
    avatorImagURL: "assets/images/logo/nahoo_.png",
    name: "Reporter",
    time: "Published 7h ago",
    imagURL: "assets/images/images_2.png",
    title: "Ethiopia Plans to Build African e-commerce Logistics Hub",
    note:
        "The continent’s largest airline is considering an order for about five "
        "Boeing 777 freighters and may also take upcoming Airbus SE A350s, CEO Tewolde "
        "GebreMariam said in an interview. The carrier is also looking to expand its"
        "cargo operations in Addis Ababa and hire new people, he said.",
    numbers: "212",
  ),
  HomeContainer(
    avatorImagURL: "assets/images/logo/nahoo_.png",
    name: "Capital",
    time: "Published 7h ago",
    imagURL: "assets/images/images_3.png",
    title: "To End Ethiopia’s War, Biden Needs to Correct Course",
    note:
        "The Biden Administration needs to correct course to end Ethiopia’s war,"
        "Senior Fellow Bronwyn Bruton and International Security Professor "
        "Ann Fitz-Gerald wrote on “Foreign Policy”.",
    numbers: "276",
  ),
];

List<HomeContainer> container_2 = [
  HomeContainer(
    avatorImagURL: "assets/images/logo/cnn.png",
    name: "CNN",
    time: "Published 1h ago",
    imagURL: "assets/images/images_5.png",
    title:
        "University of Rhode Island revokes honorary degrees for Flynn and Giuliani",
    note:
        "Retired Lt. Gen. Michael Flynn and former New York City Mayor Rudy Giuliani "
        "had their honorary degrees revoked by the University of Rhode Island on Friday, "
        "the university announced.",
    numbers: "10",
  ),
  HomeContainer(
    avatorImagURL: "assets/images/logo/fox.png",
    name: "Fox News",
    time: "Published 7h ago",
    imagURL: "assets/images/images_4.png",
    title: "Coumboscuro: The Italian village that doesn't speak Italian",
    note:
        "Retired Lt. Gen. Michael Flynn and former New York City Mayor Rudy Giuliani "
        "had their honorary degrees revoked by the University of Rhode Island on Friday, "
        "the university announced.",
    numbers: "276",
  ),
];

List<MegazinContainer> container_0 = [
  MegazinContainer(
    avatorImagURL: "assets/images/megazin/link.png",
    name: "LinkUp",
    time: "Published 7h ago",
    imagURL: "assets/images/megazin/magazine_1.png",
    downSize: "1.96 MB",
    numbers: "276",
  ),
  MegazinContainer(
    avatorImagURL: "assets/images/megazin/link.png",
    name: "LinkUp",
    time: "Published 10h ago",
    imagURL: "assets/images/megazin/magazine_2.png",
    downSize: "2.67 MB",
    numbers: "76",
  ),
  MegazinContainer(
    avatorImagURL: "assets/images/megazin/link.png",
    name: "LinkUp",
    time: "Published 5h ago",
    imagURL: "assets/images/megazin/magazine_3.png",
    downSize: "5.0 MB",
    numbers: "2762",
  ),
  MegazinContainer(
    avatorImagURL: "assets/images/megazin/link.png",
    name: "LinkUp",
    time: "Published 1h ago",
    imagURL: "assets/images/megazin/magazine_4.png",
    downSize: "7.34 MB",
    numbers: "1276",
  ),
  MegazinContainer(
    avatorImagURL: "assets/images/megazin/link.png",
    name: "LinkUp",
    time: "Published 7h ago",
    imagURL: "assets/images/megazin/magazine_5.png",
    downSize: "2.11 MB",
    numbers: "27",
  )
];

List<ChannelCatagories> container_3 = [
  ChannelCatagories(
    imagURL: "assets/images/channel/addis.png",
    name: "EBS TV",
  ),
  ChannelCatagories(
    imagURL: "assets/images/channel/esat.png",
    name: "ESAT TV",
  ),
  ChannelCatagories(
    imagURL: "assets/images/channel/fana.png",
    name: "FANA TV",
  ),
  ChannelCatagories(
    imagURL: "assets/images/channel/nahoo.png",
    name: "NAHOO TV",
  ),
  ChannelCatagories(
    imagURL: "assets/images/channel/nahoo.png",
    name: "NAHOO TV",
  ),
  ChannelCatagories(
    imagURL: "assets/images/channel/nahoo.png",
    name: "NAHOO TV",
  ),
  ChannelCatagories(
    imagURL: "assets/images/channel/nahoo.png",
    name: "NAHOO TV",
  ),
  ChannelCatagories(
    imagURL: "assets/images/channel/nahoo.png",
    name: "NAHOO TV",
  ),
  ChannelCatagories(
    imagURL: "assets/images/channel/nahoo.png",
    name: "NAHOO TV",
  ),
];

List<ChannelCatagories> container_4 = [
  ChannelCatagories(
    imagURL: "assets/images/prefrence/bus.png",
    name: "Business",
  ),
  ChannelCatagories(
    imagURL: "assets/images/prefrence/sport.png",
    name: "Sports",
  ),
  ChannelCatagories(
    imagURL: "assets/images/prefrence/pol.png",
    name: "Politics",
  ),
  ChannelCatagories(
    imagURL: "assets/images/prefrence/hel.png",
    name: "Healths",
  ),
  ChannelCatagories(
    imagURL: "assets/images/prefrence/Ent.png",
    name: "Entertainments",
  ),
  ChannelCatagories(
    imagURL: "assets/images/prefrence/tech.png",
    name: "Technologys",
  ),
];
