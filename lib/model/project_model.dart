class Project {
  final String name;
  final String description;
  final String image;
  final String link;
  Project(this.name, this.description, this.image, this.link);
}

List<Project> projectList = [
  Project(
    'Treepps',
    'Ride-Hailing & Logistics Aggregator Platform\nDeveloped customer and driver applications for ride booking and parcel delivery with real-time tracking, in-app communication, secure payments, and navigation features.\n\nTechnologies: Flutter, Dart, Riverpod, Retrofit, Social Auth, Agora RTC (Voice Call), Flutter CallKit, VoIP Calling, Stripe, Google Maps, Socket.io, Push Notifications',
    'assets/images/car.png',
    'https://github.com/princehirpara-eww/Treepps',
  ),
  Project(
    'Beyati',
    'Container Rental Aggregator Platform\nDeveloped customer, driver, and vendor applications for container rental and waste management operations with real-time tracking, barcode scanning, payment processing, and fleet management.\n\nTechnologies: Flutter, Dart, Riverpod, Retrofit, Dio, Moyasar Pay, Multi-Language RTL (English/Arabic/Urdu), Google Maps (Live Tracking), Socket.io, Barcode/QR Scanner, Firebase Push Notifications',
    'assets/images/task.png',
    'https://github.com/princehirpara-eww/Beyati',
  ),
  Project(
    'Masari',
    'Carpooling & Rental Ride Platform\nDeveloped customer and driver applications for carpooling and rental services featuring ride scheduling, live tracking, wallet management, chat, call masking, and payment integration.\n\nTechnologies: Android, Kotlin, Google Maps API, Push Notifications, Real-time Chat Module, Call Masking, PayTabs Pay, KYC Flow, Ride Scheduling, Wallet & Earnings',
    'assets/images/chat.png',
    'https://github.com/princehirpara-eww/Masari',
  ),
  Project(
    'YaY Ride',
    'Bus Reservation & Route Management Platform\nDeveloped passenger and driver applications for bus ticket booking, seat reservation, route management, live bus tracking, and transportation company operations.\n\nTechnologies: Android, Jetpack Compose, MVVM, Coroutines, REST API, Google Maps, Wallet, Firebase Crashlytics, Chat, Push Notifications, KYC Verification, Dynamic Route Request, Passenger Boarding Verification',
    'assets/images/cui.png',
    'https://github.com/princehirpara-eww/YaY-Ride',
  ),
];
