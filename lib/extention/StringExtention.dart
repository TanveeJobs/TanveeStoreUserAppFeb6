import 'package:html/dom.dart';
import 'package:html/parser.dart';

extension Str on String{
  // String get removeTags=>parse(this).children.map((e) => e.toString()).join();
  String get removeTags=>parse(this).documentElement!.text;
  double? get toDouble=>double.tryParse(this);
  int? get toInt=>int.tryParse(this);

  // String get removeTags=>parse(this).body!.outerHtml;
}