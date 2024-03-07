import 'package:blablagithub/components/morph_container.dart';
import 'package:blablagithub/constants/app_colors.dart';
import 'package:blablagithub/constants/app_images.dart';
import 'package:blablagithub/dependency_injection.dart';
import 'package:blablagithub/enums/api_type.dart';
import 'package:blablagithub/src/domain/home/entities/search_options_entity.dart';
import 'package:blablagithub/src/domain/home/entities/search_result_entity.dart';
import 'package:blablagithub/src/presentation/app/bloc/app_bloc.dart';
import 'package:blablagithub/src/presentation/home/bloc/home_bloc.dart';
import 'package:blablagithub/src/presentation/home/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late HomeBloc homeBloc;
  late AppBloc appBloc;
  final TextEditingController _controller = TextEditingController();
  bool _showSettings = false;
  int currentPage = 0;

  ApiType currentApiType = ApiType.REST;

  SearchResultEntity? lastResult;

  @override
  void initState() {
    homeBloc = locator<HomeBloc>();
    appBloc = BlocProvider.of<AppBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    homeBloc.close();
    super.dispose();
  }

  Widget _buildSearchOptions() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.black),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                currentApiType = currentApiType == ApiType.REST
                    ? ApiType.GRAPHQL
                    : ApiType.REST;
              });
            },
            child: Text(
              '$currentApiType',
              style: const TextStyle(color: MyColors.black),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _controller.text = _controller.text + r" cat stars:>100";
                    },
                    child: const Text('cat stars:>100'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _controller.text = _controller.text + r" language:";
                    },
                    child: const Text('language:'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _controller.text = _controller.text + r" fork:only";
                    },
                    child: const Text('fork:only'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _controller.text =
                          _controller.text + r" pushed:<2024-01-12";
                    },
                    child: const Text('pushed:<2024-01-12'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.primary,
      body: BlocConsumer(
        bloc: homeBloc,
        listener: (context, state) {
          if (state is SuccessHomeState) {
            setState(() {
              lastResult = state.items;
            });
          }
          if (state is FailureHomeState) {}
          if (state is LoadingHomeState) {}
        },
        builder: (context, state) {
          if (state is FailureHomeState) return Container();
          return Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        appBloc.add(LogoutAppEvent());
                      },
                      child: const Icon(Icons.logout),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: MorphContainer(
                        width: double.infinity,
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _controller,
                                  style: const TextStyle(fontSize: 20),
                                  onSubmitted: (_) {
                                    if (_controller.text.isNotEmpty) {
                                      homeBloc.add(SearchGitHubEvent(
                                        query: SearchQueryEntity(
                                          query: _controller.text,
                                          type: currentApiType,
                                        ),
                                      ));
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (_controller.text.isNotEmpty) {
                                    homeBloc.add(SearchGitHubEvent(
                                      query: SearchQueryEntity(
                                        query: _controller.text,
                                        type: currentApiType,
                                      ),
                                    ));
                                  }
                                },
                                child: SizedBox(
                                  width: 22,
                                  child: Image.asset(AppImages.search),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MorphContainer(
                  height: 30,
                  width: double.infinity,
                  onPressed: () {
                    setState(() {
                      _showSettings = !_showSettings;
                    });
                  },
                  child: const Icon(Icons.settings)),
              if (_showSettings)
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: _buildSearchOptions(),
                ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (state is LoadingHomeState)
                          const CircularProgressIndicator(),
                        if (state is SuccessHomeState) buildBody(state.items),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildBody(SearchResultEntity searchEntity) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: searchEntity.items.length,
      itemBuilder: (context, index) {
        return _buildRepositoryCard(searchEntity.items[index]);
      },
    );
  }

  Widget _buildRepositoryCard(SearchResultItem searchResultItem) {
    return RepositoryCard(
      searchResultItem: searchResultItem,
    );
  }
}
