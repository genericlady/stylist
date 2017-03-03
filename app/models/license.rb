class License < ApplicationRecord

  validates :expiration, presence: true
  validates :image, presence: true

  has_attached_file :image, 
                     styles: { medium: "300x300>", thumb: "100x100>" },
                     default_url: "/images/:style/missing.png",
                     storage: :s3,
                     s3_credentials: Proc.new{ |a| a.instance.s3_credentials }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end
