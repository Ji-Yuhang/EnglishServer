class UnknownwordAction < Cramp::Action
  def start
    pa = params
    data = []
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
    finish
  end

  def get_by_id(word_id)
      get_detail word_id: word_id
  end
  def get_by_word(word)
      get_detail content: word
  end
  def get_detail (where)
      data = {}
      wordinfos = Wordlist.where where
      wordinfo = wordinfos.first
      if !wordinfo.nil?
          data["word_id"] = wordinfo.word_id
          data["content"] = wordinfo.content
      end
      data
  end
end
