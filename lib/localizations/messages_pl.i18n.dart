// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'messages.i18n.dart';

String get _languageCode => 'pl';
String get _localeName => 'pl';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class Messages_pl extends Messages {
	const Messages_pl();
	MainMessages_pl get main => MainMessages_pl(this);
}

class MainMessages_pl extends MainMessages {
	final Messages_pl _parent;
	const MainMessages_pl(this._parent):super(_parent);
	String get title => """Pogoda""";
	String get ok => """OK""";
	String get location_permission_needed => """Permission needed""";
	String get location_permission_needed_description => """App needs location permission to get weather for your position. If you deny permissions again, app will load weather for DEMO position.""";
	String get demo_position => """DEMO position""";
}

