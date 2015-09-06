require "awesome_print"
require "minitest/autorun"
require "open-uri"
require 'net/https'
require 'uri'

class ApiTest < MiniTest::Unit::TestCase
  def setup
    #@uri = "http://101.200.174.36:3000/ichat/cgi/"
    @uri = "http://iamyuhang.com:3000/login"
  end

  def test_api
    params = {}  
    params["username"] = 'jiyuhang110'  
    params["username"] = 'jiyuhang110'  
    uri = URI.parse(@uri)
    res = Net::HTTP.post_form(uri, params)   
    #返回的cookie  
    #ap res.header['set-cookie']  #返回的html body  
    ap res.body  
    #assert_equal "This is #{actionname}!", text
  end

end
    ap res.header['set-cookie']  
