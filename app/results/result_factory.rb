module ResultFactory

  def self.new_result(result)
    if user?(result)
      BeautyProviderResult.new(result)
    elsif service?(result)
      ServiceResult.new(result)
    end
  end

  private
  def self.service?(result)
    !result["service"].nil?
  end

  def self.user?(result)
    !result["user"].nil?
  end

end
