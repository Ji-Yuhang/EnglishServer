# Check out https://github.com/joshbuddy/http_router for more information on HttpRouter
HttpRouter.new do
  add('/').to(HomeAction)
  add('/home').to(HomeAction)
  add('/user').to(UserAction)
end
