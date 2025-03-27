import 'package:flutter/material.dart';
import 'package:flutter_learnings/core/router/router_name.dart';
import 'package:go_router/go_router.dart';

class FeaturePage extends StatelessWidget {
  const FeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = ['Stream Data'];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Welcome to Dashboard")),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: Colors.grey.shade200,
              title: Text(list[index]),
              onTap: () {
                navigateToNextPage(list[index], context);
              },
            );
          },
        ),
      ),
    );
  }

  navigateToNextPage(String name, BuildContext context) {
    if (name case 'Stream Data') {
      context.pushNamed(RouteName.streamData);
    }
  }
}
