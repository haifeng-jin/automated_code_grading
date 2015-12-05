class ExecuteResult
  def initialize
    @score = ""
    @message = ""
    @has_message = false
    @judgement = ""
  end
  
  def set_message(message)
    @message = message
    if (message == "")
      @has_message = false
    else
      @has_message = true
    end
  end

  def set_judgement(judgement)
    @judgement = judgement
  end

  def has_message?
    @has_message
  end

  def get_message
    @message
  end

  def set_score(score)
    @score = score
  end

  def get_score
    @score.to_s
  end

  def get_judgement
    @judgement
  end
end
