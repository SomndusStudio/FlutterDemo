import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:tp_twitter/helper/app-alert-mgr.dart';
import 'package:tp_twitter/home/components/footer.dart';
import 'package:tp_twitter/home/components/header.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:tp_twitter/home/components/tweet-card.dart';
import 'package:tp_twitter/home/components/tweet.dart';
import 'package:tp_twitter/home/viewmodels/message-viewmodel.dart';

import '../auth/auth-context.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MessageViewModel viewModel;

  /**
   * Va appeler l'api
   */
  void callApi(BuildContext context) async {
    viewModel.callApi(context);
  }

  @override
  void initState() {
    super.initState();
    viewModel = MessageViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("title-message".i18n()),
        ),
        body: ChangeNotifierProvider(
          create: (context) => viewModel,
          child: Column(
            children: [
              HeaderComponent(),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => callApi(context),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("button-refresh".i18n()),
                            ),
                          ),
                        )),
                    Expanded(
                      child: Consumer<MessageViewModel>(
                          builder: (context, viewModel, child) {
                        return ListView.builder(
                            itemCount: viewModel.tweets.length,
                            itemBuilder: (BuildContext context, int index) {
                              return TweetCard(viewModel.tweets[index]);
                            });
                      }),
                    ),
                  ],
                ),
              ),
              FooterComponent(),
            ],
          ),
        ));
  }
}
