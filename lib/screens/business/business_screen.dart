import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/components/custom_divider.dart';
import 'package:new_app/components/custom_list_item.dart';
import 'package:new_app/screens/business/cubit/business_cubit.dart';
import 'package:new_app/screens/business/cubit/business_states.dart';
import 'package:new_app/sharing/style/size_config.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessCubit, BusinessStates>(
      listener: (context, state) {},
      builder: (context, state) {
        BusinessCubit cubit = BusinessCubit.get(context);
        return cubit.newsModel != null
            ? ListView.separated(
                itemBuilder: (context, index) {
                  return BuildCustomListItem(
                      cubit.newsModel!.articles![index]);
                },
                separatorBuilder: (context, index) {
                  return CustomDivider();
                },
                itemCount: cubit.newsModel!.articles!.length)
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
