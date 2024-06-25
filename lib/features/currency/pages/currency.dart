import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:currencsee/core/constants/exports.dart';
import 'package:currencsee/features/currency/data/models/currency_model.dart'; // Adjust path as per your project
import 'package:currencsee/features/currency/pages/bloc/cubit/currency_cubit.dart';

class CurrencyListScreen extends StatefulWidget {
  const CurrencyListScreen({super.key});

  @override
  CurrencyListScreenState createState() => CurrencyListScreenState();
}

class CurrencyListScreenState extends State<CurrencyListScreen> {
  late Future<void> futureCurrencies;
  List<Country> filteredCurrencies = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final currencyCubit = context.read<CurrencyCubit>();
    futureCurrencies = currencyCubit.fetchCountries();
  }

  void filterCurrencies(String query) {
    final filtered = filteredCurrencies.where((currency) {
      final nameLower = currency.countryName!.toLowerCase();
      final codeLower = currency.code!.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower) || codeLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredCurrencies = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter', style: GoogleFonts.notoSans()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              cursorColor: Appcolors.blackColor,
              controller: searchController,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Appcolors.blackColor),
                hintStyle: TextStyle(color: Appcolors.blackColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Appcolors.blackColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Appcolors.blackColor),
                ),
                prefixIcon: const Icon(Icons.search),
                labelText: 'Change currency',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Appcolors.blackColor),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: filterCurrencies,
            ),
          ),
          Expanded(
            child: BlocBuilder<CurrencyCubit, CurrencyState>(
              builder: (context, state) {
                if (state is CurrencyLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CurrencyError) {
                  return const Center(child: Text('Error fetching currencies.'));
                } else if (state is CurrencyLoaded) {
                  filteredCurrencies = state.countries!;
                  return ListView.builder(
                    itemCount: filteredCurrencies.length,
                    itemBuilder: (context, index) {
                      final currency = filteredCurrencies[index];
                      return Column(
                        children: [
                          ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: SvgPicture.network(
                                currency.flag ?? '',
                                width: 32.w,
                                height: 32.h,
                                placeholderBuilder: (context) =>
                                    const CircularProgressIndicator(),
                              ),
                            ),
                            title: Text(
                              currency.code ?? '',
                              style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              currency.countryName ?? '',
                              style: GoogleFonts.notoSans(),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Appcolors.blackColor,
                              size: 25.sp,
                            ),
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No data available.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
