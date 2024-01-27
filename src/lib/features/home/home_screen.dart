import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/features/home/bloc/home_bloc.dart';
import 'package:src/ui/components.dart';
import 'package:src/ui/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              AppColors.mainColor,
              AppColors.darkColor,
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is HomeFailure) {
            log("Error - ${state.error}");
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.phonelink_erase_rounded,
                    size: 40,
                    color: Colors.white70,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Ooops... Something went wrong!',
                    style: AppTextStyle.bodyTextStyle,
                  ),
                ],
              ),
            );
          }

          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainQuoteComponent(
                  title: AppStrings.quote,
                  icon: Icons.edit_note,
                  text: state.data?['quote'] ?? '-',
                  textStyle: AppTextStyle.quoteTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MainQuoteComponent(
                        title: AppStrings.author,
                        icon: Icons.person,
                        text: state.data?['author'] ?? '-',
                        textStyle: AppTextStyle.quoteSecondTextStyle,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: MainQuoteComponent(
                        title: AppStrings.from,
                        icon: Icons.bookmark,
                        text: state.data?['from'] ?? '-',
                        textStyle: AppTextStyle.quoteTextStyle,
                      ),
                    ),
                  ],
                )
              ],
            );
          }
          return Center(
            child: Text(
              'Generate random Quote',
              textAlign: TextAlign.left,
              style: AppTextStyle.mainTextStyle,
            ),
          );
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        elevation: 10,
        onPressed: () {
          BlocProvider.of<HomeBloc>(context).add(GetData());
        },
        child: Center(
          child: Icon(
            CupertinoIcons.wand_stars,
            color: Colors.yellow.shade700,
            size: 25,
          ),
        ),
      ),
    );
  }
}
