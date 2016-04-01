class News < ActiveRecord::Base
  has_attached_file :photo,
  :styles => { :carousel => "200x1200", :thumb => "100x100>", :teste => "150x1200" },
  :default_url => "/images/:style/missing.png"
  belongs_to :user

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
