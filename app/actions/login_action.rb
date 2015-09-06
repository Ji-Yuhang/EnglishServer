class LoginAction < Cramp::Action
    def respond_with
      [201, {'Content-Type' => 'application/json'}]
    end
  def start
    pa = params
    ap  pa
    username = pa[:username]
    password = pa[:password]

    data = {}
    uns = Users.where account: username ,password: password
    un = uns.first
    if !un.nil?
        account = un.account
        uuid = un.uuid
        user_id = un.user_id
        data[:data]={}
        data[:data][:account] = account
        data[:data][:uuid] = uuid
        data[:data][:userID] = user_id
        data[:msg]="SUCCESS"
        data[:status_code]=1
    else
        data[:msg]="FAIL"
        data[:status_code]=0
    end
    ap data
    render data.to_json

    finish
  end
end
