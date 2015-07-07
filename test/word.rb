#!/usr/bin/env ruby
require 'active_record'
require 'awesome_print'
require './article'

ActiveRecord::Base.establish_connection :adapter => "mysql",
    :database => "rds1m2iqskhitpx6nmx7u.mysql.rds.aliyuncs.com",
    :username => "jiyuhang",
    :password => "jiyuhang8757871"

class Articles < ActiveRecord::Base
end

class Wordlists < ActiveRecord::Base
end

Wordlists.all.each do |one|
    ap one.content
end


