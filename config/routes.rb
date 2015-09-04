# Check out https://github.com/joshbuddy/http_router for more information on HttpRouter
HttpRouter.new do
  add('/').to(HomeAction)
  add('/home').to(HomeAction)
  add('/user').to(UserAction)
  add('/login').to(LoginAction)
  add('/word').to(WordAction)
  add('/insertword').to(InsertWordAction)
  add('/insertfamiliarity').to(InsertFamiliarityAction)
  add('/updatefamiliarity').to(UpdateFamiliarityAction)
  add('/allunknown').to(UnknownwordAction)
end
