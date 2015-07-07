require "awesome_print"
require "minitest/autorun"
require "open-uri"
require 'net/https'
require 'uri'

class ApiTest < MiniTest::Test
  def setup
    #@uri = "http://101.200.174.36:3000/ichat/cgi/"
    @uri = "http://0.0.0.0:3000/user"
  end

  def test_api
    params = {}  
    params["name"] = 'Tom'  
    uri = URI.parse(@uri)
    res = Net::HTTP.post_form(uri, params)   
    #返回的cookie  
    ap res.header['set-cookie']  
    #返回的html body  
    ap res.body  
    #assert_equal "This is #{actionname}!", text
  end

end
