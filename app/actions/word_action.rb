class WordAction < Cramp::Action
    def start
        pa = params
        word = pa[:word]
        word_id = pa[:word_id]
        ap pa
        data = {}
        if !word_id.nil?
            data = get_by_id word_id
        elsif !word.nil? and !word.empty?
            data = get_by_word word
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
          uns = Unknownword.where word_id: wordinfo.word_id
          un = uns.first
          if !un.nil?
              data["familiarity"] = un.familiarity
          end
      end
      data
  end
end
