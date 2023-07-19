import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_me/src/common/style.dart';
import 'package:match_me/src/features/authentication/data/data_user_account_local.dart';
import 'package:match_me/src/features/authentication/domain/user_account.dart';
import 'package:match_me/src/features/likes_you/presentation/bloc/explore_people/explore_people_bloc.dart';
import 'package:match_me/src/features/likes_you/presentation/bloc/people_loved/people_loved_bloc.dart';
import 'package:match_me/src/widgets/explore_people_app_bar_widget.dart';
import 'package:match_me/src/widgets/explore_people_button_widget.dart';
import 'package:match_me/src/widgets/match_card_widget.dart';

class ExplorePeopleScreen extends StatefulWidget {
  static const String routeName = '/explore_people';
  const ExplorePeopleScreen({super.key});

  @override
  State<ExplorePeopleScreen> createState() => _ExplorePeopleScreenState();
}

class _ExplorePeopleScreenState extends State<ExplorePeopleScreen> {
  UserAccount? userAccount;
  final cardController = AppinioSwiperController();

  void getDataUserAccount() async {
    final data = await DataUserAccountLocal.getDataUserAccountFromStorage();
    final result = UserAccount.fromMap(data);
    userAccount = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    context.read<ExplorePeopleBloc>().add(OnExplorePeopleEventCalled());
    getDataUserAccount();
  }

  @override
  void dispose() {
    cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p40,
          horizontal: AppPadding.p24,
        ),
        child: Column(
          children: [
            ExplorePeopleAppBarWidget(
              imagePath: userAccount?.imagePath,
            ),
            const SizedBox(
              height: AppSize.s50,
            ),
            BlocBuilder<ExplorePeopleBloc, ExplorePeopleState>(
              builder: (context, state) {
                if (state is ExplorePeopleLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ExplorePeopplLoaded) {
                  final users = state.result;
                  List<Widget> cards = [];
                  for (var user in users) {
                    cards.add(MatchCardWidget(user: user));
                  }
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: AppinioSwiper(
                            direction: AppinioSwiperDirection.top,
                            controller: cardController,
                            onSwipe:
                                (int index, AppinioSwiperDirection direction) {
                              if (direction == AppinioSwiperDirection.top) {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      'Yey!, you matched with ${users[index].fullName}!'),
                                ));

                                if (direction != AppinioSwiperDirection.left &&
                                    direction != AppinioSwiperDirection.right &&
                                    direction !=
                                        AppinioSwiperDirection.bottom) {
                                  context
                                      .read<PeopleLovedBloc>()
                                      .add(AddPeopleLoved(
                                        user: users[index],
                                      ));
                                }
                              }
                            },
                            onEnd: () {
                              context.read<ExplorePeopleBloc>().add(
                                    OnExplorePeopleEventCalled(),
                                  );
                            },
                            padding: EdgeInsets.zero,
                            cards: cards,
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s50,
                        ),
                        ExplorePeopleButtonWidget(
                          controller: cardController,
                        )
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
