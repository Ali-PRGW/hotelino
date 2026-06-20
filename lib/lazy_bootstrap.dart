// ignore: non_constant_identifier_names
Future<void> LazyBootstrap() async {
  // Simulate some asynchronous initialization work like get post from api , sms , notificaton
  await Future.delayed(const Duration(seconds: 2));
}