import 'dart:convert';
import 'dart:developer';
import 'package:currencsee/features/currency/data/models/currency_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit() : super(CurrencyInitial());

  List<dynamic>? jsonList;
  List<Country>? countries;
  Future<void> fetchCountries() async {
    try {
      emit(CurrencyLoading());
      String jsonString = await rootBundle
          .loadString('lib/features/currency/data/models/currency.json');
      jsonList = jsonDecode(jsonString);
      countries = jsonList!.map((json) => Country.fromJson(json)).toList();
      emit(CurrencyLoaded(countries));
    } catch (e) {
      log(e.toString());
      emit(CurrencyError());
    }
  }
}
