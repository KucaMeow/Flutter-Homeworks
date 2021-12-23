// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_data.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MessageStateManager on _MessageStateManager, Store {
  final _$dataAtom = Atom(name: '_MessageStateManager.data');

  @override
  ObservableList<Message> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableList<Message> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$loadDataAsyncAction = AsyncAction('_MessageStateManager.loadData');

  @override
  Future<dynamic> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  final _$sendMessageAsyncAction =
      AsyncAction('_MessageStateManager.sendMessage');

  @override
  Future<dynamic> sendMessage(Message msg) {
    return _$sendMessageAsyncAction.run(() => super.sendMessage(msg));
  }

  final _$_MessageStateManagerActionController =
      ActionController(name: '_MessageStateManager');

  @override
  void addMessage(Message msg) {
    final _$actionInfo = _$_MessageStateManagerActionController.startAction(
        name: '_MessageStateManager.addMessage');
    try {
      return super.addMessage(msg);
    } finally {
      _$_MessageStateManagerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setData(List<Message> list) {
    final _$actionInfo = _$_MessageStateManagerActionController.startAction(
        name: '_MessageStateManager.setData');
    try {
      return super.setData(list);
    } finally {
      _$_MessageStateManagerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
