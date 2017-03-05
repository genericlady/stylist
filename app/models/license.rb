class License < ApplicationRecord

  validates :full_name, presence: true
  validates :number, presence: true
  validates :state, presence: true

  has_attached_file :image, 
                     styles: { medium: "300x300>", thumb: "100x100>" },
                     default_url: "missing-image.png",
                     storage: :s3,
                     s3_credentials: Proc.new{ |a| a.instance.s3_credentials }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end
