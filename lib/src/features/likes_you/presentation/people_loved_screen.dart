import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_me/src/common/style.dart';
import 'package:match_me/src/features/likes_you/presentation/bloc/people_loved/people_loved_bloc.dart';
import 'package:match_me/src/widgets/people_loved_card_widget.dart';

class PeopleLovedScreen extends StatefulWidget {
  static const String routeName = '/people-loved';
  const PeopleLovedScreen({super.key});

  @override
  State<PeopleLovedScreen> createState() => _PeopleLovedScreenState();
}

class _PeopleLovedScreenState extends State<PeopleLovedScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PeopleLovedBloc>().add(OnPeopleLovedEventCalled());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'People You\nLoved',
          style: getWhiteTextStyle(
            fontWeight: FontWeightManager.semiBold,
            fontSize: FontSizeManager.f20,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: AppSize.s28,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: AppSize.s30,
          ),
          BlocBuilder<PeopleLovedBloc, PeopleLovedState>(
            builder: (context, state) {
              if (state is PeopleLovedLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is PeopleLovedLoaded) {
                final users = state.userMatch;
                return users.isEmpty
                    ? Expanded(
                        child: Center(
                            child: Text(
                          'No People You Loved',
                          style: getWhiteTextStyle(),
                        )),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              return PeopleLovedCardWidget(
                                user: users[index],
                              );
                            }),
                      );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
