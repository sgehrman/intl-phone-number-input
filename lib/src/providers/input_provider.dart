import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/src/models/country_model.dart';

class InputProvider extends ChangeNotifier {
  Country _country;
  List<Country> _countries;
  List<Widget> _items;
  bool _isNotValid;

  List<Widget> get items => _items ?? [];
  List<Country> get countries => _countries ?? [];
  bool get isNotValid => _isNotValid ?? false;
  Country get country => _country;

  void setup(
      {@required List<Country> countries,
      @required List<Widget> items,
      @required Country country}) {
    _items = items;
    _countries = countries;
    _country = country;

    // only called during initState and we can't mark dirty at that time
    // also the early refresh causes flicker and janky animations
    // notifyListeners();
  }

  set country(Country country) {
    _country = country;
    notifyListeners();
  }

  set isNotValid(bool isNotValid) {
    _isNotValid = isNotValid;
    notifyListeners();
  }
}
