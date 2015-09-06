require 'uuid'
class RegisterAction < Cramp::Action
  def start
    pa = params
    ap  pa
    username = pa[:username]
    password = pa[:password]

    data = {}
    un = Users.new
    un.account = username
    un.password = password
    un.uuid = UUID.generate
    un.save!

    tablename = "words_"+un.user_id.to_s
    unless ActiveRecord::Base.connection.table_exists?(tablename)
        ActiveRecord::Base.connection.create_table(tablename,primary_key:'unknown_id') do |t|
            t.column :word_id, :integer
            t.column :is_known, :integer
            t.column :familiarity, :integer
            t.column :create_time, :timestamp
            t.column :update_time, :timestamp
        end
    end
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
