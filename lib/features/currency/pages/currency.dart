import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:currencsee/features/currency/data/models/currency_model.dart';
import 'package:currencsee/features/currency/pages/bloc/cubit/currency_cubit.dart';

class CurrencyListScreen extends StatefulWidget {
  const CurrencyListScreen({Key? key}) : super(key: key);

  @override
  _CurrencyListScreenState createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends State<CurrencyListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CurrencyCubit>().loadCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency List'),
      ),
      body: BlocBuilder<CurrencyCubit, CurrencyState>(
        builder: (context, state) {
          if (state is CurrencyLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CurrencyLoaded) {
            final List<CountryInfoModel> countries = state.countries!;
            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final CountryInfoModel country = countries[index];
                return ListTile(
                  title: Text(country.name ?? ''),
                  subtitle: Text(country.code ?? ''),
                  onTap: () {
                    // Handle tap on country if needed
                  },
                );
              },
            );
          } else if (state is CurrencyError) {
            return Center(child: Text('Failed to load countries.'));
          } else {
            return Center(child: Text('Unknown state.'));
          }
        },
      ),
    );
  }
}
