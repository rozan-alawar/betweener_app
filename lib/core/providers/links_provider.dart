import 'package:flutter/cupertino.dart';
import '../models/link_model.dart';
import '../repository/link_repository.dart';
import '../services/api_response.dart';

class LinkProvider extends ChangeNotifier {
  late LinkRepository _linkRepository;

  late ApiResponse<List<Link>> _linkList;

  ApiResponse<List<Link>> get linkList => _linkList;

  LinkProvider() {
    _linkRepository = LinkRepository();
    fetchLinkList();
  }

  fetchLinkList() async {
    _linkList = ApiResponse.loading('Fetching Links');
    notifyListeners();
    try {
      List<Link> links = await _linkRepository.fetchLinkList(
        onSuccess: (response) {},
      );
      _linkList = ApiResponse.completed(links);
      notifyListeners();
    } catch (e) {
      _linkList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
