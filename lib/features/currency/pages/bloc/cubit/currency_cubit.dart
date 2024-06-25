import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:currencsee/features/currency/data/models/currency_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit() : super(CurrencyInitial(
   
  ));

 
  List<dynamic>? jsonList;
  List<Country>? countries;
  Future<void> fetchCountries() async {
    try {
      emit(CurrencyLoading());
      String jsonString = await File('currency.json').readAsString();
      jsonList = jsonDecode(jsonString);
      countries = jsonList!.map((json) => Country.fromJson(json)).toList();
      emit(CurrencyLoaded(countries));
    } catch (e) {
      log(e.toString());
      emit(CurrencyError());
    }
  }
}
