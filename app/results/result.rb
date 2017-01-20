module Result
  module Base
    def image
      raise "Define a valid iamge url"
    end

    def title
      raise "Define title"
    end

    def subtitle
      raise "Define subtitle"
    end

    def locations
      raise "Define locations"
    end

    def rating
      raise "Define rating"
    end

    def total_reviews
      raise "Define total_reviews"
    end

    def locatable?
      false
    end
  end

end
