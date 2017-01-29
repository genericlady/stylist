module ResultFactory
  def self.run(results)
    results.map do |result|
      create_result(result)
    end
  end

  private
  def self.create_result(result)
    case r.class
    when Service
      ServiceResult.new(result)
    when User
      BeautyProviderResult.new(result)
    end
  end
end
