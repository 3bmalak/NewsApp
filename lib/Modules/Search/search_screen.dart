import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/News_App/Cubit/cubit.dart';
import 'package:newsapp/Layout/News_App/Cubit/states.dart';
import 'package:newsapp/Shared/Components/Component.dart';


class Search extends StatelessWidget {
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsAppCubit,NewsAppStates >(
      listener: (context, state) {

      },
      builder: (context, state) {
        var list=NewsAppCubit.get(context).search;

        return  Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                DefaultTFF(
                  Controller: searchController,
                  Keyboard: TextInputType.text,
                  Validate: (value) {
                    if(value!.isEmpty )
                      print('Search must not be empty ');
                    return null;
                  },
                  PrefixIcon: Icons.search,
                  Label: 'search',
                  OnChange:(value) {
                 NewsAppCubit.get(context).getSearchData(value);
                  },
                ),


               Expanded(child: articleBuilder(list ,context)),
              ],
            ),
          ),

        );
      },
    );
  }
}
