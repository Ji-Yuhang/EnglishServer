class HomeAction < Cramp::Action
  def start
    pa = params
    ap pa
    render "Hello World!"
    finish
  end
end
