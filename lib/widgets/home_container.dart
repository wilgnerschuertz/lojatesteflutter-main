import '../views/home/home_page_product.dart';
import 'failure.dart';
import 'p_error.dart';
import 'p_loading.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.repository,
    required this.onItemTap,
  }) : super(key: key);
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return PLoading();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomeProduct(
            list: snapshot.data!,
            onItemTap: onItemTap,
          );
        }
        if (snapshot.hasError) {
          return PError(
            error: (snapshot.error as Failure).message!,
          );
        }
        return Container();
      },
    );
  }
}
