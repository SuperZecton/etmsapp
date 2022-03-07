# 1TPT ETMS Project
_Created by LTC Project Team_
# Documentation
Project structure consists of features, each feature has a set of
- View
- View Model
- Model

## View
Each Page will typically be a stateless widget with a main build() function
The first descendent must always be a ViewModelBuilder. Each Page can only be linked to 1 view model, and vice versa.
Basic Page Structuring
```sh
class BasicPage extends StatelessWidget {
  const BasicPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModel>.reactive(
        viewModelBuilder: () => ViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
            ),
          );
        });
  }
}
```

### Routing
In order to add a page to the router, just add on to the Router.dart file under core/config
```sh
class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/newPage':
        return MaterialPageRoute(builder: (_) => NewPage());
        <<<< Just add a new case here
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                    body: Center(
                  child: Text('No route defined for ${settings.name}'),
                )));
    }
  }
}
```

In order to navigate between pages, use Navigator.pushNamed(context, '/') where '/' is the name of the case.

### Widgets
Widgets come in two types, either a global widget which can be found under core/widgets, or local widgets that can be found under features/view/widgets.
Global widgets will come with parameters you can fill out and can be used universally, while local widgets will typically extend ViewModelWidget.
The difference is that local widgets have specific bindings to the view model, usually to get and display data from the db.

####ViewModelWidget
```sh
class LocalWidget extends ViewModelWidget<ViewModel> {
    Widget build(BuildContext context, ViewModel model){
        return Container();
    }
    
}
```
This allows the widget to get local variables directly from the view model, as well as on initialize functions.


## View Model
The main type of view model is the BaseViewModel
It comes with a initalise() function that you can @override to call on model ready.
```sh
return ViewModelBuilder<AfterLoginViewModel>.reactive(
        viewModelBuilder: () => AfterLoginViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) {}
```

### MultipleFutureViewModel
Use this view model if you need to get data from the db and display it.




#### Project Credits
App Created by Damon and Jovan
Additional help by Aaron, Darren, Hizai, Junaid, Gregory
