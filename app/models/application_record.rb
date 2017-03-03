class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def s3_credentials
    template = ERB.new File.new("config/s3.yml.erb").read
    s3 = YAML.load template.result(binding)
    s3[Rails.env]
  end

end
