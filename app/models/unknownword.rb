require 'mysql2'
require 'active_record'
ActiveRecord::Base.establish_connection :adapter => "mysql2",
    :host => "rds1m2iqskhitpx6nmx7u.mysql.rds.aliyuncs.com",
    :database => "english",
    :username => "jiyuhang",
    :password => "jiyuhang8757871"

class Unknownword < ActiveRecord::Base
end

class Users < ActiveRecord::Base
end
