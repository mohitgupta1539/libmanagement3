import 'package:libmanagement/model/seat_layout_model.dart';

import '../model/crew_cast_model.dart';
import '../model/movie_model.dart';
// import '../model/offer_model.dart';
import '../model/theatre_model.dart';
import '../utils/mytheme.dart';

import '../model/ad_slider_model.dart';
import '../model/event_model.dart';
import '../model/menu_model.dart';
import '../utils/constants.dart';

List<AdSliderModel> sliderData = [
  AdSliderModel(
      url: "assets/slider_banner.png", redirectUrl: Constants.baseApiUrl),
  AdSliderModel(
      url: "assets/slider_banner.png", redirectUrl: Constants.baseApiUrl),
  AdSliderModel(
      url: "assets/slider_banner.png", redirectUrl: Constants.baseApiUrl),
];

List<MenuModel> menus = [
  MenuModel(name: "Novels", asset: "assets/icons/book-open-text.svg"),
  MenuModel(name: "Newspaper", asset: "assets/icons/newspaper.svg"),
  MenuModel(name: "UPSC/SSC", asset: "assets/icons/siren.svg"),
  MenuModel(name: "NEET", asset: "assets/icons/flask-conical.svg"),
  MenuModel(name: "JEE", asset: "assets/icons/sigma.svg"),
  MenuModel(
      name: "Programming", asset: "assets/icons/square-dashed-bottom-code.svg"),
];

// List<OfferModel> offers = [
//   OfferModel(
//     title: "Wait ! Grab FREE reward",
//     description: "Book your seats and tap on the reward box to claim it.",
//     expiry: DateTime(2022, 4, 15, 12),
//     startTime: DateTime(2022, 3, 15, 12),
//     discount: 100,
//     color: MyTheme.redTextColor,
//     gradientColor: MyTheme.redGiftGradientColors,
//   ),
//   OfferModel(
//     title: "Wait ! Grab FREE reward",
//     description: "Book your seats and tap on the reward box to claim it.",
//     expiry: DateTime(2022, 4, 15, 12),
//     startTime: DateTime(2022, 3, 15, 12),
//     discount: 100,
//     color: MyTheme.greenTextColor,
//     gradientColor: MyTheme.greenGiftGradientColors,
//     icon: "gift_green.svg",
//   ),
// ];

List<MovieModel> movies = [
  MovieModel(
    title: "For 24 hour Study",
    description: "For 1 day subscription ",
    actors: ["", ""],
    like: "Study",
    bannerUrl: "assets/movies/movie1.png",
  ),
  MovieModel(
    title: "For 7 Days",
    description: "For 7 days library subscription",
    actors: ["", ""],
    like: "Study",
    bannerUrl: "assets/movies/movie2.png",
  ),
  MovieModel(
    title: "For 15 Days",
    description: "for 15 days library subscription",
    actors: ["", " "],
    like: "Study",
    bannerUrl: "assets/movies/movie3.png",
  ),
  MovieModel(
    title: "For 1 month",
    description: "For 1 month membership",
    actors: ["", ""],
    like: "Study",
    bannerUrl: "assets/movies/movie4.png",
  ),
];

// List<EventModel> events = [
//   EventModel(
//     title: "Happy Halloween 2K19",
//     description: "Music show",
//     date: "date",
//     bannerUrl: "assets/events/event1.png",
//   ),
//   EventModel(
//     title: "Music DJ king monger Sert...",
//     description: "Music show",
//     date: "date",
//     bannerUrl: "assets/events/event2.png",
//   ),
//   EventModel(
//     title: "Summer sounds festiva..",
//     description: "Comedy show",
//     date: "date",
//     bannerUrl: "assets/events/event3.png",
//   ),
//   EventModel(
//     title: "Happy Halloween 2K19",
//     description: "Music show",
//     bannerUrl: "assets/events/event4.png",
//     date: "date",
//   ),
// ];

List<EventModel> plays = [
  EventModel(
    title: "Alex in wonderland",
    description: "book",
    date: "date",
    bannerUrl: "assets/plays/play1.png",
  ),
  EventModel(
    title: "Marry poppins puffet show",
    description: "book",
    date: "date",
    bannerUrl: "assets/plays/play2.png",
  ),
  EventModel(
    title: "Good People",
    description: "book",
    date: "date",
    bannerUrl: "assets/plays/play3.png",
  ),
  EventModel(
    title: "You're a good man- charlie Brown",
    description: "book",
    bannerUrl: "assets/plays/play4.png",
    date: "date",
  ),
];

List<String> cities = [
  "Gorakhpur",
];

List<CrewCastModel> crewCast = [
  CrewCastModel(
    movieId: "123",
    castId: "123",
    name: "Chadwick",
    image: "assets/actors/chadwick.png",
  ),
  CrewCastModel(
    movieId: "123",
    castId: "123",
    name: "Letitia Wright",
    image: "assets/actors/LetitiaWright.png",
  ),
  CrewCastModel(
    movieId: "123",
    castId: "123",
    name: "B. Jordan",
    image: "assets/actors/b_jordan.png",
  ),
  CrewCastModel(
    movieId: "123",
    castId: "123",
    name: "Lupita Nyong",
    image: "assets/actors/lupita_nyong.png",
  ),
];

List<TheatreModel> theatres = [
  TheatreModel(id: "1", name: "The Reader's Hub Library"),
  TheatreModel(id: "2", name: "INOX - Prozone mall"),
  // TheatreModel(id: "3", name: "Karpagam theatres - 4K Dolby Atoms"),
  // TheatreModel(id: "4", name: "KG theatres - 4K"),
];

List<String> facilityAsset = [
  // "assets/icons/cancel.svg",
  "assets/icons/parking.svg",
  // "assets/icons/cutlery.svg",
  // "assets/icons/rocking_horse.svg",
];

List<String> screens = [
  "3D",
  "2D",
];

final seatLayout = SeatLayoutModel(
    rows: 10,
    cols: 11,
    seatTypes: [
      {"title": "King", "price": 120.0, "status": "Filling Fast"},
      {"title": "Queen", "price": 100.0, "status": "Available"},
      // {"title": "Jack", "price": 80.0, "status": "Available"},
    ],
    theatreId: 123,
    gap: 2,
    gapColIndex: 5,
    isLastFilled: true,
    rowBreaks: [5, 3, 2]);

final List<int> s = [1];
