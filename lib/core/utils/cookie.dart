import 'dart:html';

final cookie = document.cookie!;
final entity = cookie.split("; ").map((item) {
  final split = item.split("=");
  return MapEntry(split[0], split[1]);
});

class ApplicationCookie {
  final cookieMap = Map.fromEntries(entity);
}
