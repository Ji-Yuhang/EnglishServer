require 'active_record'
ActiveRecord::Base.establish_connection :adapter => "mysql",
    :host => "rds1m2iqskhitpx6nmx7u.mysql.rds.aliyuncs.com",
    :database => "english",
    :username => "jiyuhang",
    :password => "jiyuhang8757871"

class Unknownword < ActiveRecord::Base
end
