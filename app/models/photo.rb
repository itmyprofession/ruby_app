class Photo < ActiveRecord::Base
  belongs_to :album

  #validation
  validates :title, presence=>true
end
