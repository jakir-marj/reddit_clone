enum RouteName {
  root('/'),
  nav('/:pane(home|search|post|massage|notification)'),
  home('/home'),
  search('/search'),
  post('/post'),
  massage('/massage'),
  notification('/notification');

  final String path;
  const RouteName(this.path);
}
