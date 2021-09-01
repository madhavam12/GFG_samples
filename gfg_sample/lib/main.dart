import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'providers/providers.dart' as providers;

void main() {
  runApp(ProviderScope(child: HomeScreenS()));
}

class HomeScreenS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("StreamProvider Demo"),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(
                  builder: (context, watch, child) {
                    final streamValue = watch(providers.streamProvider);

                    return streamValue.when(
                      data: (data) => Text(
                        '${data}',
                      ), // have data
                      loading: () => Column(
                        children: [
                          CircularProgressIndicator(),
                          Text(
                            'Fetching data',
                          ),
                        ],
                      ), //in progress
                      error: (message, e) =>
                          Text(message.toString()), // has an error
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreenF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("FutureProvider Demo"),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(
                  builder: (context, watch, child) {
                    final futureData = watch(providers.response);

                    return futureData.map(
                      data: (data) => Text(
                        '${data.value}',
                      ), // have data
                      loading: (_) => Column(
                        children: [
                          CircularProgressIndicator(),
                          Text(
                            'Fetching data',
                          ),
                        ],
                      ), //in progress
                      error: (message) =>
                          Text(message.error.toString()), // has an error
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Home extends ConsumerWidget {
  int n = 0;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // Listens to the value exposed by userNameProvider
    StateController<String> nameController = watch(providers.userNameProvider);

    // ".state" method lets you get the state easily & directly
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            n++;
            nameController.state =
                "New Name $n"; // now you can set the state using the state setter.
          },
        ),
        appBar: AppBar(title: Center(child: const Text('GFG :) '))),
        body: Center(
          child: Text(
            '${nameController.state}',
          ), //displaying the value
        ),
      ),
    );
  }
}
