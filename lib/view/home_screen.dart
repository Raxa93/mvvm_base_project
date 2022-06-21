import 'package:flutter/material.dart';
import 'package:mvvm_with_asif/data/response/status.dart';
import 'package:mvvm_with_asif/view/authentication/login_view.dart';
import 'package:mvvm_with_asif/view_model/home_view_model.dart';
import 'package:mvvm_with_asif/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMoviesList();
  }

  @override
  Widget build(BuildContext context) {
    var splashVm = Provider.of<UserViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                splashVm.logOut();
                Navigator.pushNamed(context, LoginView.routeName);
              },
              child: const Text('Log out'))
        ],
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, homeVm, _) {
          switch (homeVm.moviesList.status) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Text(homeVm.moviesList.message.toString());
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: homeVm.moviesList.data!.movies!.length,
                  itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      leading: Image.network(homeVm.moviesList.data!.movies![index].posterurl.toString(),
                        errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error,color: Colors.red);
                        }),
                      title: Text(homeVm.moviesList.data!.movies![index].title.toString()),
                      subtitle: Text(homeVm.moviesList.data!.movies![index].year.toString()),
                    ),
                  );
                  });
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [],
          );
        },
      ),
    );
  }

  Future getMoviesList() async {
    await Future.delayed(const Duration(seconds: 2));
    await Provider.of<HomeViewModel>(context, listen: false).fetchMovieList();
  }
}
