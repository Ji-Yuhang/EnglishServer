class UserAction < Cramp::Action
  def start
    pa = params
    ap  pa
    render pa
    finish
  end
end
