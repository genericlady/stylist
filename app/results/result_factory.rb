module ResultFactory

  def self.new_result(result_hash)
    case r.class
    when Service
      ServiceResult.new(result)
    when User
      BeautyProviderResult.new(result)
    end
  end

  private
  def user?(result_hash)
  end

  def service(result_hash)
  end

end
