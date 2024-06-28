import 'dart:convert';
import 'dart:developer';
import 'package:currencsee/features/currency/data/models/currency_model.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit() : super(CurrencyInitial());
  CountryInfoModel getCountries = CountryInfoModel();
  List<CountryInfoModel> countries = [];
  CountryInfoModel selectedCountry = CountryInfoModel(
      code: "AUD",
      exchangeRate: 1.8156,
      name: "Australian Dollars",
      symbol: "\$",
      displaySymbolOnRight: false);
  CountryInfoModel targetCountry = CountryInfoModel(
      code: "USD",
      exchangeRate: 1.0,
      name: "United States Dollars",
      symbol: "\$",
      displaySymbolOnRight: false);

  Future<void> loadCountries() async {
    emit(CurrencyLoading());
    try {
      final response =
          await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        countries =
            data.map((country) => CountryInfoModel.fromJson(country)).toList();
        await fetchExchangeRates();
        emit(CurrencyLoaded(countries));
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      log(e.toString());
      emit(CurrencyError());
    }
  }

  Future<void> fetchExchangeRates() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.exchangeratesapi.io/latest'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final rates = data['rates'] as Map<String, dynamic>;

        countries = countries.map((country) {
          if (rates.containsKey(country.code)) {
            country.exchangeRate = rates[country.code];
          }
          return country;
        }).toList();
        emit(CurrencyLoaded(countries));
      } else {
        throw Exception('Failed to fetch exchange rates');
      }
    } catch (e) {
      log(e.toString());
      emit(CurrencyError());
    }
  }

  void changeCountry({required CountryInfoModel country}) {
    emit(CurrencyLoading());
    selectedCountry = country;
    emit(CurrencyLoaded(countries));
  }

  void resetCountry() {
    emit(CurrencyLoading());
    selectedCountry = CountryInfoModel(
        code: "INR",
        exchangeRate: 50.0000,
        name: "United States Dollars",
        symbol: "\$",
        displaySymbolOnRight: false);
    emit(CurrencyLoaded(countries));
  }

  double convert(double amount) {
    return (amount / selectedCountry.exchangeRate!) *
        targetCountry.exchangeRate!;
  }

  void changeTargetCountry({required CountryInfoModel country}) {
    emit(CurrencyLoading());
    targetCountry = country;
    emit(CurrencyLoaded(countries));
  }
}
