class InsertWordAction < Cramp::Action
  def start
    pa = params
    wordcontent = pa[:word]
    data = {}
    begin
    word = Wordlist.new
    word.content = wordcontent
    word.save!
    data["word_id"] = word.word_id
    data["content"] = word.content
    rescue
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

class InsertFamiliarityAction < Cramp::Action
    def start
        pa = params
        word_id = pa[:word_id]
        data = {}
        fami = 0
        if !word_id.nil?
            uns = Unknownword.where word_id: word_id
            un = uns.first
            if un.nil?
                un = Unknownword.new
                un["word_id"] = word_id
            end
            un["familiarity"] = fami
            un.save!
            data["word_id"] = un["word_id"]
            data["familiarity"] = un["familiarity"]
        end
        render data.to_json
        finish
    end

end

class UpdateFamiliarityAction < Cramp::Action
    def start
        pa = params
        word_id = pa[:word_id]
        fami = pa[:familiarity]
        ap word_id
        ap fami
        data = {}
        if !word_id.nil? and !fami.nil?
            uns = Unknownword.where word_id: word_id
            un = uns.first
            if un.nil?
                un = Unknownword.new
                un["word_id"] = word_id
            end
            un["familiarity"] = fami
            un.save!
            data["word_id"] = un["word_id"]
            data["familiarity"] = un["familiarity"]
        end
        render data.to_json
        finish
    end
end
