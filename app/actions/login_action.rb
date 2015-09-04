class LoginAction < Cramp::Action
  def start
    pa = params
    ap  pa
    username = pa[:username]
    password = pa[:password]
    uns = Users.where account: username
    if !uns.nil?
        un = uns.first
        data = un.to_json
        render data
    else
        data={}
        data[:result] = 0
    end
    uns.each do |un|
        one = {}
    end
=begin
    uns = Unknownword.where familiarity: 0
    uns.each do |un|
        one = {}
        one["word_id"] = un.word_id
        one["familiarity"] = un.familiarity
        begin
        wordinfo = Wordlist.find un.word_id
        one["content"] = wordinfo.content
        rescue
        end
    
        data.push one
    end
    render data.to_json
=end

    finish
  end
end
