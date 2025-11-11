enum ItemAction {
  none,
  fetch,
  add,
  update,
  delete;

  bool get isNone => this == ItemAction.none;
  bool get isFetch => this == ItemAction.fetch;
  bool get isAdd => this == ItemAction.add;
  bool get isUpdate => this == ItemAction.update;
  bool get isDelete => this == ItemAction.delete;
}
